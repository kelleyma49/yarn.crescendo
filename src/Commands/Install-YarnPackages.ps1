@{
    Verb                    = 'Install'
    Noun                    = 'YarnPackages'
    OriginalName            = 'yarn'
    OriginalCommandElements = @('install')
    Description             = @"
    Install all the dependencies listed within package.json in the local node_modules folder.

    The yarn.lock file is utilized as follows:
    
    If yarn.lock is present and is enough to satisfy all the dependencies listed in package.json, the exact versions recorded in yarn.lock are installed, and yarn.lock will be unchanged. Yarn will not check for newer versions. 
    
    If yarn.lock is absent, or is not enough to satisfy all the dependencies listed in package.json (for example, if you manually add a dependency to package.json), Yarn looks for the newest versions available that satisfy the constraints in package.json. The results are written to yarn.lock.
    
    If you want to ensure yarn.lock is not updated, use -FrozenLockfile.
"@    
    Parameters              = @(
        @{
            ParameterType = 'Switch'
            Name          = "CheckFiles"
            OriginalName  = "--check-files"
            Description   = 'Verifies that already installed files in node_modules did not get removed.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "Flat"
            OriginalName  = "--flat"
            Description   = 'Install all the dependencies, but only allow one version for each package. On the first run this will prompt you to choose a single version for each package that is depended on at multiple version ranges. These will be added to your package.json under a resolutions field.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "Force"
            OriginalName  = "--force"
            Description   = 'This refetches all packages, even ones that were previously installed.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "IgnoreScripts"
            OriginalName  = "--ignore-scripts"
            Description   = 'Do not execute any scripts defined in the project package.json and its dependencies.'
        },
        @{
            ParameterType = 'String'
            Name          = "ModulesFolder"
            OriginalName  = "--modules-folder"
            Description   = 'Specifies an alternate location for the node_modules directory, instead of the default ./node_modules.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "NoLockfile"
            OriginalName  = "--no-lockfile"
            Description   = 'Don''t read or generate a yarn.lock lockfile.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "Production"
            OriginalName  = "--production"
            Description   = 'Yarn will not install any package listed in devDependencies if the NODE_ENV environment variable is set to production. Use this flag to instruct Yarn to ignore NODE_ENV and take its production-or-not status from this flag instead.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "PureLockfile"
            OriginalName  = "--pure-lockfile"
            Description   = 'Don''t generate a yarn.lock lockfile.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "Focus"
            OriginalName  = "--focus"
            Description   = 'Shallowly installs a package''s sibling workspace dependencies underneath its node_modules folder. This allows you to run that workspace without building the other workspaces it depends on.

            Must be run inside an individual workspace in a workspaces project. Can not be run in a non-workspaces project or at the root of a workspaces project.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "FrozenLockfile"
            OriginalName  = "--frozen-lockfile"
            Description   = 'Don''t generate a yarn.lock lockfile and fail if an update is needed.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "Silent"
            OriginalName  = "--silent"
            Description   = 'Run yarn install without printing installation log.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "IgnoreEngines"
            OriginalName  = "--ignore-engines"
            Description   = 'Ignore engines check.'
        },
        @{
            ParameterType = 'Switch'
            Name          = "IgnoreOptional"
            OriginalName  = "--ignore-optional"
            Description   = 'Don''t install optional dependencies.'
        }, 
        @{
            ParameterType = 'Switch'
            Name          = "Offline"
            OriginalName  = "--offline"
            Description   = 'Run yarn install in offline mode.'
        }, 
        @{
            ParameterType = 'Switch'
            Name          = "NonInteractive"
            OriginalName  = "--non-interactive"
            Description   = 'Disable interactive prompts, like when there''s an invalid version of a dependency.'
        }, 
        @{
            ParameterType = 'Switch'
            Name          = "UpdateChecksums"
            OriginalName  = "--update-checksums"
            Description   = 'Update checksums in the yarn.lock lockfile if there''s a mismatch between them and their package''s checksum.'
        }, 
        @{
            ParameterType = 'Switch'
            Name          = "Audit"
            OriginalName  = "--audit"
            Description   = 'Checks for known security issues with the installed packages. A count of found issues will be added to the output. Use the yarn audit command for additional details. Unlike npm, which automatically runs an audit on every install, yarn will only do so when requested. (This may change in a later update as the feature is proven to be stable.)'
        }, 
        @{
            ParameterType = 'Switch'
            Name          = "NoBinLinks"
            OriginalName  = "--no-bin-links"
            Description   = 'Prevent yarn from creating symlinks for any binaries the package might contain.'
        }, 
        @{
            ParameterType = 'Switch'
            Name          = "LinkDuplicates"
            OriginalName  = "--link-duplicates"
            Description   = 'Create hardlinks to the repeated modules in node_modules.'
        }
    )
}