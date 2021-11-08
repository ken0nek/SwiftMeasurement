// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftMeasurement",

    platforms: [
        .macOS(.v10_12),
        .iOS(.v10),
        .watchOS(.v3),
        .tvOS(.v10),
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
