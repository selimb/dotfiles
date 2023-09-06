# From https://mfcallahan.blog/2022/06/24/make-nemo-the-default-file-manager-on-ubuntu/
set -eux

sudo apt install nemo

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
