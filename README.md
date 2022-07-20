# Selim’s dotfiles

## First Steps

```bash
sudo apt-get install zsh
chsh -s $(which zsh)  # Restart computer for this to take effect.
sudo apt-get install git
```

[Generate SSH keys](https://help.github.com/articles/generating-ssh-keys/#platform-linux)
Now you're ready to clone this.

### 256 color terminal

If your terminal supports 256 colors, add the following line to `~/.localrc`:

```
SUPPORTCOLORS=1
```

## Installation

Start with

```bash
git clone https://github.com/selimb/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

To setup dotfiles:

```bash
scripts/bootstrap
```

To install software:

```bash
scripts/install
```

You will be prompted to confirm which ones you want to install unless you pass the `-y` flag. This may take a while.

## Local Settings and Profiles

TODO

## Inspired from

- [Mathias Bynens](https://mathiasbynens.be/) and his [lovely bash prompt](https://github.com/mathiasbynens/dotfiles)
- [Zach Holman](https://github.com/holman) and his [bootstrapping script](https://github.com/holman/dotfiles/blob/master/script/bootstrap)
- [Paul Miller](https://github.com/paulmillr) and his [dotfiles structure](https://github.com/paulmillr/dotfiles)
