- Global .gitignore should be placed in ~/.config/git/ignore and should have neovim swap files

- Having Tailscale SSH enabled on server (with `sudo tailscale set --ssh=true`) makes it take over SSH connections to Tailscale IP, requiring login and preventing automatic connection via secret key
- Should have separate SSH key for server borg repo that does not require password but does not allow non-borg commands (and ensure other key requires a password)
