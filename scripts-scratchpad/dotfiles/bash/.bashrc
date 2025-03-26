# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
*i*) ;;
*) return ;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
xterm-color | *-256color) color_prompt=yes ;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm* | rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
*) ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto'
  alias la='ls -a  --color=auto'
  #alias dir='dir --color=auto'
  #alias vdir='vdir --color=auto'

  #alias grep='grep --color=auto'
  #alias fgrep='fgrep --color=auto'
  #alias egrep='egrep --color=auto'
fi

# Random aliases
alias 'please?'='sudo $(history 2 | cut -c 8- | head -n 1)'
alias wtf='tldr'
alias cowsay='cowsay -f kitten'
alias meow='clear && cowsay -f kitten "MEOW HOOMAN"'
alias toxictux_error='/home/josh/rude.sh /home/josh/rude-comments.txt | cowsay -f tux'
alias toxictux_syntax='/home/josh/rude.sh /home/josh/rude-comments.txt | cowsay -f tux'

# alias for fabric
# Add this to your .bashrc or .zshrc
function fabric_alias() {
  # Store stdin in a variable if it exists
  if [ ! -t 0 ]; then
    content=$(cat)
  else
    echo "Error: No input provided via pipe" >&2
    return 1
  fi

  # Get pattern selection via fzf
  local pattern=$(fabric -l | fzf --height 40% --reverse)
  if [ -n "$pattern" ]; then
    printf '%s' "$content" | fabric -sp "$pattern"
  fi
}
alias fab='fabric_alias'

# Taskwarrior functions and aliases

alias taskc='taskcommands'
alias ta='task add'
alias tm='task modify'
alias tc='task $1 annotate'
alias td='task $1 done'
# alias tq='createQuote'
alias tb='createBooking $1'

createBookingSub() {
  ta "$1" +booking +work project:"$2" | grep -oP '(?<=Created task )\d+'
}

createBooking() {
  local project_tag="quote $1"

  subtask1=$(createBookingSub 'send Email to Heidi about PO and request ship address' "$project_tag")
  subtask2=$(createBookingSub 'confirm Kevin and Heidi approve PO' "$project_tag")
  subtask3=$(createBookingSub 'create dashes' "$project_tag")
  subtask4=$(createBookingSub 'adjust costs in dashes' "$project_tag")
  subtask5=$(createBookingSub 'assign quote category' "$project_tag")
  subtask6=$(createBookingSub 'create work order' "$project_tag")
  subtask7=$(createBookingSub 'adjust ship dates and process dates' "$project_tag")
  subtask8=$(createBookingSub 'validate invoice lines and costs' "$project_tag")
  subtask9=$(createBookingSub 'book job' "$project_tag")
  subtask10=$(createBookingSub 'approve PO invoice' "$project_tag")
  subtask11=$(createBookingSub 'complete checklist' "$project_tag")
  subtask12=$(createBookingSub 'create work order notes' "$project_tag")
  subtask13=$(createBookingSub 'populate work order folders' "$project_tag")
  subtask14=$(createBookingSub 'create crating plan and release process line' "$project_tag")
  subtask15=$(createBookingSub 'schedule kickoff meeting' "$project_tag")
  subtask16=$(createBookingSub 'prepare order acknowledgement' "$project_tag")

  ta booking "$project_tag" +booking +work project:"$project_tag" due:today depends:$subtask1,$subtask2,$subtask3,$subtask4,$subtask5,$subtask6,$subtask7,$subtask8,$subtask9,$subtask10,$subtask11,$subtask12,$subtask13,$subtask14,$subtask15,$subtask16
}
taskcommands() {
  echo 'ta - task add'
  echo 'tm - task modify'
  echo 'tc - task annotated (comment)'
  echo 'td - task done'
  echo 'tb - create booking [quote number]'
}

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

alias yeetjs='node /home/josh/code/github/code-context-yeeter/yeetCode.js'
alias yeet='/home/josh/code/github/code-context-yeeter/yeetCode.sh'
alias ask='/home/josh/code/ollama/ask'
alias cat="batcat"
alias f="fzf --preview 'batcat {}' --bind 'enter:execute(nvim {})'"
alias ff="find / \( -type f -o -name '.*' \) 2>/dev/null | fzf --preview 'batcat {}' --bind 'enter:execute(nvim {})'"
alias vim="nvim"
# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

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

# Set default editor
export EDITOR='nvim'
export PATH="/usr/local/go/bin:$PATH"
export PATH="/home/josh/go/bin:$PATH"
export PATH="$PATH:/opt/nvim-linux64/bin"
# export PS1="${debian_chroot:($debian_chroot)}\033[34;01m\]\u@\h🐧: "
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" >/dev/null
eval $(ssh-agent) >/dev/null 2>&1
ssh-add ~/.ssh/github >/dev/null 2>&1
trap 'ssh-agent -k' EXIT >/dev/null 2>&1

eval "$(starship init bash)"

~/splash.sh
# cowsay -f kitten "Remember to Catppuccin all the things \m/ (>.<) \m/"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# TOXIC TUX
# Function to handle errors globally
error_handler() {
  local exit_code=$?
  local last_command=$BASH_COMMAND

  # Check if it's a syntax error
  if [[ $exit_code -eq 2 && "$last_command" == *"syntax error"* ]]; then
    echo ""
    if command -v toxictux_syntax &>/dev/null; then
      toxictux_syntax
    else
      echo "Warning: toxictux program not found."
    fi
  else
    echo ""
    if command -v toxictux_error &>/dev/null; then
      toxictux_error
    else
      echo "Warning: toxictux program not found."
    fi
  fi

  return $exit_code
}

# Set the trap for errors
trap 'error_handler' ERR

# Function to run commands with error handling
run_command() {
  # Run the command and capture its output and exit code
  output=$(eval "$@" 2>&1)
  exit_code=$?

  # If there was an error, print the output and handle the error
  if [ $exit_code -ne 0 ]; then
    echo "$output"
    error_handler
  else
    # If no error, just print the output
    echo "$output"
  fi

  # return $exit_code
}

# Alias to use run_command for all commands
alias run='run_command'
