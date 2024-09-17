param ( $CommandName,
    $ParameterName,
    $WordToComplete,
    $CommandAst,
    $FakeBoundParameters )

. (Join-Path $PSScriptRoot "Find-PackageNameWithoutVersion.ps1")

$version = & yarn --version
if (-not $version) {
    throw "Yarn is not installed"
}
if ($version.split('.')[0] -le 1) {
    if ([string]::IsNullOrEmpty($WordToComplete)) {
        $json = & yarn list --json | ConvertFrom-Json
    }
    else {
        $json = & yarn list --pattern $WordToComplete --json | ConvertFrom-Json
    }
    $names = $json.data.trees | ForEach-Object { 
        Find-PackageNameWithoutVersion $_.name
    }
    return $names 
} else {
    $json = & yarn info --name-only --json --recursive | ConvertFrom-Json
    $names = $json | ForEach-Object { 
        Find-PackageNameWithoutVersion $_.Trim('"')
    } | Select-Object -Unique
    return $names 
}