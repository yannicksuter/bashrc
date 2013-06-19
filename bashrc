# bashrc of darktim, evolved over several years...

# ---- language-env DON'T MODIFY THIS LINE!
# settings for german speaking users

LANG="de_DE.UTF-8"
export LANG

#LC_MESSAGES=de_DE
#LC_CTYPE=de_DE
#export LC_MESSAGES LC_CTYPE

if [ -d /usr/X11R6/lib/X11/nls ]; then
    XNLSPATH=/usr/X11R6/lib/X11/nls
    export XNLSPATH
fi

export MM_CHARSET=de_DE.UTF-8
# ---- language-env end DON'T MODIFY THIS LINE!

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoreboth
export HISTFILESIZE=4000
# dont put the following in the bash_history (an arrow up + return would be bad with rm or reboot ;)
export HISTIGNORE="rm -rf*:history*:reboot:shutdown*:ll:"
export FACTERLIB=/var/lib/puppet/lib/facter

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=yes
    else
        color_prompt=
    fi
fi

# please use colors (red for root and green for normal users)
# please add git prompt
if [ "$color_prompt" = yes ]; then
  case $USER in
  root)
  # optimized for Debian
        PS1='\[\033[01;33m\][\t]\[\033[00m\] ${debian_chroot:+($debian_chroot)}\[\033[00;31m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\W\[\033[00m\]\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\$\[\033[00m\] '
        ;;
    *)
      PS1='\[\033[01;33m\][\t]\[\033[00m\] ${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\W\[\033[00m\]\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\]\$\[\033[00m\] '
    ;;
  esac
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# if there is a local .bashrc.local, include it
if [ -f ~/.bashrc.local ]; then
    . ~/.bashrc.local
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

umask 022
export EDITOR=vim
export VISUAL=$EDITOR

