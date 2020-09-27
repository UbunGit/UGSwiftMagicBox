
import PackageDescription

let package = Package(name: "UGSwiftMagicbox",
                      platforms: [.macOS(.v10_12),
                                  .iOS(.v10),
                                  .tvOS(.v10),
                                  .watchOS(.v3)],
                      products: [.library(name: "UGSwiftMagicbox",
                                          targets: ["UGSwiftMagicbox"])],
                      targets: [.target(name: "UGSwiftMagicbox",
                                        path: "Source"],
                                        swiftLanguageVersions: [.v5])
