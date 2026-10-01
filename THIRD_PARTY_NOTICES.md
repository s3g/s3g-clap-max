# Third-party notices

## CLAP

This project builds against the CLAP headers from
<https://github.com/free-audio/clap>.

MIT License

Copyright (c) 2021 Alexandre Bique

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

## Envelop for Live routing abstractions

The files under `vendor/envelop-for-live/patchers` are unmodified routing and
Live-control abstractions from
<https://github.com/EnvelopSound/EnvelopForLive>, commit
`1ec2e2089bedba42271d19e5c8147ebf94e6a392`.

The generated files under `package/patchers/s3g-routing` are modified,
s3g-namespaced versions of those abstractions. The `s3g.bus.receive` variant
removes the upstream device-order validator. Its global bus-message protocol
also uses private `s3g.*` names, preventing accidental routing between s3g and
Envelop devices in the same Live Set. Each generated Max patch contains an
in-patcher attribution comment.

Envelop for Live designates the reusable `patchers/bus` and `patchers/live`
subsystems under the GNU Lesser General Public License, version 2.1. Complete
copies of that license are distributed beside the vendored files as
`bus/LICENSE.txt` and `live/LICENSE.txt`.

## Cycling '74 Max SDK

This project builds against `max-sdk-base` from
<https://github.com/Cycling74/max-sdk-base>.

Copyright (c) 2021, Cycling '74. All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
