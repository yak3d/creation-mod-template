. $PSScriptRoot\config.ps1

$outputPath = $null -ne $args[0] ? $args[0] : $PackagingOutput
Spriggit.CLI.exe deserialize --InputPath ".\workdir\src\$ModName.esp" --OutputPath $outputPath\$ModName.esp
