# Selim’s dotfiles

## First Steps
```bash
sudo apt-get install zsh
chsh -s $(which zsh)  # Restart computer for this to take effect.
sudo apt-get install git
```
[Generate SSH keys](https://help.github.com/articles/generating-ssh-keys/#platform-linux)
Now you're ready to clone this.

## Installation
Start with
```bash
cd ~
git clone https://github.com/beselim/dotfiles.git
cd dotfiles
```
To setup dotfiles:
```bash
scripts/bootstrap
```
Note that this will also install Sublime Text 3 along with the Package Manager -- and the User Packages of course.

To setup packages: 
```bash
scripts/install
```
You will be prompted to confirm which ones you want to install unless you pass the `-y` flag. This may take a while. 

## Pyvenv Wrapper

The functions in `functions/python` provide a simple wrapper for `pyvenv-3.4`. You can use:
```bash
pyv <existing-project>   #  Make virtual environment for this project
work <existing-project>  #  Work on virtual environment for this project
deactivate
```
Environments are created in `~/.venvs/` so that the project directory is not cluttered.

## Extra
#### Scientific Python
```sudo apt-get install python-numpy python-scipy python-matplotlib ipython ipython-notebook python-pandas python-sympy python-nose```

## Inspired from
* [Mathias Bynens](https://mathiasbynens.be/) and his [lovely bash prompt](https://github.com/mathiasbynens/dotfiles)
* [Zach Holman](https://github.com/holman) and his [bootstrapping script](https://github.com/holman/dotfiles/blob/master/script/bootstrap)
* [Paul Miller](https://github.com/paulmillr) and his [dotfiles structure](https://github.com/paulmillr/dotfiles)
