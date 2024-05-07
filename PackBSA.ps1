. $PSScriptRoot\config.ps1

$outputPath = $null -ne $args[0] ? $args[0] : $PackagingOutput
$bsaCommand = "BSArch.exe pack .\workdir\src\archive\ ""$outputPath\$ModName.ba2"" -$($GameRelease.BsaGame)"
Invoke-Expression $bsaCommand
# If you want to make multiple archives, you can add more lines here
