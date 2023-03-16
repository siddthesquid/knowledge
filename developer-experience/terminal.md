# Terminal

This guide provides instructions for a basic terminal setup, including

- Alacritty
- `zsh`
- fonts

## Alacritty

[Alacritty](https://github.com/alacritty/alacritty) is a "fast, cross-platform, OpenGL terminal emulator". It's not really _that_ much different than other terminals, but it supposedly runs faster with its GPU support, so I guess might as well install it. One big downside is lack of support for ligatures.

### Prerequisites

- [Rust](https://www.rust-lang.org/tools/install)
- `sudo dnf install cmake freetype-devel fontconfig-devel libxcb-devel libxkbcommon-devel`
  - above is for CentOS 8
  - dependencies per OS are [here](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#dependencies)

### Installation

```sh
# Clone the repository
cd ~/opt
git clone https://github.com/alacritty/alacritty.git
cd alacritty

# Something with rust, dunno
rustup override set stable
rustup update stable

# Build, and make sure the target was built
cargo build --release
ls target/release/alacritty

# Something with terminfo
sudo tic -xe alacritty,alacritty-direct extra/alacritty.info

# Setup PATH / desktop entries
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```

Alacritty should show up in your applications menu now.

## The shell in general

Before we look at `zsh`, let's make sure we fully understand how the shell works.

## `zsh`

### Structure

There are a few primitive files `zsh` looks for that we need to know about. We also need an organized way of adding additional startup scripts and commands and aliases and all.

`zsh` looks for the following files

- `~/.zshenv` - this is the first file sourced when `zsh` starts up. It is sourced by all shells, and should be kept as minimal as possible. It should only set environment variables, and should not change the shell's behavior in any way.
- `~/.zprofile` - this is sourced in login shells, and should be used for setting the command search path, starting `tmux`, `ssh-agent`, and other general environment setup.
- `~/.zshrc` - this is sourced in interactive shells, and should be used for defining aliases, functions, shell options, and key bindings.
- `~/.zlogin` - this is sourced in login shells after `~/.zshrc`, and is generally used for messages to the user, such as a fortune or a news item.
- `~/.zlogout` - this is sourced when login shells exit, and is generally used for messages to the user, such as a farewell.
-

### Installation

### Configuration

## Fonts

### Installation

### Configuration

## References

- [Alacritty Installation Instructions](https://github.com/alacritty/alacritty/blob/master/INSTALL.md#clone-the-source-code) - from source
