// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageVersion = "1.0.1"

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
            url: "https://github.com/ahmadraza738/DialKit/releases/download/1.0.1/DialKit.xcframework.zip",
            checksum: "a91a1763db217e873f77995b2f757c20edd52d9b49e6d2174a3bf77daad457a3"
        )
    ]
)
