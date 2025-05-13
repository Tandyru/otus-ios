// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FeatureProfileList",
    platforms: [
        .iOS(.v17),
        .macOS(.v10_13),
        .tvOS(.v17),
        .watchOS(.v4),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "FeatureProfileList",
            targets: ["FeatureProfileList"]),
    ],
    dependencies: [
        .package(path: "../CoreProfile"),
        .package(path: "../FeatureChat"),
        .package(path: "../FeatureProfileSetup"),
        .package(path: "../FeatureSettings"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "FeatureProfileList",
            dependencies: ["CoreProfile", "FeatureChat", "FeatureProfileSetup", "FeatureSettings"],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-strict-concurrency=none"])
            ]
        ),
        .testTarget(
            name: "FeatureProfileListTests",
            dependencies: ["FeatureProfileList"]
        ),
    ]
)
