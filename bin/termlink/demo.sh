#!/usr/bin/env bash

type_out() {
    local text="$1"
    local i
    for (( i=0; i<${#text}; i++ )); do
        printf "${text:$i:1}"
        sleep 0.01
    done
    printf "\n"
}


# Options for the menu
options=("local" "ssh" "termlink")

# Current selection index
selected=0

clear
printf '\e[s'
printf '\e[?25l'

echo "Welcome to JOJO Industries (TM) Omnishell"
type_out "Please select a boot action: "

# Function to draw the menu
draw_menu() {
	printf '\e[u'
	printf "\n\n"

    for i in "${!options[@]}"; do
        if [[ $i == $selected ]]; then
            # Highlight the selected option
            printf "> \e[7m%s\e[0m\n" "[${options[$i]}]"
        else
            printf "  %s\n" "[${options[$i]}]"
        fi
    done
}

# Function to read arrow keys
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

# Main loop
while true; do
    draw_menu
    action=$(read_key)

    case "$action" in
        up)
            ((selected--))
            ((selected < 0)) && selected=$((${#options[@]} - 1))
            ;;
        down)
            ((selected++))
            ((selected >= ${#options[@]})) && selected=0
            ;;
        enter)
            clear	
			printf '\e[?25h'
			printf '\e[?12h'
			if [[ "${options[$selected]}" == "termlink" ]]; then					
				source ~/.shell/termlink.sh
			elif [[ "${options[$selected]}" == "ssh" ]]; then
				ssh myczka@robco.dev
			else
				break
			fi
            break
            ;;
			
    esac
	
	printf '\e[u'
	echo "Welcome to JOJO Industries (TM) Omnishell"
	echo "Please select a boot action: "
done

