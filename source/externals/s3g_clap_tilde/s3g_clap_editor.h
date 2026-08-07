#pragma once

#include <clap/clap.h>

#include <cstdint>
#include <string>

struct S3GClapEditor;

S3GClapEditor* s3gCreateClapEditor(const clap_plugin_t* plugin,
    const std::string& title, std::string& error);
void s3gDestroyClapEditor(S3GClapEditor* editor);
bool s3gShowClapEditor(S3GClapEditor* editor);
bool s3gHideClapEditor(S3GClapEditor* editor);
void s3gResizeClapEditor(S3GClapEditor* editor, uint32_t width,
    uint32_t height);
void s3gClapEditorPluginClosed(S3GClapEditor* editor,
    bool wasDestroyed);
