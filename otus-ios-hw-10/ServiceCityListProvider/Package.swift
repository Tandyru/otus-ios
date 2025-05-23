// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ServiceCityListProvider",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "ServiceCityListProvider",
            targets: ["ServiceCityListProvider"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Tandyru/CoreGeoInfoProvider.git", from: "0.1.0"),
        .package(url: "https://github.com/realm/realm-swift.git", from: "10.54.3")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "ServiceCityListProvider",
            dependencies: [
                "CoreGeoInfoProvider",
                .product(name: "RealmSwift", package: "realm-swift")
            ],
            path: "Sources/ServiceCityListProvider"
        ),

    ]
)
