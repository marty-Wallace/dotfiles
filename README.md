#### My vimrc

Vim is life. Vim is love


##### Install 

First if you haven't installed vim then install it using your favourite package manager `sudo pacman -S vim` or `sudo apt-get install vim`


Then install Vundle if you haven't already 
`git clone https:://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim`

Next clone this repository and link the .vimrc file to your home directory
```
git clone https://github.com/marty-wallace/marty-vimrc.git
cd marty-vimrc 
ln -s .vimrc ~/.vimrc
'''

Then open up vim and run `:PluginInstall`. Vundle will install all of your plugins for you and you are ready to go. 

