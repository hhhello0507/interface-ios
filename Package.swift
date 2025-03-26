// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Interface",
    platforms: [.iOS(.v15), .macOS(.v12)],
    products: [
        .library(
            name: "Interface",
            targets: ["Interface"]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "Interface",
            resources: [
                .process("Resource/Font"),
                .process("Resource/Assets.xcassets")
            ]
        )
    ]
)
