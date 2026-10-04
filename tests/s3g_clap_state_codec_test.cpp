#include "s3g_clap_state_codec.h"

#include <cstdint>
#include <iostream>
#include <vector>

int main()
{
    using namespace s3g::max_host::state_codec;
    if (!fitsMessage(0u, 4u)
        || !fitsMessage((kMaxMessageAtoms - 4u) * 4u, 4u)
        || fitsMessage((kMaxMessageAtoms - 4u) * 4u + 1u, 4u)
        || fitsMessage(161248u, 4u)
        || !fitsMessage(1000u, 5u))
        return 1;

    for (const size_t length : {0u, 1u, 2u, 3u, 127u, 128u,
                                129u, 130u, 131u, 161248u}) {
        std::vector<uint8_t> source(length, 0u);
        for (size_t index = 0; index < length; index += 257u)
            source[index] = static_cast<uint8_t>((index % 251u) + 1u);
        const auto packed = encode(source);
        std::vector<uint8_t> decoded;
        if (!decode(packed, length, decoded) || decoded != source) {
            std::cerr << "state codec round trip failed at " << length << '\n';
            return 1;
        }
        if (length == 161248u && !fitsMessage(packed.size(), 5u)) {
            std::cerr << "Wrangler-sized state still exceeds Max atom limit\n";
            return 1;
        }
        if (!packed.empty()) {
            auto truncated = packed;
            truncated.pop_back();
            if (decode(truncated, length, decoded)) {
                std::cerr << "truncated state was accepted\n";
                return 1;
            }
        }
    }
    const std::vector<uint8_t> repeated(161248u, 0xa5u);
    if (!fitsMessage(encode(repeated).size(), 5u)) {
        std::cerr << "repeated-byte state did not compress\n";
        return 1;
    }
    std::vector<uint8_t> noncompressible(161248u);
    uint32_t random = 0x12345678u;
    for (auto& byte : noncompressible) {
        random ^= random << 13u;
        random ^= random >> 17u;
        random ^= random << 5u;
        byte = static_cast<uint8_t>(random);
    }
    const auto packedRandom = encode(noncompressible);
    std::vector<uint8_t> decoded;
    if (fitsMessage(packedRandom.size(), 5u)
        || !decode(packedRandom, noncompressible.size(), decoded)
        || decoded != noncompressible) {
        std::cerr << "large incompressible state was not bounded safely\n";
        return 1;
    }
    if (decode({0x80u}, 3u, decoded)
        || decode({0x00u}, 1u, decoded)
        || decode({0x80u, 0x00u}, 2u, decoded)) {
        std::cerr << "malformed state was accepted\n";
        return 1;
    }
    std::cout << "state codec and Max message bounds passed\n";
    return 0;
}
