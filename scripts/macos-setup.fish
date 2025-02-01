#!/usr/bin/env sh

echo 'Starting macOS installation...'

# Homebrew setup
echo 'Installing Homebrew...'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'Installed Homebrew.'

echo 'Installing Homebrew packages...'

brew install fish \
    neovim \
    ripgrep \
    pinentry-mac

echo 'Installed Homebrew packages.'

mkdir -p ~/.gnupg

ln -s $PWD/gpg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

mkdir -p ~/.config

# Fish shell setup
# Make fish shell the default login shell
echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/fish

# Symlink over fish shell configurations
ln -s $PWD/fish ~/.config/fish

# Setup fish shell packages
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install jorgebucaran/hydro

# kitty terminal setup
echo 'Installing kitty terminal...'
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
echo 'Installed kitty terminal.'

ln -s $PWD/fish ~/.config/fish

echo 'macOS installation complete.'
echo "Don't forget to copy over your .ssh and .gnupg directories!"
