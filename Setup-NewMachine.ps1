$ErrorActionPreference = 'Continue'

$WingetPackages = @(
    'Git.Git',
    'Microsoft.WindowsTerminal',
    'Microsoft.PowerShell'
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

for ($item -in $WingetPackages) {
    Write-Output "Installing $item..."
    try {
        winget install $item -s winget
        $Count++
    }
    catch {
        Write-Error "Failed to install $item"
        $Unsuccessful += $item
    }
}

Write-Output "Installed $Count packages"
