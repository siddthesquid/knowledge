# Overview of Programming Languages and Workflows

Below is a list of programming languages worth knowing. Some important questions to ask are

- What are some resouces (ideally official) for this language?
- What use cases do they handle
- What libraries/frameworks are useful to know
- What are the installation instructions?
- How do we manage multiple versions
- How can projects be developed in isolated environments
- How does package management work
- How can we be efficient with writing code? (e.g. linting, LSP, etc.)
- How do we build, test, run, and deploy/publish projects
- What IDE to use?
- If we want to display code snippets on a website, what is the best way to do that?

It is a lot of information, but it is useful to have it all on one page for easy reference. Some general principles to keep in mind are

- Haskell is superior - use it when possible, but not with teams that don't specialize in Haskell nor if the industry overwhelmingly supports a different tool for a particular use case
- Instructions assume RHEL-based Linux. Avoid macOS (things should still mostly work), and definitely avoid Windows
- It should be easy to manage multiple versions of compilers for any language. When I `cd` to a directory, setup for the environment (like compiler version) should be declarative and out of the way. If it needs to be changed, the configuration should be easy to find and local to the project.
- Try to use neovim for everything. We can also assume development will happen in tmux
- Ideally, packages should download to a central read-only location, but do whatever the canonical package manager suggests
- Ideally, we want to keep a local copy of the compilers so we don't need to mess with sudo permissions (this is more important than the point above)
- We want to try to install from source (i.e. GitHub) so we can try to modify the code and possibly contribute back to the project

## Scala

Scala is a functional programming language that generally compiles to JVM bytecode. The Scala/Java/JVM ecosystem is great for big data related tasks.

### Use Cases

- Big data processing ("big" meaning needing many machines, TBs or PBs of data, etc.)
- ETL (Extract, Transform, Load) - moving data from one place to another, like distributed databases or queues
- Anything that needs to interface with existing JVM ecosystem (aka don't use Java)

### Libraries

Big data

- [Spark](https://spark.apache.org/) - the de facto standard for big data processing. This is really the only library you need to know for Scala.

General Purpose - I mean, Spark is enough, but the below can help for non-spark applications as well (...though, I don't recommend Scala for non-spark applications)

- [Cats](https://typelevel.org/cats/) - functional programming library that can really clean up code and make things like concurrency more manageable. There is a whole ecosystem of tools (the [Typelevel](https://typelevel.org/) ecosystem) that are worth looking into. The library provides standard FP primitives like functors, monads, etc.
- [ZIO](https://zio.dev/) - comparable to Cats, but more of an opinionated (a good opinion) framework than a library. Dependency injection, error handling, concurrency made easy.

### Installation

Scala is generally installed with [sbt](https://www.scala-sbt.org/). The below is a good way to install sbt and Scala.

```
curl -L https://git.io/sbt > sbt
chmod 0755 sbt
./sbt
```

## TypeScript

TypeScript is a fantastic language and probably the most used on this list (well, if you include JavaScript), but comes with a difficult developer experience (but once you have some boilerplate, the DevEx becomes superior, especially with how fast it compiles and type checks). Never use raw JavaScript - TypeScript provides type safety and the IDE will help you write better code. Some of the biggest cons of TypeScript come with the fact that it has to be compiled to JavaScript before it is executed.

## C++/C

The classics. Any distro of Linux is pretty much guaranteed to come with a C compiler. C is incredibly simple, while C++ can be pretty complex.

## Haskell

## Python

Python is an awful language, as can be expected from any dynamically typed language. However, it is very accessible, has a huge user-base, and thus libraries for pretty much anything. Data Science, ML, and IoT related projects really shine here (I would personally avoid IoT projects in Python, though). Python is generally not performant, but some key number crunching libraries are written in C/C++, so performance is not a concern as long as we stick with those.

## Shell scripting

## Rust

I don't know much about Rust, yet, except that it is primarily designed for low-level systems programming. It is pretty popular (especially in the blockchain community) and does fantastic on benchmarks.

### Installing

```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

## Golang

I hate to have to include golang, but it is too popular to ignore. It is generally meant as a low-level, high-performance language akin to C/C++. Never start a language in golang if you can avoid it because the language is limited and there are much better choices out there. That being said, there is a low barrier to entry to learn the language, and the development experience is pretty good.

## Agda

This is moreso a theorem prover / proof checker than a programming language. Put differently, imagine writing a program whose sole purpose is to be compiled, but not executed. You are only interested in whether the program type checks or not. So, don't use this to write a web server, but learning Agda gives you a lot of intution about programming, logic, math, and just philosophy in general. As a language, one of its defining features is being a dependently typed language. This means that the type of a variable can depend on the value of another variable.

## LaTeX

Not a programming language, but it has enough syntax and setup that it was worth listing. LaTeX is a markup language for typesetting documents. Some things, especially math equations, only look good in LaTeX (with a practical amount of effort). Sites like GitHub and StackOverflow support LaTeX, too, so it's not only useful for writing papers.

## Lua

There is only one reason to practically care about Lua: NeoVim. NeoVim is a text editor that is written in Lua. It is a great editor, and it is worth learning Lua to be able to customize it. I'm sure there are other use cases (like lexing?)
