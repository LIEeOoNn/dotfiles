# Notes on system stability and tools

## Todo for documentation
1. config bat, fzf
2. get z for cd
3. change to diffrent terminal 
5. setup nvim
6. manpage video again

## tools
- bat       used as cat
- fzf
- z         used as cd 
- nmtui     used for network gui
- stow      read below 
- hyprshot  take screenshot 

## Important package list 
- pipewire      auido
- wireplumper   screen sharing
- swaync        notification daemon

## Important package descriptions and usage

### stow 
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

Use `ls -lha` to see if the symlink is correct 

## Keymaps 

### Hyper
Look at `~/.config/hypr/hyprland.conf` for all bindings
$mainMod = SUPER # Sets "Windows" key as main modifier
#### Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

$mainMod = SUPER # Sets "Windows" key as main modifier

#### Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

`$mainMod Q`        :open terminal
`$mainMod C`        :kill active window
`$mainMod M`        :exit
`$mainMod E`        :execute file manager
`$mainMod V`        :toggle floating window
`$mainMod Space`    :execute menu
`$mainMod P`        :pseudo mode (dwindle)
`$mainMod J`        :toggle split mode (dwindle)

#### Screenshots
`$SHIFT CONTROL 3`  :screenshot window to clipboard
`$SHIFT CONTROL 4`  :screenshot region to clipboard

#### Lock screen
`$mainMod SHIFT L`  :lock screen

#### Move focus with mainMod + arrow keys
`$mainMod Left`     :move focus left
`$mainMod Right`    :move focus right
`$mainMod Up`       :move focus up
`$mainMod Down`     :move focus down

#### Move focus with mainMod + vim keys
`$mainMod H`        :move focus left
`$mainMod L`        :move focus right
`$mainMod K`        :move focus up
`$mainMod J`        :move focus down

#### Switch workspaces with mainMod + [0-9]
`$mainMod Number`        :switch to workspace Number
#### Move active window to a workspace with mainMod + SHIFT + [0-9]
`$mainMod_SHIFT Number`  :move active window to workspace Number

#### Example special workspace (scratchpad)
`$mainMod S`            :toggle special workspace (magic)
`$mainMod SHIFT S`      :move active window to special workspace (magic)

#### Scroll through existing workspaces with mainMod + scroll
`$mainMod MouseDown`    :go to next workspace
`$mainMod MouseUp`      :go to previous workspace

#### Move/resize windows with mainMod + LMB/RMB and dragging
`$mainMod MouseLMB`     :move window
`$mainMod MouseRMB`     :resize window

#### Laptop multimedia keys for volume and LCD brightness
`Fn F3`             :increase volume
`Fn F2`             :decrease volume
`Fn F1`             :toggle mute
`Fn F4`             :toggle microphone mute
`Fn F6`             :increase brightness
`Fn F5`             :decrease brightness

#### Requires playerctl
`XF86AudioNext`     :play next track
`XF86AudioPause`    :pause/resume playback
`XF86AudioPlay`     :play/resume playback
`XF86AudioPrev`     :play previous track

### Neovim

#### Neotree
`Ctrl b`   :Neotree filesystem reveal
`Ctrl c`   :Neotree filesystem close 

#### telescope 
`space ff`  :find files 
`space rf`  :find in recently opened files
`space sd`  :search diagnostics 
`space sh`  :search help 
`space sw`  :search current word 
`space sg`  :search by grep

#### none-ls 
In `none-ls` we declare all the `formater`, `linter` and `completions` we want to have.

`F`         : format file 

#### completions 
`ctrl space`:complete 
`Enter`     :confirm 
`ctrl e`    :abort 
`ctrl b`    :scroll docs -4 
`ctrl f`    :scroll docs 4 


#### lsp-config 
- `mason-lspconfig` we add language servers here 
- `nvim-lspconfig` here we tell vim to work with the lsps
`K`         :hover documentation
`space ca`  :code action 
`space rn`  :rename 
`gd`        :goto definition 
`gD`        :goto Declaration 
`gr`        :goto refrences 
`gI`        :goto Implementation 
`space D`   :type definition
`Ctrl k`    :signature documentation 
`space wa`  :workspace add folder 
`space wr`  :workspace remove folder 
`space wl`  :workspace list folders 
`space ds`  :document symboles 
`space ws`  :workspace symboles 
`[d`        :Go to prev diagnostics message
`]d`        :Go to next diagnostics message
`space q`   :diagnostics list 
`space e`   :floating diagnostic message 

#### debugging
`space dc`  :continue 
`F10`       :step over 
`F11`       :step into 
`F12`       :step out 
`space db`  :toggle breakpoint 
`space dB`  :set breakpoint 
`space lp`  :set breakpoint with log message 
`space dr`  :repl.open 
`space dl`  :run last 
`space dh`  :hover 
`space dp`  :preview 
`space df`  :frames 
`space ds`  :scopes 
