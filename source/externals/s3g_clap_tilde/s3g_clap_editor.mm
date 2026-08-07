#include "s3g_clap_editor.h"

#include <clap/ext/gui.h>

#import <AppKit/AppKit.h>

#include <algorithm>
#include <cmath>
#include <new>

struct S3GClapEditor;

@interface S3GClapWindowDelegate : NSObject <NSWindowDelegate> {
@public
    S3GClapEditor* owner;
}
@end

struct S3GClapEditor {
    const clap_plugin_t* plugin = nullptr;
    const clap_plugin_gui_t* gui = nullptr;
    NSWindow* window = nil;
    S3GClapWindowDelegate* delegate = nil;
    bool created = false;
    bool floating = false;
    bool visible = false;
    bool resizable = false;
    bool changingSize = false;

    ~S3GClapEditor() { destroy(); }

    bool initialize(const std::string& title, std::string& error)
    {
        if (!plugin || !plugin->get_extension) {
            error = "plugin instance is unavailable";
            return false;
        }
        gui = static_cast<const clap_plugin_gui_t*>(
            plugin->get_extension(plugin, CLAP_EXT_GUI));
        if (!gui || !gui->is_api_supported || !gui->create
            || !gui->destroy || !gui->show || !gui->hide) {
            error = "plugin does not expose a usable CLAP GUI";
            return false;
        }

        const bool supportsEmbedded = gui->is_api_supported(plugin,
            CLAP_WINDOW_API_COCOA, false);
        const bool supportsFloating = gui->is_api_supported(plugin,
            CLAP_WINDOW_API_COCOA, true);
        if (!supportsEmbedded && !supportsFloating) {
            error = "plugin does not support a Cocoa CLAP GUI";
            return false;
        }

        // Embedding is the standard CLAP path and works with plugins that do
        // not create their own native top-level window.
        floating = !supportsEmbedded;
        if (!gui->create(plugin, CLAP_WINDOW_API_COCOA, floating)) {
            error = "plugin refused to create its CLAP GUI";
            return false;
        }
        created = true;

        if (floating) {
            if (gui->suggest_title) gui->suggest_title(plugin, title.c_str());
            if (!gui->show(plugin)) {
                error = "plugin refused to show its floating CLAP GUI";
                destroy();
                return false;
            }
            visible = true;
            return true;
        }

        uint32_t width = 640;
        uint32_t height = 480;
        if (gui->get_size) {
            uint32_t requestedWidth = 0;
            uint32_t requestedHeight = 0;
            if (gui->get_size(plugin, &requestedWidth, &requestedHeight)
                && requestedWidth > 0 && requestedHeight > 0) {
                width = requestedWidth;
                height = requestedHeight;
            }
        }
        resizable = gui->can_resize && gui->can_resize(plugin);

        NSUInteger style = NSWindowStyleMaskTitled
            | NSWindowStyleMaskClosable | NSWindowStyleMaskMiniaturizable;
        if (resizable) style |= NSWindowStyleMaskResizable;
        window = [[NSWindow alloc]
            initWithContentRect:NSMakeRect(0.0, 0.0, width, height)
                      styleMask:style
                        backing:NSBackingStoreBuffered
                          defer:NO];
        if (!window) {
            error = "could not create the CLAP editor window";
            destroy();
            return false;
        }
        [window setReleasedWhenClosed:NO];
        [window setTitle:[NSString stringWithUTF8String:title.c_str()]];
        [window center];

        delegate = [[S3GClapWindowDelegate alloc] init];
        delegate->owner = this;
        [window setDelegate:delegate];

        clap_window_t parent {};
        parent.api = CLAP_WINDOW_API_COCOA;
        parent.cocoa = static_cast<clap_nsview>([window contentView]);
        if (!gui->set_parent || !gui->set_parent(plugin, &parent)) {
            error = "plugin refused the Cocoa parent window";
            destroy();
            return false;
        }
        if (!gui->show(plugin)) {
            error = "plugin refused to show its embedded CLAP GUI";
            destroy();
            return false;
        }
        [window makeKeyAndOrderFront:nil];
        visible = true;
        return true;
    }

    void destroy()
    {
        if (delegate) delegate->owner = nullptr;
        if (window) {
            [window setDelegate:nil];
            [window orderOut:nil];
        }
        if (created && gui && plugin) {
            if (gui->hide) gui->hide(plugin);
            if (gui->destroy) gui->destroy(plugin);
        }
        created = false;
        visible = false;
        if (window) {
            [window close];
            [window release];
            window = nil;
        }
        if (delegate) {
            [delegate release];
            delegate = nil;
        }
    }

    bool show()
    {
        if (!created || !gui || !gui->show || !gui->show(plugin))
            return false;
        if (window) [window makeKeyAndOrderFront:nil];
        visible = true;
        return true;
    }

    bool hide()
    {
        if (!created || !gui || !gui->hide || !gui->hide(plugin))
            return false;
        if (window) [window orderOut:nil];
        visible = false;
        return true;
    }

    void resizeFromPlugin(uint32_t width, uint32_t height)
    {
        if (!window || width == 0 || height == 0) return;
        changingSize = true;
        [window setContentSize:NSMakeSize(width, height)];
        changingSize = false;
    }

    void userResized()
    {
        if (changingSize || !resizable || !window || !gui || !gui->set_size)
            return;
        const NSSize size = [[window contentView] bounds].size;
        uint32_t width = static_cast<uint32_t>(
            std::max(1.0, std::round(size.width)));
        uint32_t height = static_cast<uint32_t>(
            std::max(1.0, std::round(size.height)));
        if (gui->adjust_size) gui->adjust_size(plugin, &width, &height);
        if (!gui->set_size(plugin, width, height)) return;
        if (std::abs(size.width - static_cast<double>(width)) > 0.5
            || std::abs(size.height - static_cast<double>(height)) > 0.5)
            resizeFromPlugin(width, height);
    }

    bool shouldClose()
    {
        hide();
        return false;
    }

    void pluginClosed(bool wasDestroyed)
    {
        visible = false;
        if (window) [window orderOut:nil];
        if (wasDestroyed && created && gui && gui->destroy)
            gui->destroy(plugin);
        if (wasDestroyed) created = false;
    }
};

@implementation S3GClapWindowDelegate
- (BOOL)windowShouldClose:(id)sender
{
    (void)sender;
    return owner ? owner->shouldClose() : YES;
}

- (void)windowDidResize:(NSNotification*)notification
{
    (void)notification;
    if (owner) owner->userResized();
}
@end

S3GClapEditor* s3gCreateClapEditor(const clap_plugin_t* plugin,
    const std::string& title, std::string& error)
{
    [NSApplication sharedApplication];
    auto* editor = new (std::nothrow) S3GClapEditor;
    if (!editor) {
        error = "could not allocate the CLAP editor host";
        return nullptr;
    }
    editor->plugin = plugin;
    if (!editor->initialize(title, error)) {
        delete editor;
        return nullptr;
    }
    return editor;
}

void s3gDestroyClapEditor(S3GClapEditor* editor) { delete editor; }

bool s3gShowClapEditor(S3GClapEditor* editor)
{
    return editor && editor->show();
}

bool s3gHideClapEditor(S3GClapEditor* editor)
{
    return editor && editor->hide();
}

void s3gResizeClapEditor(S3GClapEditor* editor, uint32_t width,
    uint32_t height)
{
    if (editor) editor->resizeFromPlugin(width, height);
}

void s3gClapEditorPluginClosed(S3GClapEditor* editor, bool wasDestroyed)
{
    if (editor) editor->pluginClosed(wasDestroyed);
}
