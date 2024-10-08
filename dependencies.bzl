load("@scala_things//:dependencies/dependencies.bzl", "java_dependency", "scala_dependency", "scala_fullver_dependency", "make_scala_versions", "apply_scala_version", "apply_scala_fullver_version")
load("@rules_jvm_external//:defs.bzl", "maven_install")

scala_versions = make_scala_versions(
    "2",
    "13",
    "14",
)

grpc_version = "1.62.2"

project_deps = [
    scala_fullver_dependency("org.typelevel", "kind-projector", "0.13.2"),
    # base
    java_dependency("org.scala-lang", "scala-compiler", "2.13.11"),
    java_dependency("org.scala-lang", "scala-library", "2.13.11"),
    java_dependency("org.scala-lang", "scala-reflect", "2.13.11"),

    # gen
    scala_dependency("com.thesamet.scalapb", "compilerplugin", "0.11.17"),
    scala_dependency("com.thesamet.scalapb", "scalapb-runtime", "0.11.17"),
    scala_dependency("com.thesamet.scalapb", "scalapb-runtime-grpc", "0.11.17"),
    scala_dependency("com.thesamet.scalapb", "protoc-gen", "0.9.6"),
    java_dependency("io.grpc", "grpc-stub", grpc_version),
    java_dependency("io.grpc", "grpc-protobuf", grpc_version),
    java_dependency("io.grpc", "grpc-netty", grpc_version),
    java_dependency("io.grpc", "grpc-netty-shaded", grpc_version),
    java_dependency("io.grpc", "grpc-services", grpc_version),
    java_dependency("io.grpc", "protoc-gen-grpc-java", grpc_version),

    # usage
    java_dependency("io.grpc", "grpc-netty-shaded", grpc_version),
    scala_dependency("org.typelevel", "fs2-grpc-runtime", "2.7.4"),

    scala_dependency("com.thesamet.scalapb", "scalapb-validate-core" , "0.3.4"),
    scala_dependency("com.thesamet.scalapb", "scalapb-validate-codegen" , "0.3.4"),
    scala_dependency("com.thesamet.scalapb.common-protos", "proto-google-common-protos-scalapb_0.11", "2.9.6-0"),
    java_dependency("io.envoyproxy.protoc-gen-validate", "protoc-gen-validate", "0.6.13")
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
