# yarn.crescendo

[![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/yarn.crescendo)](https://www.powershellgallery.com/packages/yarn.crescendo)
[![PowerShell Gallery Prerelease](https://img.shields.io/powershellgallery/v/yarn.crescendo?include_prereleases)](https://www.powershellgallery.com/packages/yarn.crescendo)
[![PowerShell Gallery Downloads](https://img.shields.io/powershellgallery/dt/yarn.crescendo)](https://www.powershellgallery.com/packages/yarn.crescendo)
[![CI](https://github.com/kelleyma49/yarn.crescendo/actions/workflows/CI.yml/badge.svg)](https://github.com/kelleyma49/yarn.crescendo/actions/workflows/CI.yml)
[![Deploy](https://github.com/kelleyma49/yarn.crescendo/actions/workflows/Deploy.yml/badge.svg)](https://github.com/kelleyma49/yarn.crescendo/actions/workflows/Deploy.yml)
[![MIT licensed](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/kelleyma49/PSFzf/blob/master/LICENSE)

A PowerShell Crescendo module for [yarn](https://classic.yarnpkg.com/en/). Dynamic tab argument completion is supported for the commands `yarn run`, `yarn why`, and `yarn remove`.

## Supported Commands

| PowerShell Command     | Native Equivalent        |
| ---------------------- | ------------------------ |
| `Add-YarnPackages`     | `yarn add <package(s)>`  |
| `Install-YarnPackages` | `yarn install`           |
| `Invoke-YarnRun`       | `yarn run <script cmd>`  |
| `Invoke-YarnWhy`       | `yarn why <package>`     |
| `Remove-YarnPackages`  | `yarn remove <packages>` |
