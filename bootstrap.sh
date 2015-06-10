dotfiles=$(pwd)
sublime_dir=$HOME/.config/sublime-text-3
sublime_pkg=$sublime_dir/Packages

# From https://github.com/holman/dotfiles/blob/master/script/bootstrap

info () {
  printf "  [ \033[00;34m..\033[0m ] $1"
}

user () {
  printf "\r  [ \033[0;33m?\033[0m ] $1 "
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
}

link_file () {
  local src=$1 dst=$2

  local overwrite= backup= skip=
  local action=

  if [ -f "$dst" -o -d "$dst" -o -L "$dst" ]
  then

    if [ "$overwrite_all" == "false" ] && [ "$backup_all" == "false" ] && [ "$skip_all" == "false" ]
    then

      local currentSrc="$(readlink $dst)"

      if [ "$currentSrc" == "$src" ]
      then

        skip=true;

      else

        user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
        [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"
        read -n 1 action

        case "$action" in
          o )
            overwrite=true;;
          O )
            overwrite_all=true;;
          b )
            backup=true;;
          B )
            backup_all=true;;
          s )
            skip=true;;
          S )
            skip_all=true;;
          * )
            ;;
        esac

      fi

    fi

    overwrite=${overwrite:-$overwrite_all}
    backup=${backup:-$backup_all}
    skip=${skip:-$skip_all}

    if [ "$overwrite" == "true" ]
    then
      rm -rf "$dst"
      success "removed $dst"
    fi

    if [ "$backup" == "true" ]
    then
      mv "$dst" "${dst}.backup"
      success "moved $dst to ${dst}.backup"
    fi

    if [ "$skip" == "true" ]
    then
      success "skipped $src"
    fi
  fi

  if [ "$skip" != "true" ]  # "false" or empty
  then
    ln -s "$1" "$2"
    success "linked $1 to $2"
  fi
}


# Mix between:
# https://github.com/paulmillr/dotfiles
# and
# https://github.com/paulmillr/dotfiles
install_home_dotfiles () {
  info 'installing dotfiles'

  local overwrite_all=false backup_all=false skip_all=false

  for location in $(find home -name '.*'); do
	  file="${location##*/}"
	  file="${file%.sh}"
	  link_file "$dotfiles/$location" "$HOME/$file"
  done
}

install_bin() {
  info 'installing bin'
  echo ''

  mkdir "$HOME/bin"

  local overwrite_all=false backup_all=false skip_all=false

  for location in bin/*; do
    file="${location##*/}"
    link_file "$dotfiles/$location" "$HOME/bin/$file"
  done
}

get_package_control () {
    info 'Installing Package Control for Sublime Text'
    wget https://packagecontrol.io/Package%20Control.sublime-package
    mv "Package Control.sublime-package" "$sublime_dir/Installed Packages"
}
install_sublime () {
  info 'installing sublime'
  echo ''

  if [ ! -d $sublime_pkg ]
  then
    fail 'Sublime Text could not be found.'
    return
  fi

  if [ ! -f "$sublime_dir/Installed Packages/Package Control.sublime-package" ]
  then
    get_package_control
  fi

  local overwrite_all=false backup_all=false skip_all=false


  for location in sublime/*/ ; do
    base=${location%/}
      base=$(basename $base)
      src="$dotfiles/$location"
      dest="$sublime_pkg/$base"
      link_file "$src" "$dest"
  done
}


setup_gitconfig () {
  info 'setup gitconfig'

  user ' - What is your github author name?'
  read -e git_authorname
  user ' - What is your github author email?'
  read -e git_authoremail

  git config --global user.name "$git_authorname"
  git config --global user.email "$git_authoremail"

  success 'gitconfig'
}

install_home_dotfiles
install_bin
install_sublime
if [ "$1" != "--no-git" ]
then
  setup_gitconfig
fi
