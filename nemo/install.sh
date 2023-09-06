# From https://mfcallahan.blog/2022/06/24/make-nemo-the-default-file-manager-on-ubuntu/
set -eux

# Include libnotify-bin so that notify-send works in our custom actions.
sudo apt install nemo libnotify-bin

xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-search

gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.nemo.desktop show-desktop-icons true
