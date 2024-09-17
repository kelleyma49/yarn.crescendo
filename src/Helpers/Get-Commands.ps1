$version = & yarn --version
if (-not $version) {
    throw "Yarn is not installed"
}
if ($version.split('.')[0] -le 1) {
    $commands = & yarn --json --non-interactive run | ConvertFrom-Json
    return $commands.data.items
} else { # Yarn berry and above
    $commands = & yarn run --json | ConvertFrom-Json
    return $commands.name
}
