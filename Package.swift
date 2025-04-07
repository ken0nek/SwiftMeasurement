// swift-tools-version:5.10

import PackageDescription

let package = Package(
    name: "SwiftMeasurement",

    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .watchOS(.v10),
        .tvOS(.v17),
        .visionOS(.v1)
    ],

    products: [
        .library(
            name: "SwiftMeasurement",
            targets: [
                "SwiftMeasurement",
            ]
        ),
    ],

    targets: [
        .target(
            name: "SwiftMeasurement"
        ),

        .testTarget(
            name: "SwiftMeasurementTests",
            dependencies: [
                "SwiftMeasurement",
            ]
        ),
    ]
)
