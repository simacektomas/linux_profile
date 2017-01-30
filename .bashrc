# ~/.bashrc: executed by bash(1) for non-login shells.
# author: tsimacek
# 

# prompt colors
user_color='94;255;159m'
host_color=''


# fancy color prompt
case "$TERM" 
	in xterm|xterm-color|*-256color)
		color_prompt=yes
		;;
	*)
		color_prompt=no
		;;
esac

# RGB colors in command prompt

if [ "$color_prompt" = yes ]; then
	if [[ ${EUID} == 0 ]]; then
		PS1="[\[\e[38;2;65;170;196m\] \h \[\e[0m\]] [\[\e[38;2;189;182;156m\] \w \[\e[0m\]] [\[\e[38;2;113;125;140m\] \t \[\e[0m\]]\n[\[\e[38;2;255;0;0m\] \u \[\e[0m\]] $ "
	else 
		PS1="[\[\e[38;2;65;170;196m\] \h \[\e[0m\]] [\[\e[38;2;189;182;156m\] \w \[\e[0m\]] [\[\e[38;2;113;125;140m\] \t \[\e[0m\]]\n[\[\e[38;2;128;206;185m\] \u \[\e[0m\]] $ "
	fi
else 
	PS1="[ \h ] [ \w ] [ \t ]\n[ \u ] $ "
fi
unset color_prompt

# terminal title
case "$TERM" in
	xterm*|rxvt*)
		PS1="\[\e]0;[ \u ] [ \h ]\a\]$PS1"
		;;
	*)
		;;
esac

# enable color support of ls and other commands
if [ -x /usr/bin/dircolors ]; then
	test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'
fi
# load aliases from seperated file like
# ~/.bash_aliases, instead of adding them here directly.
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -x /usr/bin/mint-fortune ]; then
     /usr/bin/mint-fortune
fi
