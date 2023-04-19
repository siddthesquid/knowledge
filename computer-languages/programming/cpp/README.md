# Modern C++ Development

This is a guide to modern C++ development. C++ is one of the few avenues of squeezing the last 1-2% of performance out of a computer program. The types of performant applications we want to be able to build are (at the least):

- binaries that can be packaged for, distributed to, and executed on Linux, OS X, and (maybe) Windows, especially including GUI applications (i.e. OpenGL or Vulkan)
- Linux kernel modules
- embedded systems
- WebAssembly modules compiled with EmScripten, with accompanying TypeScript bindings
- CUDA programs for GPU-accelerated computing, to be distributed either as a binary or a library to be linked with a separate compiler

We also want to support separately compiled libraries for any of the above types of applications, with the choice of linking

- statically at compile time
- or dynamically at runtime

So, the ultimate question becomes: **How do we best equip ourselves to build C++ applications and libraries in an organized, scalable, performant, bug-free, auditable, and maintainable way?** It might seem like a lot to ask, but it is doable, as long as we start from solid foundations and approach the solution systematically.

This guide is in the middle of a cheatsheet and a crash course. The topics we'll cover are

- [Modern C++ Development](#modern-c-development)
  - [Goal 1: Standardize C++ Best Practices](#goal-1-standardize-c-best-practices)
  - [Goal 2: Establish **Simple** Developer Workflow](#goal-2-establish-simple-developer-workflow)
  - [Goal 3: Ensure Solid Customer Service](#goal-3-ensure-solid-customer-service)
  - [Goal 4: Prove the Performance and Security](#goal-4-prove-the-performance-and-security)
  - [Goal 5: Convince Ourselves this System Works](#goal-5-convince-ourselves-this-system-works)
- [Overview](#overview)
  - [Project Layout](#project-layout)
  - [External Dependency Management](#external-dependency-management)
  - [Workflow](#workflow)
- [Target Types](#target-types)
  - [Static Libraries](#static-libraries)
  - [Dynamic Libraries](#dynamic-libraries)
  - [Executables](#executables)
  - [WASM](#wasm)
  - [OpenGL](#opengl)
  - [Vulkan](#vulkan)
  - [CUDA](#cuda)
  - [Kernel Modules](#kernel-modules)
  - [Custom/Embedded Systems](#customembedded-systems)
- [History of C and C++ Features](#history-of-c-and-c-features)
- [Compiler, Linker, Loader, and ELF Files](#compiler-linker-loader-and-elf-files)
  - [Libraries](#libraries)
- [`g++`](#g)
  - [Preprocessor](#preprocessor)
- [`Makefile`](#makefile)
- [CMake](#cmake)
- [Linting and Formatting](#linting-and-formatting)
- [Modern C++](#modern-c)
  - [Hello, World!](#hello-world)
  - [Numbers](#numbers)
  - [Bit Operations](#bit-operations)
  - [String Manipulation](#string-manipulation)
  - [`struct`s and arrays](#structs-and-arrays)
  - [Pointers, References, and more Pointers](#pointers-references-and-more-pointers)
  - [l-values, r-values, and Move Semantics](#l-values-r-values-and-move-semantics)
  - [Functions and Lambdas](#functions-and-lambdas)
  - [Classes](#classes)
  - [Namespaces](#namespaces)
  - [`const` and `constexpr`](#const-and-constexpr)
  - [C++ Attributes](#c-attributes)
  - [`noexcept` and `static_assert`](#noexcept-and-static_assert)
  - [Templates, Constraints, and Concepts](#templates-constraints-and-concepts)
  - [STL Containers and Algorithms](#stl-containers-and-algorithms)
    - [Iterators](#iterators)
    - [Containers](#containers)
    - [Algorithms](#algorithms)
  - [IO](#io)
    - [Logging](#logging)
    - [Filesystem](#filesystem)
    - [Clock](#clock)
    - [Networking](#networking)
    - [Random](#random)
    - [Process Management](#process-management)
  - [Concurency and Parallelism](#concurency-and-parallelism)
- [libc](#libc)
- [WASM with Emscripten](#wasm-with-emscripten)
- [CUDA](#cuda-1)
- [Libraries](#libraries-1)
  - [Boost](#boost)
  - [`openssl`](#openssl)
  - [SQLite](#sqlite)
  - [`ffmpeg`](#ffmpeg)
  - [OpenCV](#opencv)
  - [TensorFlow](#tensorflow)
  - [OpenGL](#opengl-1)
  - [Vulkan](#vulkan-1)
  - [SDL](#sdl)
  - [DPDK](#dpdk)
  - [LAPACK](#lapack)
- [Testing](#testing)
- [Debugging](#debugging)
- [Profiling](#profiling)
- [Documentation](#documentation)
- [Packaging](#packaging)
- [CI/CD](#cicd)
- [Resources](#resources)

We're not yet done with the introduction. Let's make sure we understand the goals of this document so it's clear what information we should be looking for.

## Goal 1: Standardize C++ Best Practices

C was created in 1972, and C++ in 1979. Their success is evident from the continued widespread usage seen today, many decades after their invention. C++ has evolved much since then, and backwards compatability has always been a big value. The developer's life becomes much easier when they can upgrade the compiler without fear of breaking older codebases.

The drawback, however, is that the language today is much more complex than it would be if it didn't need to support backwards compatability. [This talk about a theoretical `cpp2`](https://www.youtube.com/watch?v=ELeZAKCN4tY) helps illustrate what a simpler language could look like.

With many new language features and open-sourced libraries since inception, there are many ways of doing the same thing in the C++ world. This is often seen as a positive, but this idea does not scale well with larger codebases. And if there's many ways of doing the same thing, probably one of those ways is the best for a given use case, right?

What this guide (subjectively) considers "best" is a reasonable balance of performance and simplicity (i.e. code readability / developer sanity). Ideally, we want to employ as few design patterns as possible without compromising performance or functionality, something we can get easily using abstract and composable strategies.

This leads us to our first goal: **Enumerate a minimal list of best practices for generally developing large-scale, performant code in C++**. This includes things like

- sensible idioms
- modular design patterns
- consistent stylistic conventions
- performance considerations
- usage of popular libraries

## Goal 2: Establish **Simple** Developer Workflow

In addition to that, developer workflow should be dead simple, transparent, and easily replicable across different environments. Anyone (even new developers) running a reasonable development setup on any operating system should literally be able to

1. `git clone` the source,
2. install dependencies (ideally through `make install`),
3. and run `make build` or `make test` to build and test the project

without any friction. Once a repository set up like that, developers can feel more confident about making changes and spend more time on business logic rather than build logistics.

## Goal 3: Ensure Solid Customer Service

## Goal 4: Prove the Performance and Security

Because we are using C++ for performance, we should be able to p

## Goal 5: Convince Ourselves this System Works

This guide is super-opinionated on how to develop C++, but it highly values

- long-term, large-scale, multi-person projects
- mastery of latest/modern features
- few, simple, and composable design patterns
- code readability over minor performance gains
- but still minimal performance compromises
- whole project / link-time optimizations
- modular/monorepo codebases with standardized workflows across projects
- minimal external dependencies
- minimal developer configuration
- first-class developer tooling and support
- developer OS priority: Linux > MacOS > Windows

# Overview

Before we dig into the details, let's see what we want to be able to accomplish with the C++ ecosystem and how we can interact with it. Our ultimate goal in any scenario is to build an **application**, which is a broad term we will define as

- set of executable binaries, with special attention to
  - OpenGL
  - Vulkan
- WASM main module and accompanying TypeScript bindings
- CUDA binary
- kernel module
- custom/embedded systems binary

We also want to support **libraries**, which can be generally be

- static (possibly with link time optimization enabled)
- dynamic

We made a special exception above with ~

We generally want each repository (i.e. git) to be a monorepo. Each package of a monorepo should either represent

- a single library that can be installed via a package manager with static and/or dynamic linking options made available to consumers
- one of the other types of target types listed above, which may link to other libraries, either statically or dynamically
- (potentially multiple targets on a custom, case-by-case basis)

Each package should ideally be completely self-contained - this means different packages should be able to use different C++ versions. CMake will manage the "monorepo" features of a project.

## Project Layout

```
project/
  root/
    bin/
    include/
    lib/
    src/
  imports/
  lib/
    foo/
      [build]/
      [coverage]/
      include/
        *.hpp
        *.h
      src/
        *.cpp
        *.c
        *.cu
      test/
        *.cpp
        *.c
      .env
      .env.local
      .clang-format
      .clang-tidy
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
  .gitignore
  CMakeLists.txt
```

## External Dependency Management

## Workflow

When we develop, we should only call commands from the root of our project. Our workflow should generally consist of

| command        | description                                         |
| -------------- | --------------------------------------------------- |
| `make clean`   | clean any build artifacts                           |
| `make install` | install any dependencies or warn of missing ones    |
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

# Target Types

There are two main target types - libraries and "applications". Applications are anything that isn't a library. This section quickly goes over

- the different target types
- what the build process looks like
- how these targets are to be consumed

## Static Libraries

## Dynamic Libraries

## Executables

Each operating system has it's own definition of what it considers an executable.

| OS      | Executable Type |
| ------- | --------------- |
| Linux   | ELF             |
| MacOS   | Mach-O          |
| Windows | PE              |

These applications can interact with TTY, the filesystem, the network, etc.

## WASM

## OpenGL

## Vulkan

## CUDA

## Kernel Modules

## Custom/Embedded Systems

# History of C and C++ Features

Even though we don't care to actually know how to use all the features of C++, it is still helpful to know what features are available and how C++ has grown over the years. This section can also serve as a reference for C++ features.

# Compiler, Linker, Loader, and ELF Files

Time for some theory. This is the problem we want to solve:

- We have some libraries installed. These can be
  - static libraries with link-time optimizations enabled (`.a` files)
  - static libraries without link-time optimizations enabled (also `.a` files)
  - dynamic libraries which are linked at runtime (`.so` files)
- We have a bunch of source files in some directory - we call these the "programs". These are allowed to depend on libraries and can choose to include them statically or dynamically
- We need to be able to compile the "bunch" into a single translation unit, which should be packaged as a library or executable (or equivalent)

Let's dive into some of these details.

## Libraries

Some project might represent a library to be included in other libraries or applications.

# `g++`

Before we get to CMake, let's understand how to use the vanilla `g++` compiler and the different flags that it supports. In this section, we want to be comfortable with

- creating a simple executable
- creating a static library (and linking it)
- creating a shared library (and linking it)
- downloading and linking boost
- running our executable

## Preprocessor

# `Makefile`

# CMake

CMake is not super well-designed, but it is the de facto standard for C++ projects, so learning it is necessary. CMake itself is not a build system - instead, it generates build system files for other build systems, like `make`. But, let's be honest - we are going to use it like a build system.

# Linting and Formatting

# Modern C++

## Hello, World!

## Numbers

## Bit Operations

## String Manipulation

## `struct`s and arrays

## Pointers, References, and more Pointers

## l-values, r-values, and Move Semantics

## Functions and Lambdas

## `class`es (and `struct`s)

`struct`s and `class`es are pretty much the same thing. The only difference is that `struct`s have public members by default, while `class`es have private. Let's stick to using just `class`es.

But, anyways, a `class` can consist of

- data members - things that take up actual storage, which can be primitives or user-defined types
- functions - mutate and query data members and other functions

As a best practice, we want functions to be independent as much as possible, meaning one function of a class should not be composable from other functions.

## Namespaces

## `const` and `constexpr`

## C++ Attributes

## `noexcept` and `static_assert`

## Templates, Constraints, and Concepts

## STL Containers and Algorithms

### Iterators

### Containers

### Algorithms

## IO

### Logging

### Filesystem

### Clock

### Networking

### Random

### Process Management

## Concurency and Parallelism

# libc

# WASM with Emscripten

# CUDA

# Libraries

## Boost

## `openssl`

## SQLite

## `ffmpeg`

## OpenCV

## TensorFlow

## OpenGL

## Vulkan

## SDL

## DPDK

## LAPACK

# Testing

# Debugging

# Profiling

# Documentation

We want these 4 primary ways to include documentation in a C++ project:

- Doxygen
- GitHub Markdown (i.e. via `README`s)
- GitHub Wikis
- `man` pages

# Packaging

# CI/CD

# Resources

- [How to Write Shared Libraries](https://www.cs.dartmouth.edu/~sergey/cs258/ABI/UlrichDrepper-How-To-Write-Shared-Libraries.pdf) - in-depth guide to how Linux deals with executables and shared libraries
- [CMake Reference](https://cmake.org/cmake/help/latest/manual/cmake-commands.7.html) - the official reference
- [Professional CMake](https://crascit.com/professional-cmake/) - practical C++ development tips for large scale projects
- [The Ultimate CMake/C++ Quick Start](https://www.youtube.com/watch?v=YbgH7yat-Jo) - one person's (good) opinion on how to structure a C++ project, based on the above book
- [g++ man page](https://man7.org/linux/man-pages/man1/g++.1.html) - good reference for compiler options
- [Modern C++ Features](https://github.com/AnthonyCalandra/modern-cpp-features) - enumeration of C++ features, categorized by C++ version
- [STL Algorithms](https://www.youtube.com/watch?v=2olsGf6JIkU) - interesting mental model for STL algorithms
- [cpp2](https://www.youtube.com/watch?v=ELeZAKCN4tY) - an experimental language, with the goal of superseding C++
- [Benchmarking C++ Code](https://www.youtube.com/watch?v=zWxSZcpeS8Q) - benchmarking best practices (macro benchmarking)
- [Tuning C++](https://www.youtube.com/watch?v=nXaxk27zwlk) - more benchmarking best practices (micro benchmarking)
