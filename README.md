# SwiftUIComponents

A collection of SwiftUI components.

A precise, type-safe representation of monetary amounts in a given currency.

This functionality is discussed in Chapter 3 of
[Flight School Guide to Swift Numbers](https://flight.school/books/numbers).

## Requirements

- Swift 5.0+

## Installation

### Swift Package Manager

Add the SwiftUIComponents package to your target dependencies in `Package.swift`:

```swift
import PackageDescription

let package = Package(
  name: "YourProject",
  dependencies: [
        .package(name: "Models", url: "https://github.com/moyoteg/SwiftUIComponents", .branch("master")),
  ]
)
```
