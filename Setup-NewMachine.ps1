$ErrorActionPreference = 'Continue'

$WingetPackages = @(
    'Git.Git',
    'Microsoft.WindowsTerminal',
    'Microsoft.PowerShell',
    'Microsoft.VisualStudioCode',
    'JanDeDobbeleer.OhMyPosh',
    'GoLang.Go',
    'GitHub.cli',
    'Microsoft.dotnet',
    'Docker.DockerDesktop',
    'DBBrowserForSQLite.DBBrowserForSQLite',
    'RARLab.WinRAR',
    'calibre.calibre',
    'GIMP.GIMP',
    'OBSProject.OBSStudio',
    'Twitch.Twitch',
    'Valve.Steam',
    'Microsoft.Office',
    'SlackTechnologies.Slack'
)

$Count = 0

foreach ($Item in $WingetPackages) {
    try {
        winget install $Item -s winget
        Write-Output "Installed: $Item"
        $Count++
    }
    catch {
        Write-Error "Failed to install: $Item"
        $Unsuccessful += $Item
    }
}

Write-Output "Installed $Count packages out of $($WingetPackages.Count)"
