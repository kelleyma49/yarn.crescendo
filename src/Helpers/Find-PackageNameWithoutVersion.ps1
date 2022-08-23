
function Find-PackageNameWithoutVersion($name) {
    $idx = $name.LastIndexOf('@')
    if ($idx -gt 0) {
        $name = $name.Substring(0, $idx)
    }
    $name
}