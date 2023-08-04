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

proto_library(
    name = "scalapb_protos",
    visibility = ["//visibility:public"],
    srcs = ["protobuf/scalapb/scalapb.proto"],
    strip_import_prefix = "protobuf",
    deps = [":common_protos"]
)
      """
  )

#   validate_sha = "04e84b10ceef0008673460bcf06f036b2add8d80"
#   http_archive(
#       name = "validate_protos",
#       # sha256 = "22087a397beb5d40ff9c93463c61643d05bcabe1dfcbe67511e87f61385e9e54",
#       strip_prefix = "protoc-gen-validate-%s" % validate_sha,
#       url = "https://github.com/bufbuild/protoc-gen-validate/archive/%s.zip" % validate_sha,
#       workspace_file_content = "",
#       build_file_content = """
# proto_library(
#     name = "validate_protos",
#     visibility = ["//visibility:public"],
#     deps = [
#       "@common_protos//:scalapb_protos",
#       "@common_protos//:common_protos"
#     ],
#     srcs = glob(["validate/*.proto"]
# )
#       """
#   )

  validate_scalapb_sha = "5d5e886f6ede389fc35b9a676728be39e2c391d8"
  http_archive(
      name = "validate_scalapb_protos",
      # sha256 = "22087a397beb5d40ff9c93463c61643d05bcabe1dfcbe67511e87f61385e9e54",
      strip_prefix = "scalapb-validate-%s" % validate_scalapb_sha,
      url = "https://github.com/scalapb/scalapb-validate/archive/%s.zip" % validate_scalapb_sha,
      build_file_content = """
proto_library(
    name = "validate_scalapb_protos",
    visibility = ["//visibility:public"],
    deps = [
      "@common_protos//:scalapb_protos",
      "@fs2_grpc//validate"
    ],
    srcs = glob(["core/src/main/protobuf/scalapb/*.proto"]),
    strip_import_prefix = "core/src/main/protobuf/scalapb"
)
      """
  )

  google_api_common_protos_sha = "3332dec527759859840a3a2ff108c67a54708130"
  http_archive(
      name = "google_api_common_protos",
      # sha256 = "22087a397beb5d40ff9c93463c61643d05bcabe1dfcbe67511e87f61385e9e54",
      strip_prefix = "api-common-protos-%s" % google_api_common_protos_sha,
      url = "https://github.com/googleapis/api-common-protos/archive/%s.zip" % google_api_common_protos_sha
  )
