parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

PS1='\[\e[1;32m\]\u@\h\[\e[0m\]:\[\e[1;34m\]\W\[\e[1;35m\]$(parse_git_branch)\[\e[0m\]\$ '

# https://appfolio.slack.com/archives/C1DDNCHAT/p1533668286000556                                                                                                    

function current_branch() { # Gets current branch                                                                                                                    
  git rev-parse --abbrev-ref HEAD
}
function gh_remote_path() { # Parses the 'remote path' of the repo: username/repo                                                                                    
  GH_PATH=`git remote -v | tr ':' ' ' | tr '.' ' ' | awk '/push/ {print $4}'`
  echo ${GH_PATH#com/}
}
function gh() { # Opens current branch on Github, works for all repos                                                                                                
  echo 'Opening branch on Github...'
  open "https://github.com/$(gh_remote_path)/tree/$(current_branch)"
}

# https://appfolio.slack.com/archives/C1DDNCHAT/p1533668286000556                                                                                                    

function current_branch() { # Gets current branch                                                                                                                    
  git rev-parse --abbrev-ref HEAD
}
function gh_remote_path() { # Parses the 'remote path' of the repo: username/repo                                                                                    
  GH_PATH=`git remote -v | tr ':' ' ' | tr '.' ' ' | awk '/push/ {print $4}'`
  echo ${GH_PATH#com/}
}
function gh() { # Opens current branch on Github, works for all repos                                                                                                
  echo 'Opening branch on Github...'
  open "https://github.com/$(gh_remote_path)/tree/$(current_branch)"
}

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
