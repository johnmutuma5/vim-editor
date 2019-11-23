parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u \[\033[32m\]\W\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
git branch > export this
alias gits="git status"
alias gca="git commit --amend"# added by Anaconda3 2018.12 installer
alias tmux="tmux -2"
# <<< conda init <<<
# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<
export PATH="/usr/local/opt/php@7.0/bin:$PATH"
export PATH="/usr/local/opt/php@7.0/sbin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use node

set editing-mode vim
set -o vi
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
