#!/usr/bin/env fish

set DOTFILES $PWD
set CONFIG_PATH $HOME/.config

# kitty terminal
set KITTY_PATH $CONFIG_PATH/kitty
rm -rf $KITTY_PATH
ln -s $DOTFILES/kitty $KITTY_PATH
echo 'Configured kitty'

# fish shell
set FISH_PATH $CONFIG_PATH/fish
rm -rf $FISH_PATH
ln -s $DOTFILES/fish $FISH_PATH
echo 'Configured fish'

# fisher package manager
if type -q fisher
    fisher update
    echo 'Installed fisher packages'
else
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    echo 'Installed fisher'
end

# git
ln -sf $DOTFILES/git/gitconfig $HOME/.gitconfig
echo 'Configured git'
