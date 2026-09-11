#include "s3g_clap_editor.h"

#include <clap/ext/gui.h>

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#ifndef NOMINMAX
#define NOMINMAX
#endif
#include <windows.h>

#include <new>
#include <string>

extern "C" IMAGE_DOS_HEADER __ImageBase;

struct S3GClapEditor;

namespace {

constexpr wchar_t kWindowClassName[] = L"s3g.clap.max.editor";

LRESULT CALLBACK editorWindowProcedure(HWND hwnd, UINT message,
    WPARAM wParam, LPARAM lParam);

HINSTANCE moduleInstance()
{
    return reinterpret_cast<HINSTANCE>(&__ImageBase);
}

std::wstring wideString(const std::string& text)
{
    if (text.empty()) return {};
    const int length = MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS,
        text.c_str(), static_cast<int>(text.size()), nullptr, 0);
    if (length <= 0) return L"s3g.clap~";
    std::wstring result(static_cast<size_t>(length), L'\0');
    MultiByteToWideChar(CP_UTF8, MB_ERR_INVALID_CHARS, text.c_str(),
        static_cast<int>(text.size()), result.data(), length);
    return result;
}

bool registerWindowClass()
{
    static const bool registered = [] {
        WNDCLASSEXW windowClass {};
        windowClass.cbSize = sizeof(windowClass);
        windowClass.style = CS_HREDRAW | CS_VREDRAW;
        windowClass.lpfnWndProc = editorWindowProcedure;
        windowClass.hInstance = moduleInstance();
        windowClass.hCursor = LoadCursorW(nullptr, MAKEINTRESOURCEW(32512));
        windowClass.hbrBackground = GetSysColorBrush(COLOR_WINDOW);
        windowClass.lpszClassName = kWindowClassName;
        return RegisterClassExW(&windowClass) != 0
            || GetLastError() == ERROR_CLASS_ALREADY_EXISTS;
    }();
    return registered;
}

} // namespace

