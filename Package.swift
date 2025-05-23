// swift-tools-version: 6.0

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "StateKit",
    platforms: [
        .iOS(.v17),
        .watchOS(.v10),
        .tvOS(.v17),
        .macCatalyst(.v17),
        .macOS(.v14)
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
