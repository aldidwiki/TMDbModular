// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FavoritePackage",
    platforms: [.macOS(.v10_15), .iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "FavoritePackage",
            targets: ["FavoritePackage"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Realm", url: "https://github.com/realm/realm-swift.git", from: "10.33.0"),
        .package(name: "CorePackage", url: "https://github.com/aldidwiki/Modularization-Core-Package.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "FavoritePackage",
            dependencies: [
                .product(name: "RealmSwift", package: "Realm"),
                .product(name: "CorePackage", package: "CorePackage")
            ]),
        .testTarget(
            name: "FavoritePackageTests",
            dependencies: ["FavoritePackage"]),
    ]
)
