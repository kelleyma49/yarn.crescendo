#Import-Module "$PSScriptRoot\..\yarn-crescendo\yarn.crescendo.psd1" -Force
BeforeAll {
    . "$PSScriptRoot\..\src\Helpers\Find-PackageNameWithoutVersion.ps1"
}

Describe "Find-PackageNameWithoutVersion" {
    It "should return same string with -" {
        Find-PackageNameWithoutVersion "some-package" | Should -Be "some-package"
    }

    It "should return same string with ." {
        Find-PackageNameWithoutVersion "example.com" | Should -Be "example.com"
    }

    It "should return same string with _" {
        Find-PackageNameWithoutVersion "under_score" | Should -Be "under_score"
    }

    It "should return same string starting with numbers" {
        Find-PackageNameWithoutVersion "123numeric" | Should -Be "123numeric"
    }

    It "should return same string starting @" {
        Find-PackageNameWithoutVersion "@npm/thingy" | Should -Be "@npm/thingy"
    }
    
    It "should strip number" {
        Find-PackageNameWithoutVersion "thingy@1.2.3" | Should -Be "thingy"
    }

    It "should strip number with ^" {
        Find-PackageNameWithoutVersion "thingy@^1.2.3" | Should -Be "thingy"
    }

    It "should strip number" {
        Find-PackageNameWithoutVersion "@npm/thingy@1.2.3" | Should -Be "@npm/thingy"
    }
}
