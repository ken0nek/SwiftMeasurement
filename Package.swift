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

        .library(
            name: "SwiftMeasurementCodable",
            targets: [
                "SwiftMeasurementCodable",
            ]
        ),
    ],

    targets: [
        .target(
            name: "SwiftMeasurement"
        ),

        .target(
            name: "SwiftMeasurementCodable"
        ),

        .testTarget(
            name: "SwiftMeasurementTests",
            dependencies: [
                "SwiftMeasurement",
            ]
        ),

        .testTarget(
            name: "SwiftMeasurementCodableTests",
            dependencies: [
                "SwiftMeasurementCodable",
            ]
        ),
    ],

    swiftLanguageModes: [.v6]
)
