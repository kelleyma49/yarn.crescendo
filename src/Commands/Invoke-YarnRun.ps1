@{
    Verb                    = 'Invoke'
    Noun                    = 'YarnRun'
    OriginalName            = 'yarn'
    OriginalCommandElements = @('run')
    Parameters              = @(
        @{
            ParameterType                 = 'String'
            OriginalPosition              = 0
            Name                          = "Command"
            Mandatory                     = $true
            AdditionalParameterAttributes = @(@"
             [ArgumentCompleter( {
                param ( `$CommandName,
                    `$ParameterName,
                    `$WordToComplete,
                    `$CommandAst,
                    `$FakeBoundParameters )
                # Write your code here
                return & `$(Join-Path `$PSScriptRoot 'Helpers/Get-Commands.ps1')
            })]
"@)
        }
    )
}