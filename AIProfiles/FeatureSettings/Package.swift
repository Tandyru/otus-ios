// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureSettings",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_13),
        .tvOS(.v17),
        .watchOS(.v4),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FeatureSettings",
            targets: ["FeatureSettings"]),
    ],
    dependencies: [
        .package(path: "../CoreLLM"),
        .package(path: "../CoreUtils")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FeatureSettings",
            dependencies: ["CoreLLM", "CoreUtils"]
        ),
        .testTarget(
            name: "FeatureSettingsTests",
            dependencies: ["FeatureSettings"]
        ),
    ]
)
