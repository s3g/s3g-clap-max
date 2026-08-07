#pragma once

#include <string>
#include <vector>

namespace s3g::max_host {

// Returns CLAP_PATH entries followed by the platform-standard CLAP roots.
// Existing roots are canonicalized and duplicates are removed.
std::vector<std::string> clapSearchPaths();

// Resolves an existing .clap path or a bundle/display name. Name matching is
// case-insensitive, ignores punctuation and spacing, and accepts a unique
// substring such as "Encoder Stochastic". No plugin executable is loaded
// during discovery.
bool resolveClapBundle(const std::string& reference, std::string& path,
    std::string& error);

} // namespace s3g::max_host
