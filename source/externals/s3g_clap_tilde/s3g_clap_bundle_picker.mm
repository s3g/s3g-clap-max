#include "s3g_clap_bundle_picker.h"

#import <AppKit/AppKit.h>

bool s3gChooseClapBundle(std::string& path, std::string& error)
{
    path.clear();
    error.clear();
    @autoreleasepool {
        NSOpenPanel* panel = [NSOpenPanel openPanel];
        [panel setTitle:@"Open CLAP Plugin"];
        [panel setPrompt:@"Open"];
        [panel setCanChooseFiles:YES];
        // Some macOS releases expose third-party .clap bundles as package
        // directories. Allow directory selection, then validate the suffix.
        [panel setCanChooseDirectories:YES];
        [panel setAllowsMultipleSelection:NO];
        [panel setResolvesAliases:YES];
        [panel setTreatsFilePackagesAsDirectories:NO];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        // Keep the deployment target compatible with older Max/macOS systems.
        // allowedContentTypes is only available on newer SDK/runtime pairs.
        [panel setAllowedFileTypes:@[ @"clap" ]];
#pragma clang diagnostic pop
        [panel setAllowsOtherFileTypes:NO];

        if ([panel runModal] != NSModalResponseOK) return false;
        NSURL* selected = [[panel URLs] firstObject];
        if (!selected || ![selected isFileURL]) {
            error = "the selected CLAP does not have a local file path";
            return false;
        }
        NSString* selectedPath = [selected path];
        if ([[selectedPath pathExtension]
                caseInsensitiveCompare:@"clap"] != NSOrderedSame) {
            error = "select a bundle whose filename ends in .clap";
            return false;
        }
        const char* utf8 = [selectedPath fileSystemRepresentation];
        if (!utf8 || utf8[0] == '\0') {
            error = "could not convert the selected CLAP path";
            return false;
        }
        path = utf8;
        return true;
    }
}
