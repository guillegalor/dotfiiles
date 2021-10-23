# dotfiles
## Usage
Saving your settings:

If you want to back up a file ~/route/file.txt for an app 'app', just move it to 

```~/.dotfiles/app/route/file.txt```

, then execute

```ln -s ~/app/route/file.txt ~/route/file.txt```

Restoring settings in a new device:
1. Clone this repository
2. cd ./dotfiles
3. stow "app name"