struct S3GClapEditor {
    const clap_plugin_t* plugin = nullptr;
    const clap_plugin_gui_t* gui = nullptr;
    HWND window = nullptr;
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
            CLAP_WINDOW_API_WIN32, false);
        const bool supportsFloating = gui->is_api_supported(plugin,
            CLAP_WINDOW_API_WIN32, true);
        if (!supportsEmbedded && !supportsFloating) {
            error = "plugin does not support a Win32 CLAP GUI";
            return false;
        }

        floating = !supportsEmbedded;
        if (!gui->create(plugin, CLAP_WINDOW_API_WIN32, floating)) {
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

        if (!registerWindowClass()) {
            error = "could not register the CLAP editor window class";
            destroy();
            return false;
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
        DWORD style = WS_OVERLAPPED | WS_CAPTION | WS_SYSMENU
            | WS_MINIMIZEBOX;
        if (resizable) style |= WS_THICKFRAME | WS_MAXIMIZEBOX;
        RECT bounds { 0, 0, static_cast<LONG>(width),
            static_cast<LONG>(height) };
        AdjustWindowRectEx(&bounds, style, FALSE, 0);
        const std::wstring nativeTitle = wideString(title);
        changingSize = true;
        window = CreateWindowExW(0, kWindowClassName, nativeTitle.c_str(),
            style, CW_USEDEFAULT, CW_USEDEFAULT, bounds.right - bounds.left,
            bounds.bottom - bounds.top, nullptr, nullptr,
            moduleInstance(), this);
        changingSize = false;
        if (!window) {
            error = "could not create the CLAP editor window";
            destroy();
            return false;
        }

        clap_window_t parent {};
        parent.api = CLAP_WINDOW_API_WIN32;
        parent.win32 = window;
        if (!gui->set_parent || !gui->set_parent(plugin, &parent)) {
            error = "plugin refused the Win32 parent window";
            destroy();
            return false;
        }
        if (!gui->show(plugin)) {
            error = "plugin refused to show its embedded CLAP GUI";
            destroy();
            return false;
        }
        ShowWindow(window, SW_SHOWNORMAL);
        UpdateWindow(window);
        visible = true;
        return true;
    }

    void destroy()
    {
        if (created && gui && plugin) {
            if (gui->hide) gui->hide(plugin);
            if (gui->destroy) gui->destroy(plugin);
        }
        created = false;
        visible = false;
        if (window) {
            const HWND oldWindow = window;
            window = nullptr;
            SetWindowLongPtrW(oldWindow, GWLP_USERDATA, 0);
            DestroyWindow(oldWindow);
        }
    }

    bool show()
    {
        if (!created || !gui || !gui->show || !gui->show(plugin))
            return false;
        if (window) {
            ShowWindow(window, SW_SHOWNORMAL);
            SetForegroundWindow(window);
        }
        visible = true;
        return true;
    }

    bool hide()
    {
        if (!created || !gui || !gui->hide || !gui->hide(plugin))
            return false;
        if (window) ShowWindow(window, SW_HIDE);
        visible = false;
        return true;
    }

    void resizeFromPlugin(uint32_t width, uint32_t height)
    {
        if (!window || width == 0 || height == 0) return;
        RECT bounds { 0, 0, static_cast<LONG>(width),
            static_cast<LONG>(height) };
        const DWORD style = static_cast<DWORD>(
            GetWindowLongPtrW(window, GWL_STYLE));
        AdjustWindowRectEx(&bounds, style, FALSE, 0);
        changingSize = true;
        SetWindowPos(window, nullptr, 0, 0, bounds.right - bounds.left,
            bounds.bottom - bounds.top,
            SWP_NOMOVE | SWP_NOZORDER | SWP_NOACTIVATE);
        changingSize = false;
    }

    void userResized(uint32_t width, uint32_t height)
    {
        if (changingSize || !resizable || width == 0 || height == 0
            || !gui || !gui->set_size)
            return;
        uint32_t adjustedWidth = width;
        uint32_t adjustedHeight = height;
        if (gui->adjust_size)
            gui->adjust_size(plugin, &adjustedWidth, &adjustedHeight);
        if (!gui->set_size(plugin, adjustedWidth, adjustedHeight)) return;
        if (adjustedWidth != width || adjustedHeight != height)
            resizeFromPlugin(adjustedWidth, adjustedHeight);
    }

    void pluginClosed(bool wasDestroyed)
    {
        visible = false;
        if (window) ShowWindow(window, SW_HIDE);
        if (wasDestroyed && created && gui && gui->destroy)
            gui->destroy(plugin);
        if (wasDestroyed) created = false;
    }
};

namespace {

LRESULT CALLBACK editorWindowProcedure(HWND hwnd, UINT message,
    WPARAM wParam, LPARAM lParam)
{
    auto* owner = reinterpret_cast<S3GClapEditor*>(
        GetWindowLongPtrW(hwnd, GWLP_USERDATA));
    if (message == WM_NCCREATE) {
        const auto* create = reinterpret_cast<CREATESTRUCTW*>(lParam);
        owner = static_cast<S3GClapEditor*>(create->lpCreateParams);
        SetWindowLongPtrW(hwnd, GWLP_USERDATA,
            reinterpret_cast<LONG_PTR>(owner));
        if (owner) owner->window = hwnd;
    }
    if (owner) {
        if (message == WM_CLOSE) {
            owner->hide();
            return 0;
        }
        if (message == WM_SIZE && wParam != SIZE_MINIMIZED) {
            owner->userResized(static_cast<uint32_t>(LOWORD(lParam)),
                static_cast<uint32_t>(HIWORD(lParam)));
            return 0;
        }
        if (message == WM_NCDESTROY) {
            SetWindowLongPtrW(hwnd, GWLP_USERDATA, 0);
            owner->window = nullptr;
        }
    }
    return DefWindowProcW(hwnd, message, wParam, lParam);
}

} // namespace

S3GClapEditor* s3gCreateClapEditor(const clap_plugin_t* plugin,
    const std::string& title, std::string& error)
{
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
