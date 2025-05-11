// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AiraloUIFoundations",
    platforms: [
        .iOS(.v18)
    ],
    products: [
        .library(
            name: "AiraloUIFoundations",
            targets: ["AiraloUIFoundations"]),
    ],
    targets: [
        .target(
            name: "AiraloUIFoundations",
            resources: [
                .process("Resources")
            ]
        )
    ]
)
