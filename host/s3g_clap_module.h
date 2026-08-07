#pragma once

#include <clap/clap.h>

#include <cstdint>
#include <memory>
#include <string>
#include <vector>

namespace s3g::max_host {

struct ClapPluginDescriptor {
    std::string id;
    std::string name;
    std::string vendor;
    std::string version;
};

class SharedClapModule;

// Loads one CLAP dynamic library and keeps its entry initialized until every
// plugin instance created from its factory has been destroyed.
class ClapModule {
public:
    ClapModule() = default;
    ~ClapModule();

    ClapModule(const ClapModule&) = delete;
    ClapModule& operator=(const ClapModule&) = delete;

    bool open(const std::string& path, std::string& error);
    void close();

    bool isOpen() const;
    const std::string& path() const;
    const clap_plugin_entry_t* entry() const;
    const clap_plugin_factory_t* factory() const;

    std::vector<ClapPluginDescriptor> descriptors() const;

private:
    std::shared_ptr<SharedClapModule> state_;
};

} // namespace s3g::max_host
