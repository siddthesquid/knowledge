# Modern C++ Development

This is a practical guide to modern C++ development. In general, C++ has valued backwards compatability as new versions came out, but that has led to the language becoming more difficult to work with. I think [this talk](https://www.youtube.com/watch?v=ELeZAKCN4tY) highlights how much better it could be.

There are many ways of doing the same things in this world. Ideally, we want to know as little syntax as possible without ANY compromises to performance or functionality, and our workflow should be dead simple. This guide is super-opinionated on how to do things, but it highly values

- long-term, large-scale projects
- latest/modern features
- minimal syntax
- minimal performance compromises
- whole project optimizations
- modular/monorepo layouts
- minimal developer configuration
- first-class developer tooling and support
- OS priority: Linux > MacOS > Windows

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
- one of the other types of target types listed above, which may choose to link to other dependent libraries, either statically or dynamically
- (potentially multiple targets on a custom, case-by-case basis)

Each package should ideally be completely self-contained - this means different packages should be able to use different C++ versions. CMake will manage the "monorepo" features of a project.

### Project Layout

```
<project-name>/
  root/
    lib/
    include/
    src/
  imports/
  lib/
    foo/
      include/
      src/
      test/
      CMakeLists.txt
    bar/
      include/
      src/
      test/
      CMakeLists.txt
  app/
    baz/
      src/
      test/
      CMakeLists.txt
    biz/
      src/
      test/
      CMakeLists.txt
  CMakeLists.txt
```

### External Dependency Management

### Workflow

When we develop, we should only be calling commands from the roots of our directory, or Our workflow should generally consist of

| command       | description                                    |
| ------------- | ---------------------------------------------- |
| `make clean`  | clean any build artifacts                      |
| `make dev`    | start/restart any servers useful for debugging |
| `make debug`  | build the project in debug mode                |
| `make format` | lint and format the project                    |
| `make build`  | build the project entirely                     |
| `make test`   | run all tests                                  |
| `make`        | (same as `make build`)                         |

Our CI workflow should look like:

| command           | description                                                                                  |
| ----------------- | -------------------------------------------------------------------------------------------- |
| `make ci-version` | version the project according to [conventional commits](https://www.conventionalcommits.org) |
| `make ci-lint`    | lint the project in CI mode                                                                  |
| `make ci-build`   | build the project in CI mode                                                                 |
| `make ci-test`    | run all tests in CI mode                                                                     |
| `make ci-publish` | publish the projects to wherever they need to go                                             |
| `make ci-cache`   | cache any build artifacts                                                                    |

In my opinion, these commands are simple, yet complete and flexible. Here are some principles to keep in mind:

- it is up to the packages to decide how to implement them in a way that best fits the descriptions above
- top-level CMake options should be kept to a mimimum and should all be focused on development and debugging

## Target Types

## History of C and C++ Features

Even though we don't care to actually know how to use all the features of C++, it is still helpful to know what features are available and how C++ has grown over the years.

## Compiler, Linker, Loader, and ELF Files

## CMake

CMake, IMO, is not a well-designed language. However, it is the de facto standard for C++ projects, so learning it is necessary. CMake itself is not a build system - instead, it generates build system files for other build systems, like `make`. But, let's be honest - we are going to use it like a build system.

## Modern C++

### Hello, World!

### Bit Operations

### String Manipulation

### Numbers

### STL Containers and Algorithms

### Templates, Constraints, and Concepts

### Concurency and Parallelism

## Resources

- [CMake Reference](https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html)
- [Professional CMake](https://crascit.com/professional-cmake/) - good book to learn practical C++ development
- [The Ultimate CMake/C++ Quick Start](https://www.youtube.com/watch?v=YbgH7yat-Jo)
- [STL Algorithms](https://www.youtube.com/watch?v=2olsGf6JIkU) - the mental model the speaker uses for STL algorithms is very helpful - the best resource I've seen for understanding STL algorithms
- [cpp2](https://www.youtube.com/watch?v=ELeZAKCN4tY) - this video highlights some of the biggest problems with C++ by introducing a new language, `cpp2`, which is a superset of C++ and shows how much cleaner C++ can be without sacrificing performance
