// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ExploringSwiftConcurrency",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "ExploringSwiftConcurrency",
            targets: ["ExploringSwiftConcurrency"]),
    ],
    dependencies: [
    ],
    targets: [
        .executableTarget(
            name: "ExploringSwiftConcurrency",
            dependencies: [
            ]
        ),
    ]
)
