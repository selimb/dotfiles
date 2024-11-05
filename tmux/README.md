# tmux

## Copy-Paste

Copy-Paste is tricky.

### Local

- On Linux: make sure `xclip` is installed (handled in `install.sh`).
- On Mac OS, make sure `reattach-to-user-namespac` is installed:
  ```
  brew install reattach-to-user-namespace
  ```

### SSH

Copy-Paste over SSH requires:

- `tmux.conf.symlink` to be copied to `~/.tmux.conf` on the remote.
- X11 forwarding to be enabled on the client side and server side.
  - On the *client*, either use `ssh -X` or set `Forward X11 yes` in `~/.ssh/config`.
  - On the *remote*, make sure `X11Forwarding yes` is set in `/etc/ssh/sshd_config`.
  - See https://unix.stackexchange.com/a/12772 for more details.

