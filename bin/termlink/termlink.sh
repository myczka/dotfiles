#!/usr/bin/env bash

clear
printf '\e[s'
printf '\e[?25l'
current_dir="$PWD"
selected=0

draw_menu() {
	printf '\e[u'
    echo "  $current_dir
	"

    # Build menu list: subdirectories + special options
    mapfile -t dirs < <(find "$current_dir" -maxdepth 1 -mindepth 1 -printf "%f\n" | sort)

    options=("${dirs[@]}" "../" "Exit")
    total=${#options[@]}

    for i in "${!options[@]}"; do
        if [[ $i == $selected ]]; then
            printf "> \e[7m%s\e[0m\n" "[${options[$i]}]"
        else
            printf "  %s\n" "[${options[$i]}]"
        fi
    done
}

read_key() {
    read -rsn1 key
    if [[ $key == $'\x1b' ]]; then
        read -rsn2 key
        case "$key" in
            "[A") echo up ;;
            "[B") echo down ;;
        esac
    elif [[ $key == "" ]]; then
        echo enter
    fi
}


while true; do
    draw_menu
    action=$(read_key)
    case "$action" in
        up)
            ((selected--))
            ((selected < 0)) && selected=$((total - 1))
            ;;
        down)
            ((selected++))
            ((selected >= total)) && selected=0
            ;;
        enter)
			clear
            choice="${options[$selected]}"

            if [[ "$choice" == "Exit" ]]; then
                clear
				printf '\e[?25h'
				clear
                return 0
            elif [[ "$choice" == "../" ]]; then
                current_dir="$(dirname "$current_dir")"
				selected=0
            else
                current_dir="$current_dir/$choice"
                selected=0
            fi
            ;;
    esac
done

