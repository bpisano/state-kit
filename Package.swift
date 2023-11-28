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
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.2"),
    ],
    targets: [
        .macro(
            name: "StateKitMacros",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .target(
            name: "StateKit",
            dependencies: ["StateKitMacros"]),
        .testTarget(
            name: "StateKitTests",
            dependencies: [
                "StateKit",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]),
    ]
)
