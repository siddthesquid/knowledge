# Data structures and algorithms

there are plenty of existing resources on data structures and algorithms, but we will relearn them in a different, more practical way - and designed for a functional programming paradigm. FP languages place an emphasis on immutability, but, in reality, mutability is the essence of data structures, so we need to find a good compromise. for example, if w

we will cover the following topics

- **Memory**: what memory access patterns are fundamentally allowed by computers (and not any computer - we only care about classical computers)
- **Iterators**: the ability to think about solutions as mutations and compositions
  of different iterators
- **Item**: a container (with utility functions) for a single datum
- **Collection**: a logical collection of many items

## Memory

The operating system allocates memory to each process it spawns. Let's say we have a web server that has been allocated 1GB of memory. That server will likely logically split that memory up into stack memory and heap memory. Stack memory will generally contain things that are known at compile time: fixed size integers, pointers, chars, booleans, (which are all pretty much fixed size integers). However, dynamically sized data that is unknown at compile time will get generally get allocated on the heap. (The pointer to that heap would have to

## Iterators

An iterator represents a stream of discrete iWe can do three things with iterators:

## Items

An `item` represents one unit of data. If we had an array of `Int`s, each `Int` would be represented by an `item`. However, rather than an `item` storing data, it represents a set of functions that act on data, pr

## Collections
