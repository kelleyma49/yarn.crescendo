@{
    Verb                    = 'Add'
    Noun                    = 'YarnPackages'
    OriginalName            = 'yarn'
    OriginalCommandElements = @('')
    Description             = @"
    In general, a package is simply a folder with code and a package.json file that describes the contents. When you want to use another package, you first need to add it to your dependencies. This means running yarn add [package-name] to install it into your project.

    This will also update your package.json and your yarn.lock so that other developers working on the project will get the same dependencies as you when they run yarn or yarn install.
    
    Most packages will be installed from the npm registry and referred to by simply their package name. For example, yarn add react will install the react package from the npm registry.
    
    You can specify versions using one of these:
    
    Add-YarnPackages package-name installs the “latest” version of the package.
    Add-YarnPackages package-name@1.2.3 installs a specific version of a package from the registry.
    Add-YarnPackages package-name@tag installs a specific “tag” (e.g. beta, next, or latest).
    You can also specify packages from different locations:
    
    Add-YarnPackages package-name installs the package from the npm registry unless you have specified another one in your package.json.
    Add-YarnPackages file:/path/to/local/folder installs a package that is on your local file system. This is useful to test out other packages of yours that haven’t been published to the registry.
    Add-YarnPackages file:/path/to/local/tarball.tgz installs a package from a gzipped tarball which could be used to share a package before publishing it.
    Add-YarnPackages link:/path/to/local/folder installs a symlink to a package that is on your local file system. This is useful to develop related packages in monorepo environments.
    Add-YarnPackages <git remote url> installs a package from a remote git repository.
    Add-YarnPackages <git remote url>#<branch/commit/tag> installs a package from a remote git repository at specific git branch, git commit or git tag.
    Add-YarnPackages https://my-project.org/package.tgz installs a package from a remote gzipped tarball.
"@    
    Parameters              = @(
        @{
            ParameterType    = 'String[]'
            OriginalPosition = 0
            Name             = "Packages"
            OriginalName     = "add"
            Mandatory        = $true
            Description      = "This will install one or more packages in your dependencies."
        },
        @{
            ParameterType = 'Switch'
            Name          = "Dev"
            OriginalName  = "--dev"
            Description   = "Using -Dev will install one or more packages in your devDependencies."
        },
        @{
            ParameterType = 'Switch'
            Name          = "Peer"
            OriginalName  = "--peer"
            Description   = "Using -Peer will install one or more packages in your peerDependencies."
        },
        @{
            ParameterType = 'Switch'
            Name          = "Optional"
            OriginalName  = "--optional"
            Description   = "Using -Optional will install one or more packages in your optionalDependencies."
        },
        @{
            ParameterType = 'Switch'
            Name          = "Exact"
            OriginalName  = "--exact"
            Description   = @"
            Using -Exact installs the packages as exact versions. The default is to use the most recent release with the same major version. For example, yarn add foo@1.2.3 would accept version 1.9.1, but yarn add foo@1.2.3 -Exact would only accept version 1.2.3.
"@
        },
        @{
            ParameterType = 'Switch'
            Name          = "Tilde"
            OriginalName  = "--tilde"
            Description   = @"
            Using -Tilde installs the most recent release of the packages that have the same minor version. The default is to use the most recent release with the same major version. For example, yarn add foo@1.2.3 -Tidle would accept 1.2.9 but not 1.3.0.
"@
        },
        @{
            ParameterType = 'Switch'
            Name          = "IgnoreWorkspaceRootCheck"
            OriginalName  = "--ignore-workspace-root-check"
            Description   = @"
            Using -IgnoreWorkspaceRootCheck allows a package to be installed at the workspaces root. This tends not to be desired behaviour, as dependencies are generally expected to be part of a workspace. For example yarn add lerna -IgnoreWorkspaceRootCheck -Dev at the workspaces root would allow lerna to be used within the scripts of the root package.json.
"@
        },
        @{
            ParameterType = 'Switch'
            Name          = "Audit"
            OriginalName  = "--audit"
            Description   = "Checks for known security issues with the installed packages. A count of found issues will be added to the output. Use the yarn audit command for additional details."
        }
    )
}