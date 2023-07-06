# TypeScript (and, I guess, JavaScript)

TypeScript is a superset of JavaScript, so we'll look at both together. In fact, this document will use "TS" to refer to both TypeScript and JavaScript simultaneously. The use cases we will explore that TS particularly excels at are

- web development (both frontend and backend)
- developer tooling (because NPM is convenient)

That being said, TypeScript itself (not JavaScript) is good for any general purpose development, especially because its type system is very minimal, composable, and safe.

The development ecosystem might require many steps to initially set up, but, once we have some boilerplate, developer experience can be smooth. IDEs especially do a good job with providing instant feedback as you write code, and a good portion of linting and formatting can be automated.

Obviously, we should care about performance when possible. However, TypeScript is not the language you turn to for high performance applications. While this document will explain why that is, we will not (and should not).

# Development Environment

## pnpm

pnpm is a package manager for TS applications. npm is the vanilla package manager (we must even install pnpm through npm), but pnpm has a big advantage when it comes to monorepos. It uses a single `node_modules` directory for all packages, so we don't have to worry about duplicate dependencies. For instance, the following example directory layout shows how `node_modules` packages might be symlinked in a monorepo

```
.
├── package.json
├── node_modules/
│   ├── dependency-a
└── packages/
    ├── package-a/
    │   ├── package.json
    │   └── node_modules/
    │       ├── package-b -> ../../package-b
    │       └── dependency-a -> ../../../node_modules/dependency-a
    └── package-b
        ├── package.json
        └── node_modules
            └── dependency-a -> ../../../node_modules/dependency-a
```

The above may not paint the full picture of pnpm, but the point is those symlinks (as opposed to duplicate dependencies). We can also see that packages in our mono repo can depend on each other without having to publish to a registry (but this feature is common with package managers like pnpm, npm, and yarn).

## Nx

# TypeScript

## Primitives

## Strings

## Promises

## Options

## Iterators

## Streams

## Events
