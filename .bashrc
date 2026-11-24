export DOTFILES_DIR="$HOME/dotfiles"

if [[ -f "$DOTFILES_DIR/bash/bashrc" ]]; then
    source "$DOTFILES_DIR/bash/bashrc"
fi

# This file goes in '~/'