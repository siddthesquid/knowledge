# Shell

This is a concise collection of notes on using the shell. `zsh` is assumed.

# Theory

A shell takes **commands**

There are two types of shells

- interactive
- login

# Configuration

# Syntax

A simple command is

```sh
# [OPTIONAL PARAMETERS] COMMAND [ARGUMENTS]
FOO=World zsh -c 'echo Hello $FOO' # Hello World
```

# Substitution

# Completion

# Useful commands

### `man` - `man`ual

Standard documentation for most commands.

```sh
# man [COMMAND]
man ls
```

## Editors

### `cat` - con`cat`enate

The easiest way to view a file.

```sh
# cat [FILE]...
cat /etc/hosts /etc/hostname
```

### `less`

### `xxd`

### `vim`, `vi`

### `nano`

### `emacs`

## Stream manipulation

### `awk`

#### Resources

- [`gawk` manual](https://www.gnu.org/software/gawk/manual/gawk.html)

### `sed`

### `expand`

### `sort`

### `uniq`

### `jq`

### `grep`

### `cut`

### `tr`

### `wc`

### `head`

### `tail`

### `echo`

## Cryptography

### `ssh-keygen`

### `ssh-copy-id`

### `ssh-agent`

### `ssh-add`

### `ssh`

### `scp`

### `rsync`

### `gpg`

### `sftp`

### `openssl`

## Networking

### `curl`

### `wget`

### `netstat`

### `ifconfig`

### `ip`

### `route`

### `ping`

### `traceroute`

### `mtr`

### `dig`

### `nslookup`

### `tcpdump`

### `nmap`

### `whois`

### `ufw`

### `iptables`

## Compression

### `tar`

### `gzip`

### `bzip2`

### `xz`

### `zip`

### `unzip`

## Filesystem

### `cp`

### `ln`

### `mv`

### `rm`

### `mkdir`

### `rmdir`

### `find`

### `ls`

### `lsblk`

### `tree`

### `df`

### `du`

### `free`

### `file`

### `diff`

### `cmp`

### `comm`

### `patch`

### `touch`

### `mkfifo`

## Operating system

### `shutdown`

### `reboot`

### `halt`

### `poweroff`

### `systemctl`

### `service`

### `journalctl`

### `dmesg`

## Terminal interaction

### `tmux`

### `cd`

### `pwd`

### `alias`

### `unalias`

### `history`

### `clear`

### `exit`

### `which`

### `whereis`

### `whatis`

### `pushd`

### `popd`

### `dirs`

### `printenv`

### `set`

### `unset`

## Process

### `ps`

### `pstree`

### `lsof`

### `top`

### `kill`

### `killall`

### `sh`

### `xargs`

### `coproc`

### `fg`

### `bg`

### `sleep`

### `watch`

### `nohup`

### `nice`

### `renice`

### `at`

### `batch`

### `cron`

### `crontab`

### `atq`

### `atrm`

## Info

### `id`

### `whoami`

### `whatis`

### `hostname`

### `date`

### `cal`

### `uptime`

### `time`

### `uname`

### `arch`

## Permissions

### `chmod`

### `chown`

### `chgrp`

### `sudo`

### `su`

### `passwd`

### `useradd`

### `userdel`

### `usermod`

### `groupadd`

### `groupdel`

### `groupmod`

## Disk operations

### `dd`

### `mount`

### `umount`

### `blkid`

### `fdisk`

### `parted`

### `mkfs`

### `mkswap`

### `swapon`

### `swapoff`

## Misc

### `git`

### `man`

# Resources

- [man zshmisc](https://www.mankier.com/1/zshmisc#Simple_Commands_&_Pipelines) - Pretty good and concise breakdown of how the shell works (`zsh` specific)
