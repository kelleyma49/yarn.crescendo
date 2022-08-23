param ( $CommandName,
    $ParameterName,
    $WordToComplete,
    $CommandAst,
    $FakeBoundParameters )

. (Join-Path $PSScriptRoot "Find-PackageNameWithoutVersion.ps1")

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
