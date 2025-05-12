// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CoreLLM",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_13),
        .tvOS(.v17),
        .watchOS(.v4),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CoreLLM",
            targets: ["CoreLLM"]),
    ],
    dependencies: [
            .package(path: "../CoreKeychain")
        ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CoreLLM",
            dependencies: ["CoreKeychain"]
        ),
        .testTarget(
            name: "CoreLLMTests",
            dependencies: ["CoreLLM"]
        ),
    ]
)
