# My dotfiles 

This directory contaions the dotfiles for my arch system

## Requirements

Ensure you have the following installed on your system

```
pacam -S git
```

```
pacman -S stow
```
## Installation
Check out the dotfiles repo in your `$HOME` directory using 

```
$ git clone git@github.com:LIEeOoNn/dotfiles.git
$ cd dotfiles
```
then use `stow` to create symlinks
```
$ stow .
```

### stow 
- Manage installation of multiple softwares in the same directory tree

https://www.youtube.com/watch?v=y6XCebnB9gs&themeRefresh=1
  
Helps with overlooking dotfiles through the dotfiles dir. 

Usage: the stored files need to be at the same place as in the home directory 
so the copied dotfile will have the same path as the initial dotfile

e.g. ~/.bashrc = dotfiles/.bashrc
