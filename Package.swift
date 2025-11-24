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
            checksum: "ccd53941ac4d167cb5c02c15d3a029ef7bb49224d04e1c63b017fe8ce1558064"
        )
    ]
)
