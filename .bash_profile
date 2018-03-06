#
# ~/.bash_profile
#

[[ -f ~/.extend.bash_profile ]] && . ~/.extend.bash_profile
[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -f ~/.extend.bashrc ]] && . ~/.extend.bashrc
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.functions ]] && . ~/.functions
[[ -f ~/.bashrc ]] && . ~/.bashrc


PATH=$PATH:/home/marty/bin:/home/marty/.cargo/bin
PATH=$PATH:/home/marty/.gem/ruby/2.4.0/bin
export PATH
