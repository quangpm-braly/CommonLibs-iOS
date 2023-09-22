// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CommonLibs-iOS",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "Common",
            targets: ["Common"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Common",
            dependencies: [],
            path: "Common/Sources"
        ),
    ]
)
