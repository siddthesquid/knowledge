# Linux from Scratch

This guide follows [Linux from Scratch](https://www.linuxfromscratch.org/), which allows me to build a version of Linux however I want to use it. I'll try to follow along and give commands/instructions to copy and paste so that repeating the process with opinionated modifications is easier to do that just reading the book.

Note that the book still regularly gets updates, but this might not be updated.

## Theory

Before we jump into building Linux, let's just figure out how exactly we want it set up.

### Directories

### Users

### Networking

### Applications

### Display

What partitions do we want on the machine? First, let's understand what directories exist and what their purpose should be:

* `/bin` - binary executables made available to all users - things like `cd` and `ls` and many others
* `/dev` - don't really need to worry about this as far as partitions go. These are devices that are masked as files
* `/etc` - configuration files for the entire operating system
* `/usr`
* `/home` - user files. User's should only have full access to their 

fda

* Installation
  * `/opt`
  * `/bin`
  * `/usr`
  * stuff that can be thrown away
* User files
  * `/home`
* Data
  * `var`
  * `data`
* Root
  * `/`
  * `/tmp`
  * remaining directories
* Swap



## Preparing for the build

Running the below in this directory gives a good way of getting version numbers of required tools for the build.

```sh
bash version-check.sh
```

### Partitions