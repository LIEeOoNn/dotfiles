## Install step's 
0. connect to internet
    $ iwctl
    [iwd]# device list 
    [iwd]# station 'device_name' get-networks
    [iwd]# station 'device_name' connect 'SSID'

1. look with 'lsblk' at partition then run
    $ fdisk /dev/disk_to_partition
    delete a partition using 'd'
    $ > d 
    add a new using 'n'
    $ > n 
    this will be the boot partition so make it +1G
    afterwards make the root partition the rest of the left space doing  
    $ > n  // if asked 'remove signature' say 'yes'
    $ > n // again and just press enter again removing signature if given 
    this will be rest of the drive
    then use 'w' to save everything 
    $ > w

3.  make boot partition uefi compatiable 
    $ mkfs.fat -F32 /dev/The_boot_partition
    and a filesytem for the other 
    $ mkfs.btrfs /dev/the_root_partition 

4.  mount boot and root 
    $ mount /dev/the_big_one /mnt
    $ mkdir /mnt/boot
    $ mount /dev/the_small_one /mnt/boot

5. $ nvim /etc/pacman.d/mirrorlist 
    move germany up
   or do
   $ reflector --country Germany --latest 10 --sort rate --save /etc/pacman.d/mirrorlist
    $ pacstrap -i /mnt base base-devel linux linux-firmware grub efibootmgr git openssh firefox stow neovim vim networkmanager kitty  
7. $ arch-chroot /mnt

5.5 set time 
    $ ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
    $ hwclock -- systohc
    
6. open $ nvim /etc/locale.gen and uncomment the LANG   we want to use then do
    $ nvim /etc/locale.conf 
    write 'export LANG=de_DE.UTF-8'
          'export LC_COLLATE="C"
    finally run $locale-gen

7. echo "hostname" > /etc/hostname

8. go to $ nvim /etc/hosts  add 
    127.0.0.1   localhost
    ::1         localhost
    127.0.1.1   arch.localdomain arch

9. $ sudo systemctl enable NetworkManager.service

10. $ useradd -G wheel -m 'username'
    $ Editor=nvim visudo
     and uncomment
    ´# %wheel ALL=(ALL:ALL) ALL´

12. $ genfstab -U /mnt >> /mnt/etc/fstab
    $ grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
    if this isnt working add '-removeable' flag after GRUB
    $ grub-mkconfig -o /boot/grub/grub.cfg 

13. $ parted /dev/sda print 
    look if the flags for sda1 are 'boot, esp' if esp missing and you are using uefi do 
    $ parted /dev/sda set 1 esp on 

14.  
Note: if reboot doesn't work and you need to get back throught the live iso do:
        $ mount /dev/sda2 /mnt
        $ mount /dev/sda1 /mnt/boot
      if GRUB missing from the UEFI boot entries add it manually using
        $ efibootmgr -c -d /dev/sda -p 1 -L "Arch-Linux" \EFI\grub\grubx64.efi 
      and check if its now listed using $ efibootmgr
      if the laptops boot manager doesnt show grub try 
        $ cp /boot/EFI/GRUB/grubx64.efi /boot/EFI/BOOT/BOOTX64.EFI   
      !!! had to do this for karls acer 
### packages:
#### pacman
python-dbus 
wayland
hyperland 
hyprlock 
hyprpaper
waybar 
swaync
dolphin
kitty
wofi
stow 
git 
firefox 
code
fastfetch 
openssh
libraoffice
flatpak

#### yay
Set up yay:

$ git clone https://aur.archlinux.org/yay.git
$ cd yay
$ makepkg -si

hyprshot

uwsm 

#### flatpak 
Set up flatpak:

$ flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
$ flatpak remote-add --if-not-exists flathub-beta https://flathub.org/beta-repo/flathub-beta.flatpakrepo

spotify 
$ flatpak install flathub com.spotify.Client

discord-canary 
$ flatpak install flathub-beta com.discordapp.DiscordCanary

## Dotfiles 
Set up all the needed config files:

$ git clone https://github.com/LIEeOoNn/dotfiles 
$ cd dotfiles 
$ stow . 
or 
$ stow -Rvt ~ .
