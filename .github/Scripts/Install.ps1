$modules = 'Pester', `
    'platyPS', `
    'PSScriptAnalyzer', `
    'Microsoft.PowerShell.Crescendo'
$modules | ForEach-Object {
    $module = $_
    Install-Module -Name $module -Scope CurrentUser -Force -Verbose -ErrorAction SilentlyContinue
    Import-Module -Name $module -Verbose
}