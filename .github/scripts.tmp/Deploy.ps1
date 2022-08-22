$ErrorActionPreference = "Stop"
Write-Host "Triggered from ${env:GITHUB_REF}"
    
$psdir = $env:GITHUB_WORKSPACE
$installdir = Join-Path $psdir 'output'

# generate documentation:
#$docdir = Join-Path $installdir 'en-US'
#new-item $docdir -ItemType Directory
#Import-Module platyPS
#platyPS\New-ExternalHelp (Join-Path $psdir 'docs') -Force -OutputPath $docdir
#copy-item $(Join-Path $psdir 'en-US' '*.txt') $docdir -verbose

$psdFilePath = Join-Path $installdir 'yarn.crescendo.psd1'

$version = $env:GITHUB_REF
if ($version -eq '' -or $null -eq $version) {
    throw 'Version not found in $GITHUB_REF'
}
$version = $version.Split('/')[-1].Replace('v', '')
Update-ModuleManifest $psdFilePath -ModuleVersion $version

$isPrerelease = "${env:GITHUB_PRERELEASE}" -eq 'true'
if ($isPrerelease) {
    $prereleasePostfix = 'alpha'
    Update-ModuleManifest $psdFilePath -Prerelease $prereleasePostfix
    write-host ("publishing prerelease version {0}-{1}" -f $version, $prereleasePostfix)  
}
else {
    write-host ("publishing version {0}" -f $version)
}

#Publish-Module -NugetApiKey $env:POWERSHELLGALLERY_APIKEY -Path $installdir -Verbose

