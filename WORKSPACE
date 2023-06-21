workspace(name = "fs2_grpc")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

skylib_version = "1.4.1"

http_archive(
    name = "bazel_skylib",
    sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
    type = "tar.gz",
    url = "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib-{}.tar.gz".format(skylib_version, skylib_version),
)

rules_proto_commit = "97d8af4dc474595af3900dd85cb3a29ad28cc313"
http_archive(
    name = "rules_proto",
    sha256 = "602e7161d9195e50246177e7c55b2f39950a9cf7366f74ed5f22fd45750cd208",
    strip_prefix = "rules_proto-%s" % rules_proto_commit,
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/%s.tar.gz" % rules_proto_commit,
        "https://github.com/bazelbuild/rules_proto/archive/%s.tar.gz" % rules_proto_commit,
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

# commit_sha = "4fdfa82cbaf067939871db4c6a4aca92778d68dc"
# http_archive(
#     name = "scala_things",
#     sha256 = "d3bb1d824e18dbf4af157de25e6142eaf009d59232638a050772281c60a4093c",
#     strip_prefix = "bazel-things-%s" % commit_sha,
#     url = "https://github.com/casehubdk/bazel-things/archive/%s.zip" % commit_sha,
# )
local_repository(
    name = "scala_things",
    path = "../bazel-things"
)

load("@scala_things//:dependencies/init.bzl", "bazel_things_dependencies")

bazel_things_dependencies()

load("//:dependencies.bzl", "project_deps", "scala_versions")
load("@scala_things//:dependencies/dependencies.bzl", "install_dependencies", "to_string_version")

install_dependencies(project_deps, scala_versions, use_pinned=True)
load("@maven//:defs.bzl", "pinned_maven_install")
pinned_maven_install()

# scala
rules_scala_version = "12d60d203591d92572c812f345b45babff688230"  # update this as needed

http_archive(
    name = "io_bazel_rules_scala",
    sha256 = "5144514f81e63a3337e56d86b2924a22a1d5d9f273e482c2f2fb09639f6388fa",
    strip_prefix = "rules_scala-%s" % rules_scala_version,
    type = "zip",
    url = "https://github.com/bazelbuild/rules_scala/archive/%s.zip" % rules_scala_version,
)

load("@io_bazel_rules_scala//:scala_config.bzl", "scala_config")
load("//:dependencies.bzl", "scala_versions")

scala_config(to_string_version(scala_versions))

load("@io_bazel_rules_scala//scala:scala.bzl", "rules_scala_setup", "rules_scala_toolchain_deps_repositories")

rules_scala_setup()

rules_scala_toolchain_deps_repositories(fetch_sources = True)

# load("@io_bazel_rules_scala//scala:toolchains.bzl", "scala_register_toolchains")
# scala_register_toolchains()

# load("@io_bazel_rules_scala//scala:scala.bzl", "scala_repositories")

register_toolchains("@scala_things//toolchain")

# scala_repositories()

register_toolchains("//toolchains:scala_proto_deps_toolchain")

register_toolchains("//toolchains:scala_proto_fs2_grpc_toolchain")
