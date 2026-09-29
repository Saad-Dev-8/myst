# myst

Simple terminal emulator for X, based on suckless `st 0.9.3`.

## Requirements

Build dependencies:

- Xlib header files
- Xft
- fontconfig
- freetype2
- harfbuzz
- libgd (for `_NET_WM_ICON`)
- pkg-config
- C compiler (`cc`) and `make`

Optional runtime dependencies:

- `dmenu` (unicode input)
- `xclip` (screen dump to clipboard)
- `xdg-open` (open URLs / clipboard content)

## Installation

Edit `config.mk` to match your local setup (`st` is installed into `/usr/local` by default).

Build and install:

```sh
make clean install
```

If you did not install with `make clean install`, compile the terminfo entry manually:

```sh
tic -sx st.info
```

See `st.1` for additional details.

## Patches

Applied on top of `st 0.9.3`, in dependency order:

- font2
- externalpipe
- alpha
- dynamic-cursor-color
- drag-n-drop
- scrollback-reflow
- sixel
- boxdraw
- undercurl
- copyurl
- keyboard_select
- newterm
- openclipboard
- desktopentry
- workingdir
- bold-is-not-bright
- delkey
- spoiler
- vertcenter
- visualbell
- ligatures
- appsync
- csi_22_23
- selectioncolors
- changealpha
- iso14755
- fullscreen
- hidecursor
- clickurl
- copyurl-multiline(custom)
- unfocus-dim(custom)
- blinking_cursor
- netwmicon
- expected-anysize

## Usage

`MODKEY` is Alt (`Mod1Mask`). `TERMMOD` is `Ctrl+Shift`.

| Input | Action |
| --- | --- |
| Middle click | Paste primary selection |
| Right click | Paste clipboard |
| `TERMMOD + Return` | New terminal in shell cwd |
| `TERMMOD + Escape` | Keyboard select / search |
| `MODKEY + l` / `MODKEY + Shift + L` | Copy previous / next URL |
| `MODKEY + o` | Open clipboard content |
| `TERMMOD + S` | Dump screen to clipboard |
| `Ctrl + a` | Select commands + current line |
| `MODKEY + [` / `MODKEY + Shift + ]` / `MODKEY + ]` | Opacity down / up / reset |
| `TERMMOD + I` | Unicode input (requires `dmenu`) |
| `F11` / `MODKEY + Return` | Toggle fullscreen |
| `Ctrl + click` | Open URL under cursor |

Additional flags:

```sh
st -d path
```

Start `st` in the given working directory.

## Acknowledgments

- Based on Aurélien APTEL `bt` source code.
- suckless.org `st` upstream.
- Authors of the third-party patches listed above.
- Nord color theme.

## License

GNU General Public License v3.0 or later (GPLv3+).

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

See `LICENSE` for the full license text.

