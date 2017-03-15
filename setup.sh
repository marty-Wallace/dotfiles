#!/bin/bash

echoerr() { echo "$@" 1>&2; }


#------------------------------
# Adding dotfiles if they don't already exists on the system

if [ ! -f "$HOME/.vimrc" ]; then 
	ln -s "$HOME/.dotfiles/.vimrc"  "$HOME"
else
    echoerr ".vimrc already exists in home directory. Skipping..."
fi

if [ ! -f "$HOME/.inputrc" ]; then
	ln -s "$HOME/.dotfiles/.inputrc" "$HOME"
else
    echoerr ".inputrc already exists in home directory. Skipping.."
fi

if [ ! -f "$HOME/.bash_aliases" ]; then
	ln -s "$HOME/.dotfiles/.bash_aliases" "$HOME"
else
    echoerr ".bash_aliases already exists in home directory. Skipping.."
fi

if [ ! -f "$HOME/.bashrc" ]; then
	ln -s "$HOME/.dotfiles/.bashrc" "$HOME"
else
    echoerr ".bashrc already exists in home directory. Skipping"
fi

# setup or create .bash_profile
if [ ! -f "$HOME/.bash_profile" ]; then
	ln -s "$HOME/.dotfiles/.bash_profile" "$HOME"
else
    echoerr ".bash_profile already exists. Adding info to end"
    cat >> ~/.bash_profile << "EOF"

[ -f "$HOME/.bashrc" ] && source $HOME/.bashrc

if [-d "HOME/bin" ]; then
    PATH=$PATH:$HOME/bin
    export PATH
fi

[ -f $HOME/.extend.bash_profile ] && source $HOME/.extend.bash_profile
[ -f $HOME/.bash_aliases] && source $HOME/.bash_aliases

EOF
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
echoerr "Plugins installed..."

