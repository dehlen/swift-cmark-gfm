// swift-tools-version:5.1

import PackageDescription

// Library version to be updated according to test/spec.txt
let (major, minor, patch, build) = (0, 29, 0, 0)

let package = Package(
    name: "cmark-gfm",
    products: [
        .library(name: "cmark-gfm", targets: ["cmark-gfm"]),
    ],
    targets: [
        .target(name: "cmark-gfm",
                cSettings: [
                    .headerSearchPath("./private_include"),
                    .define("CMARK_GFM_VERSION_MAJOR", to: "\(major)"),
                    .define("CMARK_GFM_VERSION_MINOR", to: "\(minor)"),
                    .define("CMARK_GFM_VERSION_PATCH", to: "\(patch)"),
                    .define("CMARK_GFM_VERSION_BUILD", to: "\(build)"),
                ]
        ),
        .testTarget(
            name: "cmarkTest",
            dependencies: ["cmark-gfm"]),
    ]
)
