# ExploringSwiftConcurrency

An example of creating a Global Actor which uses a Custom Executor instead of the default one.

This was put together for a presentation and example for a SLC Cocoa Heads meeting April 4, 2023.

A lot of this comes from the swift concurrency roadmap and John McCall's' presentation on concurrency referenced in the slides with this repo. 
Many other things were learned by reading the [swift forums](https://forums.swift.org) where people have asked questions about these topics.  
The last major resource in learning these things was [JavaScriptKit](https://github.com/swiftwasm/JavaScriptKit) from the SwiftWasm team.
The version I used and referenced while learning these things can be found [here](https://github.com/swiftwasm/JavaScriptKit/tree/096584bb6959f16d97daf3ebf52039f98c36fdbf).
In particular the `JavaScriptEventLoop` and its associated `JobQueue` were important in figuring these things out in addition to how to add the lowest level hooks into Swift concurrency runtime.
