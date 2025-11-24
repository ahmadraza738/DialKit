// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let packageVersion = "1.0.0"

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
            url: "https://github.com/ahmadraza738/DialKit/releases/download/1.0.0/DialKit.xcframework.zip",
            checksum: "4f49ba92c4809595f14acbd9b6d5e8d2209a736823a784135e0890ccabc7f9f5"
        )
    ]
)
