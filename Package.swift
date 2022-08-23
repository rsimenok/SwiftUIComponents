// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftUIComponents",
    platforms: [
        .iOS(.v14),
        .macOS(.v11),
        .tvOS(.v14),
        .watchOS(.v7),
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftUIComponents",
            targets: ["SwiftUIComponents"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(name: "SwiftUtilities", url: "https://github.com/moyoteg/SwiftUtilities", .branch("master")),
        
        // 3rd party
        .package(name: "DeviceKit", url: "https://github.com/devicekit/DeviceKit.git", .upToNextMajor(from: "4.2.1")),
        .package(name: "SwiftUICharts", url: "https://github.com/AppPear/ChartView", .upToNextMajor(from: "1.5.5")),
        .package(name: "PermissionsKit", url: "https://github.com/moyoteg/PermissionsKit", .branch("main")),
        .package(name: "CloudyLogs", url: "https://github.com/moyoteg/CloudyLogs", .branch("master")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftUIComponents",
            dependencies: [
                .product(name: "SwiftUtilities", package: "SwiftUtilities"),
                // 3rd Party
                .product(name: "DeviceKit", package: "DeviceKit", condition: .when(platforms: [.iOS, .watchOS, .macCatalyst])),
                .product(name: "SwiftUICharts", package: "SwiftUICharts", condition: .when(platforms: [.iOS, .macOS, .watchOS])),
                .product(name: "NotificationPermission", package: "PermissionsKit"),
                .product(name: "BluetoothPermission", package: "PermissionsKit"),
                .product(name: "FaceIDPermission", package: "PermissionsKit"),
                "CloudyLogs",
            ]
        ),
        
            .testTarget(
                name: "SwiftUIComponentsTests",
                dependencies: ["SwiftUIComponents"]
            ),
    ]
)
