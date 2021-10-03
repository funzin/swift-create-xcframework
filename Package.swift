// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-create-xcframework",

    // TODO: Add Linux / Windows support
    platforms: [
        .macOS(.v10_15),
    ],

    products: [
        .executable(name: "swift-create-xcframework", targets: [ "CreateXCFramework" ]),
    ],

    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", .exact("1.0.1")),
        .package(name: "SwiftPM", url: "https://github.com/apple/swift-package-manager.git", .exact("0.6.0")),
        .package(url: "https://github.com/apple/swift-tools-support-core.git", .exact("0.1.0")),
    ],

    targets: [
        .target(name: "CreateXCFramework", dependencies: [
            .product(name: "ArgumentParser", package: "swift-argument-parser"),
            .product(name: "SwiftPM-auto", package: "SwiftPM"),
            .product(name: "SwiftToolsSupport-auto", package: "swift-tools-support-core"),
        ]),
        .testTarget(name: "CreateXCFrameworkTests", dependencies: [ "CreateXCFramework" ]),
    ],

    swiftLanguageVersions: [
        .v5
    ]
)
