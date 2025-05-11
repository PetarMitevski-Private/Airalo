// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AiraloUtils",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "AiraloUtils",
            targets: ["AiraloUtils"]),
    ],
    targets: [
        .target(
            name: "AiraloUtils"),
        .testTarget(
            name: "AiraloUtilsTests",
            dependencies: ["AiraloUtils"]
        ),
    ]
)
