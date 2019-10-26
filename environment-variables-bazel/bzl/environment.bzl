def _impl(repository_ctx):
    """Pulls in <vars> from the environment and creates
    a bazel file at <path> containing the resulting values"""
    path = repository_ctx.attr.path
    
    # Create the build
    repository_ctx.file("BUILD", """
exports_files(
    ["%s"],
    visibility:["//visibility:public"],
)
    """ % path)

    # Create vars.bzl
    var_defs = ["%s = %s" %
                (var, repr(repository_ctx.os.environ.get(var, None)))
                for var in repository_ctx.attr.vars]
    repository_ctx.file(path, "\n".join(var_defs))

environment_repository = repository_rule(
    implementation=_impl,
    local=True,
    configure=True,
    attrs={
        'vars': attr.string_list(mandatory=True),
        'path': attr.string(default="vars.bzl")
    })
