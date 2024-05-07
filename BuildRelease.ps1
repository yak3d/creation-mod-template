. $PSScriptRoot\config.ps1

$outputPath = $PackagingOutput

.\ConvertYamlToReleaseEsp.ps1 $outputPath
.\PackBSA.ps1 $outputPath