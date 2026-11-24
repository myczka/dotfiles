export DOTFILES_DIR="$HOME/dotfiles"

if [[ -f "$DOTFILES_DIR/bash/bashrc.sh" ]]; then
    source "$DOTFILES_DIR/bash/bashrc.sh"
fi

# This file goes in '~/'