// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "StateKit",
    platforms: [
        .iOS(.v13),
        .watchOS(.v6),
        .tvOS(.v13),
        .macCatalyst(.v13),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "StateKit",
            targets: ["StateKit"]),
    ],
    targets: [
        .target(
            name: "StateKit",
            dependencies: []),
        .testTarget(
            name: "StateKitTests",
            dependencies: ["StateKit"]),
    ]
)
