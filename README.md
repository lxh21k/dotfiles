# Backup my dotfiles
- Backup my application settings in the same directory
- Sync this files by [symbolic link](https://en.wikipedia.org/wiki/Symbolic_link)
- Restore this files when my system goes down again

## How to backup
Move dotfiles to this Git repo and link them to their original directory.

Take `.zshrc` as an example:
``` shell
cp ~/.zshrc ~/dotfiles/.zshrc
rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
```

Then use git to manage all these files and push them to GitHub.

## Restore
Pull this repo from GitHub and link them to the dictories that they should stay again.

``` shell
ln -s ~/dotfiles/.zshrc ~/.zshrc
```
