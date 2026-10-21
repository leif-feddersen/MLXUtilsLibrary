// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MLXUtilsLibrary",
    platforms: [
      .iOS(.v18), .macOS(.v15)
    ],
    products: [
        // Automatic linkage prevents a second MLX image beside Kokoro and Misaki.
        .library(
            name: "MLXUtilsLibrary",
            targets: ["MLXUtilsLibrary"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/weichsel/ZIPFoundation.git", .upToNextMajor(from: "0.9.0")),
        .package(url: "https://github.com/leif-feddersen/mlx-swift.git", branch: "dynamic-fix")
    ],
    targets: [
        .target(
            name: "MLXUtilsLibrary",
            dependencies: [
                "ZIPFoundation",
                .product(name: "MLX", package: "mlx-swift")
            ]
        ),
        .testTarget(
            name: "MLXUtilsLibraryTests",
            dependencies: ["MLXUtilsLibrary"],
            resources: [
                .copy("Resources")
            ]
        ),
    ]
)
