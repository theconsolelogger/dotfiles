#!/usr/bin/env sh

# Homebrew
if [[ type -q brew ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'Installed brew'
fi

brew install fish \
    terminal-notifier \
    neovim \
    php@8.2 \
    composer \
    node \
    ripgrep

echo 'Installed brew packages'

# kitty
if [[ type -q kitty ]]; then
    curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
    echo 'Installed kitty terminal'
fi

echo 'macOS installation complete'
echo "Don't forget to copy over your .ssh and .gnupg directories!"
