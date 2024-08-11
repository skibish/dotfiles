
#!/usr/bin/env bash

# If zsh is not installed, install it and make as default
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    chsh -s $(which zsh)
fi

function doIt() {
    rsync --exclude ".git/" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        -avh --no-perms . ~;
    source ~/.zshrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
