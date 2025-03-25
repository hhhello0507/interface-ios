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
        .package(url: "https://github.com/kean/Nuke.git", exact: "12.3.0")
    ],
    targets: [
        .target(
            name: "Interface",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
                .product(name: "NukeUI", package: "Nuke")
            ],
            resources: [
                .process("Resource/Font"),
                .process("Resource/Assets.xcassets")
            ]
        )
    ]
)
