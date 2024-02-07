def _impl(ctx):
  f = ctx.actions.declare_file("{}genproto_header.proto".format(ctx.attr.prefix))
  fp = "true" if ctx.attr.flat_package else "false"
  ctx.actions.write(
    output = f,
    content = """
syntax = "proto3";
import "scalapb/scalapb.proto";
package {};
option (scalapb.options) = {{
  scope: PACKAGE
  flat_package: {}
}};
    """.format(ctx.attr.package, fp)
  )

  return DefaultInfo(files = depset([f]))

genprotopkg = rule(
  attrs = {
    "package": attr.string(mandatory = True),
    "flat_package": attr.bool(mandatory = True),
    "prefix": attr.string(mandatory = False),
  },
  implementation = _impl
)
