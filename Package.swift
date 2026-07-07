// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "selphidComponent",
    defaultLocalization: "es",
    platforms: [.iOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "selphidComponent",
            targets: ["selphidMBSDRComponent", "selphidComponent"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/facephi-clienters/selphidmbsdr-framework-SPM.git", .upToNextMinor(from: "1.39.3")),
        .package(url: "https://github.com/facephi-clienters/SDK-CorePackage-SPM.git", .exactItem("2.9.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "selphidMBSDRComponent",
            dependencies: [
                .product(name: "FPhiSelphIDWidgetiOS", package: "selphidmbsdr-framework-SPM"),
                "SDK-CorePackage-SPM",
                "selphidComponent"
            ],
            resources: [.process("Resources")]),
        .binaryTarget(name: "selphidComponent",
        url: "https://facephicorp.jfrog.io/artifactory/spm-pro-fphi/SDK/FPHISDKSelphIDMBSDRComponent/2.9.0/selphidComponent.zip",
        checksum: "88544e07f919a29d4e923a4e9845d9b33f5f9f434bef6df1b79c00502b30b0a0")
    ]
)
