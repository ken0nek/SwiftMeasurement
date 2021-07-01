// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftMeasurement",

    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
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
