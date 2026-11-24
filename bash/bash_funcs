# Allow replacing aliases left over from an older configuration.
unalias type_out println howto setuplab home swaps halp 2>/dev/null

type_out() {
    local text="$*" i

    for ((i = 0; i < ${#text}; i++)); do
        printf '%s' "${text:i:1}"
        sleep 0.03
    done

    printf '\n'
}

# Interpret escapes such as \n and \t, matching your original.
println() {
    printf '%b\n' "$*"
}

howto() {
    if (($# == 0)); then
        printf 'Usage: howto COMMAND [ARGS...]\n' >&2
        return 2
    fi

    "$@" --help 2>&1 | less
}

# $home defaults to $HOME; override it in ~/.bashrc.local.
home() {
    builtin cd -- "$home"
}

# List Vim swap files, including those for hidden files.
swaps() (
    shopt -s nullglob dotglob
    local -a files=(./*.sw?)

    if ((${#files[@]})); then
        command ls -lh -- "${files[@]}"
    else
        printf 'No Vim swap files in this directory.\n'
    fi
)

setuplab() {
    if (($# != 2)) || [[ ! $1 =~ ^[0-9]+$ ]]; then
        printf 'Usage: setuplab NUMBER ZIP_URL\n' >&2
        return 2
    fi

    command -v curl >/dev/null 2>&1 || return 127
    command -v unzip >/dev/null 2>&1 || return 127

    # Refuse to reuse an existing lab directory.
    mkdir -- "Lab$1" || return
    builtin cd -- "Lab$1" || return

    command curl --fail --location --progress-bar \
        --output Labsetup.zip -- "$2" || return

    command unzip Labsetup.zip || return
    command rm -- Labsetup.zip || return

    # Enter the archive's wrapper directory if it has one.
    if [[ -d Labsetup ]]; then
        builtin cd -- Labsetup || return
    fi
}

halp() {
    {
        printf '%s\n' \
            'howto COMMAND       Show command help in less' \
            'setuplab N URL      Download and extract a lab into a new LabN' \
            'home                Go to $home (configured in ~/.bashrc.local)' \
            'swaps               List Vim swap files here' \
            'command NAME        Bypass an alias or function' \
            'type NAME           Explain what a command resolves to' \
            '' 'ALIASES:'

        alias

        printf '\nFUNCTIONS:\n'
        declare -F
    } | less
}
truehalp() {
    less "$DOTFILES_DIR/bash/help.txt"
}
