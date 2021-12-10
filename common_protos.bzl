load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def common_protos_dependencies():
  commit_sha = "f25c9b22eb2c700b5fc0ff56c7dca3028598af9d"
  http_archive(
      name = "common_protos",
      sha256 = "22087a397beb5d40ff9c93463c61643d05bcabe1dfcbe67511e87f61385e9e54",
      strip_prefix = "ScalaPB-%s" % commit_sha,
      url = "https://github.com/scalapb/ScalaPB/archive/%s.zip" % commit_sha,
      build_file_content = """
proto_library(
    name = "common_protos",
    visibility = ["//visibility:public"],
    srcs = glob(["third_party/**/*.proto"]),
    strip_import_prefix = "third_party"
)
      """
  )
