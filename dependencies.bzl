load("@scala_things//:dependencies/dependencies.bzl", "java_dependency", "scala_dependency", "scala_fullver_dependency", "make_scala_versions", "apply_scala_version", "apply_scala_fullver_version")
load("@rules_jvm_external//:defs.bzl", "maven_install")

scala_versions = make_scala_versions(
    "2",
    "13",
    "6",
)

grpc_version = "1.42.1"

project_deps = [
    # gen
    scala_dependency("com.thesamet.scalapb", "compilerplugin", "0.11.6"),
    scala_dependency("com.thesamet.scalapb", "protoc-gen", "0.9.3"),
    java_dependency("io.grpc", "grpc-stub", grpc_version),
    java_dependency("io.grpc", "grpc-protobuf", grpc_version),
    java_dependency("io.grpc", "grpc-netty", grpc_version),
    java_dependency("io.grpc", "grpc-netty-shaded", grpc_version),
    java_dependency("io.grpc", "grpc-services", grpc_version),
    java_dependency("io.grpc", "protoc-gen-grpc-java", grpc_version),
    scala_dependency("com.thesamet.scalapb", "scalapb-runtime", "0.11.6"),
    scala_dependency("com.thesamet.scalapb", "scalapb-runtime-grpc", "0.11.6"),

    # usage
    scala_dependency("org.typelevel", "cats-effect", "3.2.9"),
    java_dependency("io.grpc", "grpc-netty-shaded", grpc_version),
    scala_dependency("co.fs2", "fs2-core", "3.1.2"),
    scala_dependency("org.typelevel", "fs2-grpc-runtime", "2.3.0"),
]

def add_scala_fullver(s):
    return apply_scala_fullver_version(scala_versions, s)

proto_lib_deps = [
  "@maven//:org_typelevel_cats_core_2_13",
  "@maven//:org_typelevel_cats_effect_2_13",
  "@maven//:org_typelevel_cats_effect_kernel_2_13",
  "@maven//:org_typelevel_cats_effect_std_2_13",
  "@maven//:org_typelevel_cats_kernel_2_13",

  "@maven//:co_fs2_fs2_core_2_13",
]
