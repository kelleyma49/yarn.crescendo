@{
    Verb                    = 'Remove'
    Noun                    = 'YarnPackages'
    OriginalName            = 'yarn'
    OriginalCommandElements = @('')
    Description             = @"
    Running yarn remove foo will remove the package named foo from your direct dependencies updating your package.json and yarn.lock files in the process.

    Other developers working on the project can run yarn install to sync their own node_modules directories with the updated set of dependencies.
    
    When you remove a package, it is removed from all types of dependencies: dependencies, devDependencies, etc.
"@    
    Parameters              = @(
        @{
            ParameterType                 = 'String[]'
            OriginalPosition              = 0
            Name                          = "Packages"
            OriginalName                  = "remove"
            Mandatory                     = $true
            Description                   = "The packages to remove."
            AdditionalParameterAttributes = @(@"
            [ArgumentCompleter( {
               param ( `$CommandName,
                   `$ParameterName,
                   `$WordToComplete,
                   `$CommandAst,
                   `$FakeBoundParameters )
               # Write your code here
               return & `$(Join-Path `$PSScriptRoot 'Helpers/Get-Packages.ps1') -WordToComplete `$WordToComplete
           })]
"@)
        }
    )
}