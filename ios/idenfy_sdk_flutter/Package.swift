// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "idenfy_sdk_flutter",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "idenfy-sdk-flutter", targets: ["idenfy_sdk_flutter"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        .package(url: "https://github.com/idenfy/iDenfyLiveness-spm.git", exact: "9.1.1"),
    ],
    targets: [
        .target(
            name: "idenfy_sdk_flutter",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "iDenfyLiveness", package: "iDenfyLiveness-spm"),
            ]
        )
    ]
)
