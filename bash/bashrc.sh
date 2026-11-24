# Everything below is for interactive shells.
[[ $- == *i* ]] || return

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"

# Disable less history and the terminal bell.
export LESSHISTFILE=-
bind 'set bell-style none'

# Update terminal dimensions and append rather than overwrite history.
shopt -s checkwinsize histappend

# Your green user/host and blue working-directory prompt.
PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\w\[\e[0m\]\$ '

# Make personal executable scripts available as commands.
# Avoid adding the directory again when reloading this file.
case ":$PATH:" in
    *":$DOTFILES_DIR/bin:"*) ;;
    *) export PATH="$DOTFILES_DIR/bin:$PATH" ;;
esac

. "$DOTFILES_DIR/bash/bash_functions"
. "$DOTFILES_DIR/bash/bash_aliases"

# Default destination for the home command.
#home="$HOME"

# Machine-specific settings and overrides, outside the repo.
[[ ! -f "$HOME/.bashrc.local" ]] || . "$HOME/.bashrc.local"

#COMMENT IF OMNISHELL USED
type_out "Welcome to JOJO Industries (TM) Omnishell"
sleep 0.2
type_out "Initializing..."

#STARTUP
cd ~/
sleep 0.7
clear

if command -v fastfetch >/dev/null 2>&1; then
    fastfetch
fi

printf "\n"
type_out "Use command 'halp' for tips."
printf "\n"

force_color_prompt=yes

# Optional startup display, once per shell.
# if [[ ${DOTFILES_BANNER:-0} == 1 && -z ${_DOTFILES_BANNER_SHOWN:-} ]]; then
#     _DOTFILES_BANNER_SHOWN=1



# fi
