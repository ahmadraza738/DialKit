// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageVersion = "1.0.4"

let package = Package(
    name: "DialKit",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "DialKit",
            targets: ["DialKit"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "DialKit",
            url: "https://github.com/ahmadraza738/DialKit/releases/download/1.0.4/DialKit.xcframework.zip",
            checksum: "7a0a63878d0b05f36715f352ba5f68cb0bbc3d7d2e2c322f50e7c24dd230f8f8"
        )
    ]
)
