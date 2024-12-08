# Enables running executables in this folder, such as fish shell
fish_add_path /opt/homebrew/bin

# Configure GPG use in terminal
set -gx GPG_TTY (tty)
