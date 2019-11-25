# libwebrtc binaries

[![License](https://img.shields.io/github/license/crow-misia/libwebrtc-bin)](LICENSE)

This repository contains build scripts that can be used to build statically linked libwebrtc binaries.

## Status

The following table displays the current state of this project, including
supported platforms and architectures.

## Status

<table>
  <tr>
    <td align="center"></td>
    <td align="center">x86</td>
    <td align="center">x64</td>
    <td align="center">arm</td>
    <td align="center">arm64</td>
  </tr>
  <tr>
    <th align="center">Linux</th>
    <td align="center">-</td>
    <td align="center">✔</td>
    <td align="center">✔</td>
    <td align="center">✔</td>
  </tr>
  <tr>
    <th align="center">macOS</th>
    <td align="center">-</td>
    <td align="center">✔</td>
    <td align="center">-</td>
    <td align="center">-</td>
  </tr>
  <tr>
    <th align="center">Windows</th>
    <td align="center">-</td>
    <td align="center">✔</td>
    <td align="center">-</td>
    <td align="center">-</td>
  </tr>
</table>

## Prerequisites

- Make
- Python 2.7 (optional for Windows since it will use the interpreter located
  inside the `depot_tools` installation)

## Building

### Linux / macOS

```
cd build
make [options] [platform]
```

check `[options]` and `[platform]` by executing `make help`.

### Windows

```
build.bat
```

## License

Apache License 2.0

## Reference

- https://webrtc.googlesource.com/src/
- https://github.com/aisouard/libwebrtc
- https://github.com/shiguredo/shiguredo-webrtc-windows
