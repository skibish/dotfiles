#!/usr/bin/env bash

code --list-extensions > vscode/extensions.txt
cp $HOME/Library/Application\ Support/Code/User/settings.json vscode/settings.json
