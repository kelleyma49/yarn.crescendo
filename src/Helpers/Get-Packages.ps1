param ( $CommandName,
    $ParameterName,
    $WordToComplete,
    $CommandAst,
    $FakeBoundParameters )

if ([string]::IsNullOrEmpty($WordToComplete)) {
    $json = & yarn list --json | ConvertFrom-Json
}
else {
    $json = & yarn list --pattern $WordToComplete --json | ConvertFrom-Json
}
$names = $json.data.trees | ForEach-Object { 
    $nameWithoutVersion = $_.name.Split('@')[0] 
    $nameWithoutVersion
}
return $names 