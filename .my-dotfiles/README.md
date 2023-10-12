# My dotfiles :) 

## Setup
```sh
git init --bare $HOME/.my-dotfiles
alias dotfiles='git --git-dir=$HOME/.my-dotfiles/ --work-tree=$HOME'
dotfiles remote add origin git@github.com:MadsKelberg/my-dotfiles.git
```

## Replication
```sh
git clone --separate-git-dir=$HOME/.my-dotfiles https://github.com/MadsKelberg/my-dotfiles.git my-dotfiles-tmp
rsync --recursive --verbose --exclude '.git' my-dotfiles-tmp/ $HOME/
rm --recursive my-dotfiles-tmp
```

## Configuration
```sh
dotfiles config status.showUntrackedFiles no
dotfiles remote set-url origin git@github.com:MadsKelberg/my-dotfiles.git
```

## Usage
```sh
dotfiles status
dotfiles add .gitconfig
dotfiles commit -m 'Add gitconfig'
dotfiles push
```

