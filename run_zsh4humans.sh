#!/bin/sh

DIR=/home/x0rzavi/.cache/zsh4humans/

if [ -d "$DIR" ]; then
    echo -e "\nZSH4HUMANS is already installed."
else
	if command -v curl >/dev/null 2>&1; then
	  sh -c "$(curl -fsSL https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
	else
	  sh -c "$(wget -O- https://raw.githubusercontent.com/romkatv/zsh4humans/v5/install)"
	fi
fi
