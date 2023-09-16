#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/bin" ] ; then
    PATH="/snap/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# if [ -z "$SSH_AUTH_SOCK" ]; then
#    # Check for a currently running instance of the agent
#    RUNNING_AGENT="`ps -ax | grep 'ssh-agent -s' | grep -v grep | wc -l | tr -d '[:space:]'`"
#    if [ "$RUNNING_AGENT" = "0" ]; then
#         # Launch a new instance of the agent
#         ssh-agent -s &> .ssh/ssh-agent
#    fi
#    eval `cat .ssh/ssh-agent`
# fi

# SSH_ENV="$HOME/.ssh/environment"
#
# function start_agent {
#      echo "Initialising new SSH agent..."
#      /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
#      echo succeeded
#      chmod 600 "${SSH_ENV}"
#      . "${SSH_ENV}" > /dev/null
#      /usr/bin/ssh-add;
# }
#
# # Source SSH settings, if applicable
# if [ -f "${SSH_ENV}" ]; then
#      . "${SSH_ENV}" > /dev/null
#      #ps ${SSH_AGENT_PID} doesn't work under cywgin
#      ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
#          start_agent;
#      }
# else
#      start_agent;
# fi

export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/bin
# neofetch
