# Modern C++ Development

This is a practical guide to modern C++ development. In general, C++ has valued backwards compatability as new versions came out, but that has led to the language becoming more difficult to work with and master. I think [this talk](https://www.youtube.com/watch?v=ELeZAKCN4tY) highlights how much better it could be.

There are many ways of doing the same things in this world. Ideally, we want to know as little syntax as possible without ANY compromises to performance or functionality, and our workflow should be dead simple. This guide is super-opinionated on how to do things, but it highly values

- long-term, large-scale projects
- latest/modern features
- minimal syntax
- code readability over minor performance gains
- but still minimal performance compromises
- whole project optimizations
- modular/monorepo layouts
- minimal developer configuration
- first-class developer tooling and support
- developer OS priority: Linux > MacOS > Windows

## Overview

Before we dig into the details, let's see what we want to be able to accomplish with the C++ ecosystem and how we can interact with it. We want to be able to support the following types of build targets:

- static libraries
- dynamic libraries
- standard executables
- WASM
- OpenGL
- Vulkan
- CUDA
- kernel modules
- custom/embedded systems

We generally want each repository (i.e. git) to be a monorepo. Each package of a monorepo should either represent

- a single library that can be installed via a package manager with static and/or dynamic linking options made available to consumers
- one of the other types of target types listed above, which may link to other libraries, either statically or dynamically
- (potentially multiple targets on a custom, case-by-case basis)

Each package should ideally be completely self-contained - this means different packages should be able to use different C++ versions. CMake will manage the "monorepo" features of a project.

### Project Layout

```
project/
  root/
    bin/
    lib/
    include/
    src/
  imports/
  lib/
    foo/
      build/
      coverage/
      include/
      src/
      test/
      CMakeLists.txt
      VERSION
    bar/
      build/
      coverage/
      include/
      src/
      test/
      CMakeLists.txt
      VERSION
  app/
    baz/
      build/
      src/
      test/
      CMakeLists.txt
      VERSION
    biz/
      build/
      src/
      test/
      CMakeLists.txt
      VERSION
  CMakeLists.txt
```

### External Dependency Management

### Workflow

When we develop, we should only call commands from the root of our project. Our workflow should generally consist of

| command        | description                                         |
| -------------- | --------------------------------------------------- |
| `make clean`   | clean any build artifacts                           |
| `make install` | install any depdenencies or warn of missing ones    |
| `make dev`     | start/restart any servers useful while writing code |
| `make format`  | lint and format the project                         |
| `make debug`   | build the project in debug mode                     |
| `make build`   | build the project entirely                          |
| `make test`    | run all tests                                       |
| `make`         | help menu                                           |

Our CI workflow should look like:

| command              | description                                                                                  |
| -------------------- | -------------------------------------------------------------------------------------------- |
| `make ci-cache-load` | load any cached build artifacts                                                              |
| `make ci-install`    | install any depdenencies or warn of missing ones                                             |
| `make ci-version`    | version the project according to [conventional commits](https://www.conventionalcommits.org) |
| `make ci-lint`       | lint the project in CI mode                                                                  |
| `make ci-build`      | build the project in CI mode                                                                 |
| `make ci-test`       | run all tests in CI mode                                                                     |
| `make ci-publish`    | publish the projects to wherever they need to go                                             |
| `make ci-cache-save` | cache any build artifacts                                                                    |

In my opinion, these commands are simple, yet complete and flexible. Here are some principles to keep in mind:

- it is up to the packages to decide how to implement them in a way that best fits the descriptions above
- top-level CMake options should be kept to a mimimum and should all be focused on development and debugging
- only the `make debug` command should honor any user configured CMake options
- project specific options should be configured via environment variables set in a `.env` file (checked in) and overridable via a `.env.local` file (local) by users or CI. Project specific options should not be cached

## Target Types

There are two main target types - libraries and "applications". Applications are anything that isn't a library. This section quickly goes over

- the different target types
- what the build process looks like
- how these targets are to be consumed

### Static Libraries

### Dynamic Libraries

### Executables

Each operating system has it's own definition of what it considers an executable.

| OS      | Executable Type |
| ------- | --------------- |
| Linux   | ELF             |
| MacOS   | Mach-O          |
| Windows | PE              |

These applications can interact with TTY, the filesystem, the network, etc.

### WASM

### OpenGL

### Vulkan

### CUDA

### Kernel Modules

### Custom/Embedded Systems

## History of C and C++ Features

Even though we don't care to actually know how to use all the features of C++, it is still helpful to know what features are available and how C++ has grown over the years.

## Compiler, Linker, Loader, and ELF Files

## `g++`

Before we learn CMake, let's understand how to use the vanilla `g++` compiler and the different flags that it supports. In this section, we want to be comfortable with

- creating a simple executable
- creating a static library (and linking it)
- creating a shared library (and linking it)
- downloading and linking boost

## CMake

CMake is not super well-designed, but it is the de facto standard for C++ projects, so learning it is necessary. CMake itself is not a build system - instead, it generates build system files for other build systems, like `make`. But, let's be honest - we are going to use it like a build system.

## Linting and Formatting

## Modern C++

### Hello, World!

### Numbers

### String Manipulation

### Bit Operations

### Pointers and References

### l-values, r-values, and Move Semantics

### Functions and Lambdas

### Classes

### Templates, Constraints, and Concepts

### STL Containers and Algorithms

#### Iterators

#### Containers

#### Algorithms

### IO

#### Logging

#### Filesystem

#### Clock

#### Networking

#### Random

#### Process Management

### Concurency and Parallelism

## Testing

## Debugging

## Documentation

## Resources

- [How to Write Shared Libraries](https://www.cs.dartmouth.edu/~sergey/cs258/ABI/UlrichDrepper-How-To-Write-Shared-Libraries.pdf) - in-depth guide to how Linux deals with executables and shared libraries
- [CMake Reference](https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html)
- [Professional CMake](https://crascit.com/professional-cmake/) - good book to learn practical C++ development
- [The Ultimate CMake/C++ Quick Start](https://www.youtube.com/watch?v=YbgH7yat-Jo)
- [g++ man page](https://man7.org/linux/man-pages/man1/g++.1.html)
- [STL Algorithms](https://www.youtube.com/watch?v=2olsGf6JIkU) - the mental model the speaker uses for STL algorithms is very helpful - the best resource I've seen for understanding STL algorithms
- [cpp2](https://www.youtube.com/watch?v=ELeZAKCN4tY) - this video highlights some of the biggest problems with C++ by introducing a new language, `cpp2`, which is a superset of C++ and shows how much cleaner C++ can be without sacrificing performance
