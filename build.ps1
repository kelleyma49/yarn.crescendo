$Output = Join-Path $PSScriptRoot "output"
$obj = Join-Path $PSScriptRoot "obj"
Remove-Item $Output -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $obj -Recurse -Force -ErrorAction SilentlyContinue

New-Item $Output -ItemType Directory
New-Item (Join-Path $Output "Helpers") -ItemType Directory
New-Item $obj -ItemType Directory

$Commands = Get-ChildItem (Join-Path "$PSScriptRoot" "src/Commands") | ForEach-Object { 
    $Definition = & $_.FullName
    $Command = New-CrescendoCommand -Verb $Definition.Verb -Noun $Definition.Noun -OriginalName $Definition.OriginalName
    $Command.OriginalCommandElements = $Definition.OriginalCommandElements
    $Command.Description = $Definition.Description

    if ($Definition.Parameters) {
        $Command.Parameters = $Definition.Parameters | ForEach-Object {
            $Parameter = New-ParameterInfo -Name $_.Name -OriginalName $_.OriginalName 
            $Parameter.AdditionalParameterAttributes = $_.AdditionalParameterAttributes
            $Parameter.Mandatory = $_.Mandatory
            $Parameter.OriginalName = $_.OriginalName
            $Parameter.OriginalPosition = $_.OriginalPosition
            $Parameter.ParameterType = $_.ParameterType
            $Parameter.Description = $_.Description
            $Parameter
        }
    }

    if ($Definition.OutputHandlers) {
        $Command.OutputHandlers = $Definition.OutputHandlers | ForEach-Object {
            $Handler = New-OutputHandler 
            $Handler.ParameterSetName = $_.ParameterSetName
            $Handler.Handler = $_.Handler
            $Handler.HandlerType = $_.HandlerType
            $Handler.StreamOutput = $_.StreamOutput
            $Handler
        }
    }

    $Command
}

@{
    '$schema' = 'https://aka.ms/PowerShell/Crescendo/Schemas/2021-11'
    Commands  = @($Commands)
} | ConvertTo-Json -Depth 5 | Out-File "$obj\Commands.json"


Export-CrescendoModule -ConfigurationFile (Get-ChildItem "$obj") -ModuleName (Join-Path $Output "yarn.crescendo") -Force -Verbose
Copy-Item (Join-path $PSScriptRoot "src/Helpers/*.ps1") (Join-Path $Output "Helpers") -Recurse -Verbose

$ManifestInfo = @{
    ModuleVersion = "0.0"
    Author        = "Michael Kelley"
    Description   = 'PowerShell Crescendo cmdlet for yarn'
    LicenseUri    = 'https://github.com/kelleyma49/yarn.crescendo/blob/master/LICENSE'
    ProjectUri    = 'https://github.com/kelleyma49/yarn.crescendo'
}

Update-ModuleManifest -Path (Join-Path $Output "yarn.crescendo.psd1") @ManifestInfo -Verbose

# Invoke-Pester -Path "$PSScriptRoot\tests"
