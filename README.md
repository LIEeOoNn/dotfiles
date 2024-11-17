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

## stow 
- Manage installation of multiple softwares in the same directory tree

https://www.youtube.com/watch?v=y6XCebnB9gs&themeRefresh=1
  
Helps with overlooking dotfiles through the dotfiles dir. 

#### Attention
the dotfile needs to be at the same place in the dotfile tree,
then in the $HOME tree.

e.g. ~/.bashrc == dotfiles/.bashrc

#### Usage
Copy the desired dotfile to the correct place in the dotfiles tree,
corresponding to the $HOME tree:
```
cp ~/.bashrc ~/dotfiles/
```

Use `ls -lha` to see if the symlink is correct 

Delete/renmae the original dotfile from the $HOME folder (rename is prefered):
```
 mv ~/.bashrc ~/.bashrc.bak
 ```

Now we only need to run
```
$ stow .
```
in the dotfiles directory and the symlink 
will be created.
