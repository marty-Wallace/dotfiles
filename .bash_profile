#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

PATH=$PATH:/home/marty/bin:/home/marty/.cargo/bin
export PATH
