
PS1="%{%F{red}%}%n%{%f%}@%{%F{blue}%}%m %{%F{yellow}%}%~ %{$%f%}%% "

preexec () {
  echo -ne "\ek${1%% *}\e\\"
}

#LANG="ru_RU.UTF-8"

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# space prepended commands removed from the current session history
setopt histignorespace

#enable autocompletion
autoload -Uz compinit
compinit

# append history list to the history file;
setopt appendhistory

# import new commands from the history file also in other zsh-session
setopt sharehistory

# Remove blank lines from history
setopt hist_reduce_blanks

# Remove all duplicates from history
setopt hist_ignore_all_dups

# Avoid "beep"ing
setopt nobeep

# Extended "globbing"
setopt extended_glob

# try to avoid the 'zsh: no matches found...'
setopt nonomatch

# save each command's beginning timestamp and the duration to the history file
setopt extended_history

# Add comamnds as they are typed, don't wait until shell exit
setopt inc_append_history

# report the status of backgrounds jobs immediately
setopt notify

setopt correctall

setopt noflowcontrol

# Send *not* a HUP signal to running jobs when the shell exits.
setopt nohup

# Report the status of background and suspended jobs before exiting a shell
# with job control; a second attempt to exit the shell will succeed.
setopt checkjobs

# change to directory without "cd"
setopt autocd

# display PID when suspending processes as well
setopt longlistjobs

# whenever a command completion is attempted, make sure the entire command path
# is hashed first.
setopt hash_list_all

# not just at the end
setopt completeinword

# automatically remove duplicates from these arrays
typeset -U path cdpath fpath manpath

# Ignore EOF (Ctrl-D). We set action to custom function
#setopt IGNORE_EOF

# export WORKON_HOME=$HOME/.virtualenvs
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# export PROJECT_HOME=$HOME/Devel
# source /usr/local/bin/virtualenvwrapper.sh
#alias ipython="ipython3 --TerminalInteractiveShell.editing_mode=vi" 
#export PYTHONBREAKPOINT=ipdb.set_trace
#alias t='todo.sh'
