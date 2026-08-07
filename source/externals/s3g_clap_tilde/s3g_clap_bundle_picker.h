#pragma once

#include <string>

// Returns true when the user selected a .clap bundle. Cancellation returns
// false with an empty error; selection or panel failures provide an error.
bool s3gChooseClapBundle(std::string& path, std::string& error);
