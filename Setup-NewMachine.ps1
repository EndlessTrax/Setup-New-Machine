$ErrorActionPreference = 'Continue'

$WingetPackages = @(
    'Git.Git',
    'Microsoft.WindowsTerminal',
    'Microsoft.PowerShell',
    'Microsoft.VisualStudioCode',
    'JanDeDobbeleer.OhMyPosh',
    'Python.Python.3'
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
        $listApp = winget list --exact -q $Item
        if (![String]::Join("", $listApp).Contains($Item)) {
            winget install $Item -s winget
            Write-Output "Installed: $Item"
            $Count++
        }
        else {
            Write-Output "Already installed: $Item"
        }
    }
    catch {
        Write-Error "Failed to install: $Item"
        $Unsuccessful += $Item
    }
}

Write-Output "Installed $Count packages out of $($WingetPackages.Count)"
