# Homebrew tap for IpBump

[IpBump](https://github.com/discoveruz/IpBump) moves your computer to a free local IPv4 address. On a Mac it lives in the menu bar.

```sh
brew install --cask discoveruz/tap/ipbump
```

Homebrew asks for your password once, to install IpBump's helper. `brew upgrade` keeps it current.

`brew uninstall --cask ipbump` removes the app, the helper and the login item. It leaves your network settings and your AI agents' configuration as they are. Add `--zap` to remove IpBump's settings too.
