#!/usr/bin/env bash

[[ -d ~/.config ]] || mkdir ~/.config
[[ -e ~/.config/fontconfig/ ]] && rm -rf ~/.config/fontconfig

ln -sf "$(pwd)" ~/.config/fontconfig
