# Listing: file-type indicators, automatic color, directories first.
alias ls='ls -F --color=auto --group-directories-first'

# Preserve your Windows registry-file filtering in Git Bash.
case "$OSTYPE" in
    msys*|cygwin*)
        alias ls='ls -F --color=auto --group-directories-first --ignore="NTUSER.*"'
        ;;
esac

alias ll='ls -lhX'
alias l='ll'
alias la='ll -a --sort=name'
alias ld='ll --sort=size'
alias lx='ll --sort=extension'
alias lt='ll --sort=time'
alias lat='lt -A'
alias lax='lx -A'

# Copy directories recursively.
alias cpr='cp -r'

# Search with line numbers and automatic color.
alias grep='grep -n --color=auto'
alias grepi='grep -i'
alias regrep='grep -r'

# Follow redirects and display a progress bar.
alias curl='curl -L --progress-bar'

# Also save using the remote filename.
alias curlo='curl -O'

if command -v fastfetch >/dev/null 2>&1; then
    alias fetch='fastfetch'
fi
