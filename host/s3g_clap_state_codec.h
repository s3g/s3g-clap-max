#pragma once

#include <algorithm>
#include <cstddef>
#include <cstdint>
#include <limits>
#include <vector>

namespace s3g::max_host::state_codec {

// Max's outlet_anything() takes a signed short atom count. Keep a little
// headroom for the state header instead of narrowing an oversized list.
constexpr size_t kMaxMessageAtoms =
    static_cast<size_t>(std::numeric_limits<short>::max());

inline bool fitsMessage(size_t byteCount, size_t headerAtoms)
{
    return headerAtoms <= kMaxMessageAtoms
        && byteCount <= (kMaxMessageAtoms - headerAtoms) * 4u;
}

// Portable PackBits-style runs. The CLAP state itself remains byte-for-byte
// unchanged; only the representation stored by Max for Live is compressed.
// 0..127: 1..128 literal bytes. 128..255: 3..130 copies of the next byte.
inline std::vector<uint8_t> encode(const std::vector<uint8_t>& input)
{
    std::vector<uint8_t> output;
    output.reserve(input.size());
    size_t index = 0;
    while (index < input.size()) {
        size_t run = 1;
        while (run < 130u && index + run < input.size()
            && input[index + run] == input[index])
            ++run;
        if (run >= 3u) {
            output.push_back(static_cast<uint8_t>(0x80u | (run - 3u)));
            output.push_back(input[index]);
            index += run;
            continue;
        }
        const size_t start = index;
        index += run;
        while (index - start < 128u && index < input.size()) {
            run = 1;
            while (run < 3u && index + run < input.size()
                && input[index + run] == input[index])
                ++run;
            if (run >= 3u) break;
            index += std::min(run, 128u - (index - start));
        }
        output.push_back(static_cast<uint8_t>(index - start - 1u));
        output.insert(output.end(), input.begin() + static_cast<std::ptrdiff_t>(start),
            input.begin() + static_cast<std::ptrdiff_t>(index));
    }
    return output;
}

inline bool decode(const std::vector<uint8_t>& encoded, size_t expectedBytes,
    std::vector<uint8_t>& output)
{
    output.clear();
    output.reserve(expectedBytes);
    size_t index = 0;
    while (index < encoded.size()) {
        const uint8_t command = encoded[index++];
        if (command & 0x80u) {
            const size_t count = static_cast<size_t>(command & 0x7fu) + 3u;
            if (index == encoded.size() || count > expectedBytes - output.size())
                return false;
            output.insert(output.end(), count, encoded[index++]);
        } else {
            const size_t count = static_cast<size_t>(command) + 1u;
            if (count > encoded.size() - index
                || count > expectedBytes - output.size())
                return false;
            output.insert(output.end(), encoded.begin()
                + static_cast<std::ptrdiff_t>(index), encoded.begin()
                + static_cast<std::ptrdiff_t>(index + count));
            index += count;
        }
    }
    return output.size() == expectedBytes;
}

} // namespace s3g::max_host::state_codec
