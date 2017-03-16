#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.functions ]] && . ~/.functions

PATH=$PATH:/home/marty/bin:/home/marty/.cargo/bin
export PATH
