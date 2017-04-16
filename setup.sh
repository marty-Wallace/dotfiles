#!/bin/bash

echoerr() { echo "$@" 1>&2; }

function prompt_confirm() {
    while true; do
        read -r -n 1 -p "${1:-Continue?} [y/n]: " REPLY;
        case $REPLY in
            [yY]) echo ; return 0 ;;
            [nN]) echo ; return 1 ;;
            *) printf " \033[31m %s  \n\033[0m" "invalid input"
        esac
    done
}

#------------------------------
# Adding dotfiles if they don't already exists on the system

if [ ! -f "$HOME/.vimrc" ]; then 
	ln -s "$HOME/.dotfiles/.vimrc"  "$HOME"
else
    if prompt_confirm ".vimrc already in $HOME. Replace?"; then
        rm "$HOME/.vimrc";
        ln -s "$HOME/.dotfiles/.vimrc"  "$HOME";
    else
        echo "Skipping..."
    fi
fi

if [ ! -f "$HOME/.inputrc" ]; then
	ln -s "$HOME/.dotfiles/.inputrc" "$HOME"
else
    if prompt_confirm ".inputrc already in $HOME. Replace?"; then
        rm "$HOME/.inputrc";
        ln -s "$HOME/.dotfiles/.inputrc"  "$HOME";
    else
        echo "Skipping..."
    fi
fi

if [ ! -f "$HOME/.bash_aliases" ]; then
	ln -s "$HOME/.dotfiles/.bash_aliases" "$HOME"
else
    if prompt_confirm ".bash_aliases already in $HOME. Replace?"; then
        rm "$HOME/.bash_aliases";
        ln -s "$HOME/.dotfiles/.bash_aliases"  "$HOME";
    else
        echo "Skipping..."
    fi
fi

if [ ! -f "$HOME/.bashrc" ]; then
	ln -s "$HOME/.dotfiles/.bashrc" "$HOME"
else
    if prompt_confirm ".bashrc already in $HOME. Replace?"; then
        rm "$HOME/.bashrc";
        ln -s "$HOME/.dotfiles/.bashrc"  "$HOME";
    else
        echo "Skipping..."
    fi
fi

if [ ! -f "$HOME/.tmux.conf" ]; then
	ln -s "$HOME/.dotfiles/.tmux.conf" "$HOME"
else
    if prompt_confirm ".tmux.conf already in $HOME. Replace?"; then
        rm "$HOME/.tmux.conf";
        ln -s "$HOME/.dotfiles/.tmux.conf"  "$HOME";
    else
        echo "Skipping..."
    fi
fi

if [ ! -f "$HOME/.functions" ]; then 
	ln -s "$HOME/.dotfiles/.functions"  "$HOME"
else
    if prompt_confirm ".functions already in $HOME. Replace?"; then
        rm "$HOME/.functions";
        ln -s "$HOME/.dotfiles/.functions"  "$HOME";
    else
        echo "Skipping..."
    fi
fi


# setup or create .bash_profile
if [ ! -f "$HOME/.bash_profile" ]; then
	ln -s "$HOME/.dotfiles/.bash_profile" "$HOME"
else
    if prompt_confirm ".bash_profile already in $HOME. Replace?"; then
        rm "$HOME/.bash_profile";
        ln -s "$HOME/.dotfiles/.bash_profile"  "$HOME";
    else
        echo "Skipping..."
    fi
fi


#------------------------------
#Installing Vundle (vim package manager)"
mkdir -p "$HOME"/.vim/bundle

cd "$HOME/.vim/bundle"

if [ ! -d Vundle.vim ]
then
    echoerr "Attempting to clone Vundle plugin..."
    if git clone https://github.com/VundleVim/Vundle.vim.git; then
        echoerr "Successfully cloned Vundle plugin"
    else
        echoerr "Could not clone Vundle plugin - internet down?"
    fi
else
    echoerr "Vundle plugin already exists, skipping..."
fi


#---------------------------------------
# Vundle installing vim plugins
echoerr "Installing plugins in vim..."
vim -c 'PluginInstall' -c 'qa!'
echoerr "Vim plugins installed..."
echoerr "Attempting to install exuberant-ctags"

cd ~/.vim/bundle/exuberant-ctags/
./configure
./make install

echoerr "Attempting to set terminal_settings.sh"
vim -c "PromptlineSnapshot ~/.terminal_settings.sh"
source ~/.bashrc
