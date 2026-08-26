#!/usr/bin/env bash

# install font config
[[ -d ~/.config ]] || mkdir -p ~/.config
[[ -d ~/.config/fontconfig ]] || mkdir -p ~/.config/fontconfig
cp -f "$(pwd)/fonts.conf" ~/.config/fontconfig/fonts.conf

# install maple mono if necessary
if ! fc-list : family | grep -i "Maple Mono NF CN" >/dev/null; then
    target="https://github.com/subframe7536/maple-font/releases/latest/download/MapleMono-NF-CN.zip"
    [[ -d ~/.local/share/fonts/MapleMono-NF-CN ]] || mkdir -p ~/.local/share/fonts/MapleMono-NF-CN
    (
        cd ~/.local/share/fonts/MapleMono-NF-CN || exit 1
        echo '[INFO] Downloading MapleMono-NF-CN...'
        curl -fsSL -o MapleMono-NF-CN.zip "$target" || exit 1
        echo '[INFO] Deflating MapleMono-NF-CN.zip...'
        unzip -oqq MapleMono-NF-CN.zip
    )
fi

# rebuild fc-cache
echo '[INFO] Rebuilding fc cache...'
fc-cache -f
