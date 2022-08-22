$commands = & yarn --json --non-interactive run | ConvertFrom-Json
return $commands.data.items
