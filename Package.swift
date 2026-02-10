// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "SwiftMeasurement",

    platforms: [
        .macOS(.v14),
        .iOS(.v17),
        .tvOS(.v17),
        .watchOS(.v10),
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
    ],

    swiftLanguageModes: [.v6]
)
