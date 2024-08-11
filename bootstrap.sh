
#!/usr/bin/env bash

function doIt() {
    rsync --exclude ".git/" \
        --exclude "vscode" \
        --exclude ".DS_Store" \
        --exclude ".osx" \
        --exclude "bootstrap.sh" \
        --exclude "README.md" \
        -avh --no-perms . ~;
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

# Download and install FiraCode
curl -L https://github.com/tonsky/FiraCode/releases/download/4/Fira_Code_v4.zip -o /tmp/firacode.zip
unzip /tmp/firacode.zip -d /tmp/firacode
cp -rv /tmp/firacode/ttf/*  ~/Library/Fonts
rm -rf /tmp/firacode /tmp/firacode.zip

# If zsh is not installed, install it and make as default
if [ ! -d "$HOME/.oh-my-zsh" ]
then
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
    chsh -s $(which zsh)
fi

echo "Reload terminal and you are ready to go!"
