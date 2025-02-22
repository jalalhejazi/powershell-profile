function deploy  { npm run deploy    }
function deploy-feature  { npm run deploy-feature  }
function deploy-broken  { npm run deploy-broken  }
function deploy-status  { npm run deploy-status  }

function gs       { git status }

function git-set-alias {
    # git config --global --edit
    git config --global alias.s status
    git config --global alias.d diff
    git config --global alias.co checkout
    git config --global alias.br branch
    git config --global alias.last "log -1 HEAD"
    git config --global alias.cmt "commit --amend --no-edit"
    git config --global alias.pr "pull --rebase"
    git config --global alias.h "log --graph --oneline --decorate -n 30"
    git config --global alias.undo '!f() { git reset --hard $(git rev-parse --abbrev-ref HEAD)@{${1-1}}; }; f'
    git config --global alias.spush 'push --recurse-submodules=on-demand'
    
    git config --global color.ui "auto"
    git config --global core.editor "code --wait"
    git config --global init.defaultBranch main
}

function git-set-name {
    param(
        $name = "dev",
        $email = "dev@devops.org"
    )
    git config --global user.email $email
    git config --global user.name $name
}


function git-clone {
    git clone --recurse-submodules $args
}