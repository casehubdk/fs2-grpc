load("@scala_things//:dependencies/dependencies.bzl", "java_dependency", "scala_dependency", "scala_fullver_dependency", "make_scala_versions", "apply_scala_version", "apply_scala_fullver_version")
load("@rules_jvm_external//:defs.bzl", "maven_install")

scala_versions = make_scala_versions(
    "2",
    "13",
    "6",
)

grpc_version = "1.42.1"

project_deps = [
    scala_dependency("com.thesamet.scalapb", "compilerplugin", "0.11.6"),
    scala_dependency("com.thesamet.scalapb", "protoc-gen", "0.9.3"),
    java_dependency("io.grpc", "grpc-stub", grpc_version),
    java_dependency("io.grpc", "grpc-protobuf", grpc_version),
    java_dependency("io.grpc", "grpc-netty", grpc_version),
    java_dependency("io.grpc", "grpc-services", grpc_version),
    java_dependency("io.grpc", "protoc-gen-grpc-java", grpc_version),
    scala_dependency("com.thesamet.scalapb", "scalapb-runtime", "0.11.6"),
    scala_dependency("com.thesamet.scalapb", "scalapb-runtime-grpc", "0.11.6"),
]

def add_scala_fullver(s):
    return apply_scala_fullver_version(scala_versions, s)
