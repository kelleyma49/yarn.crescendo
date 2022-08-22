@{
    Verb                    = 'Invoke'
    Noun                    = 'YarnWhy'
    OriginalName            = 'yarn'
    OriginalCommandElements = @('')
    Description             = @"
    This command will identify why a package has been installed, detailing which other packages depend upon it, for example, or whether it was explicitly marked as a dependency in the package.json manifest.
"@    
    Parameters              = @(
        @{
            ParameterType                 = 'string'
            OriginalPosition              = 0
            Name                          = "Query"
            OriginalName                  = "why"
            Mandatory                     = $true
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
            Description                   = @"
The mandatory query argument for yarn why can be any of:

a package name (as in the above example)
a package folder; eg: yarn why node_modules/once
a file within a package folder; eg: yarn why node_modules/once/once.js
The file locations can also be absolute.
"@     
        }
    )
}