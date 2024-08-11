#!/usr/bin/env bash

cat vscode/extensions.txt | xargs -n1 code --install-extension
cp vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json
