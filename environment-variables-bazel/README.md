# Environment Variables in Bazel

Environment variables are hard to load into bazel. Fortunately, repository rules are able to access these variables.

## Creating the `environment_repository` Rule

[environment.bzl](bzl/environment.bzl)

This command initializes a repository with the specified environment variables present. The location of these variables is derived from the path attribute, the names of these variables comes from the vars attribute, and the values are pulled from the environment.

### Expose the rule

[BUILD](BUILD)

This build file exposes the rule to be used by the workspace.

## A Sample Workspace

[WORKSPACE](WORKSPACE)

## A Sample .bashrc

[.bashrc](.bashrc)

You can export environment variables from your `~/.bashrc` file. To load this sample file, run:

    source .bashrc
	
## Updating the environment

When you change the environment variables pulled, or wish to change the values of the environment variables you will have to run

    bazel sync --configure
	
## Run the Demo 

    bazel query //bzl:environment.bzl
	
It will print out a debug message containing:

    the path is my/test/path
