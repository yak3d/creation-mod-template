# Creation Engine Modding Template
This template contains the structure to create a mod, pack it up with BSArchive and Spriggit, along with a place for your project files (like Blender, Photoshop PSDs, Audacity AUP3 etc.). It requires the following:

## Prerequisites
- [Mod Organizer 2](https://www.modorganizer.org/)
- [Powershell 7](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.4#msi)
- [Spriggit](https://github.com/Mutagen-Modding/Spriggit)
- [BSArch](https://www.nexusmods.com/newvegas/mods/64745)

## Package Structure
- `workdir` contains the loose files, deserialized ESP from Spriggit and any other files that help build your mod
    - `projects` contains the project files for your mod like Photoshop PSDs, Blender .blend files, etc.
    - `src` contains the deserialized ESP
        - `archive` contains the loose files for the BSA and should mimic the `Data` folder structure
- `packaging` where finished mod releases go, you can choose how to organize this

## Versioning
By default the version starts at `v1.0`. You can use whatever version numbers you want by changing the values in `config.ps1`. If you append `-SNAPSHOT` to the end of the version, the scripts won't overwrite the ESPs/BSAs in the `packaging` directory, but instead create a timestamped folder.

## Usage
### Basics
1. Set `$ModName` in `config.ps1` to the name of your mod
2. Set `$LatestVersion` to the version you want to build, if you're just ideating you can append `-SNAPSHOT` to the version number so that you're not constantly overwriting built ESPs
3. Set `MO2ModsFolder` to `<MO2 Profile Directory>\<Game Name>\mods`. Usually this is in `%LOCALAPPDATA%\ModOrganizer\<Game Name>\mods`
4. Set `GameRelease` to one of the `Game` objects in the config, for example if you're working on a Starfield mod, set it to the `$StarfieldGame` object
5. Run `pwsh .\InitializeTemplate.ps1`

### Converting your `.esp` to source YAML
If you want to convert the `.esp` you've been working on for your mod in xEdit or CreationKit to YAML using Spriggit you must first have the mod in your MO2 `mods` directory. Then, set `$ModName` in `config.ps1` to the name of the mod folder/esp. **The name of the esp and the mod in MO2 must be the same**.

Once the `$modName` is set properly, run the following command in PowerShell 7:

```powershell
pwsh .\ConvertEspToYaml.ps1
```

### Converting your source YAML to a built `.esp` (Release)
This step will convert your source YAML to a built `.esp` file and place it in `packaging\<$LatestVersion>\Data`. This is useful if you want to rebuild the YAML after a peer edited the esp. In order to do so, run the following command in PowerShell 7:

```powershell
pwsh .\ConvertEspToYaml.ps1
```

### Pack BSA (Release)
If you wish to pack your loose files in `src\archive` into a BSA for release run the following command in PowerShell 7:

```powershell
pwsh .\PackBSA.ps1
```

### Build a Full Release
This is used if you want to convert your source YAML into a `.esp` and also pack your loose files into a BSA. This is recommended when finally creating a proper release to upload to Nexus/other mod repos. To build a full release, run the following command in PowerShell 7:

```powershell
pwsh .\BuildRelease.ps1
```