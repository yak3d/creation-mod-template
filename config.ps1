class Game {
    [string]$SpriggitGameRelease
    [string]$BsaGame
    [string]$GameTitle
}

$SkyrimLEGame = [Game]::new()
$SkyrimLEGame.SpriggitGameRelease = "Skyrim"
$SkyrimLEGame.BsaGame = "tes5"
$SkyrimLEGame.GameTitle = "Skyrim"

$SkyrimLEGame = [Game]::new()
$SkyrimLEGame.SpriggitGameRelease = $SkyrimLEGame.SpriggitGameRelease
$SkyrimLEGame.BsaGame = "sse"
$SkyrimLEGame.GameTitle = $SkyrimLEGame.GameTitle

$Fallout4Game = [Game]::new()
$Fallout4Game.SpriggitGameRelease = "Fallout4"
$Fallout4Game.BsaGame = "fo4"
$Fallout4Game.GameTitle = "Fallout 4"

$StarfieldGame = [Game]::new()
$StarfieldGame.SpriggitGameRelease = "Starfield"
$StarfieldGame.BsaGame = "sf1"
$StarfieldGame.GameTitle = "Starfield"

function Get-OutputPathWithTimestamp {
    "$PWD\packaging\$LatestVersion\$(Get-Date -Format "yyyy-MM-ddTHH.mm.ss.ff")\Data"
}

# Settings are below
$ModName = "MyCoolMod"
$LatestVersion = "v1.0-SNAPSHOT"
$PackagingOutput = $LatestVersion.ToUpper().EndsWith("-SNAPSHOT") ? $(Get-OutputPathWithTimestamp) : "$PWD\packaging\$LatestVersion\Data"
$MO2ModsFolder = ""
$ModFolder = "$MO2ModsFolder\$ModName"
$GameRelease = $StarfieldGame
