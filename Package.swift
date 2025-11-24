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
            checksum: "8a19798ecde3eef8c4bd4dc805325ffc56df44a0eb6d65e549f35fdf8bc12841"
        )
    ]
)
