# Define list of software to install
$softwareList = @(
    @{ Name = "Git"; UseWinget = $true; WingetId = "Git.Git"; Arguments = "--silent" },
    @{ Name = "Google Chrome"; UseWinget = $true; WingetId = "Google.Chrome"; Arguments = "--silent" },
    @{ Name = "Firefox Developer Edition"; UseWinget = $true; WingetId = "Mozilla.Firefox.DeveloperEdition"; Arguments = "--silent" },
    @{ Name = "Node.js"; UseWinget = $true; WingetId = "OpenJS.NodeJS.LTS"; Arguments = "--silent" },
    @{ Name = "Python"; UseWinget = $true; WingetId = "Python.Python.3.10"; Arguments = "--silent" },
    @{ Name = "GPG"; UseWinget = $true; WingetId = "GnuPG.Gpg4win"; Arguments = "--silent" },
    @{ Name = "Anaconda"; UseWinget = $true; WingetId = "Anaconda.Anaconda3"; Arguments = "--silent" },
    @{ Name = "JetBrains Toolbox"; UseWinget = $true; WingetId = "JetBrains.Toolbox"; Arguments = "--silent" },
    @{ Name = "Vivaldi"; UseWinget = $true; WingetId = "VivaldiTechnologies.Vivaldi"; Arguments = "--silent" }
)

# Function to check if software is installed
function Is-SoftwareInstalled
{
    param (
        [string]$softwareName
    )

    $installedSoftware = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |
            Where-Object { $_.DisplayName -like "*$softwareName*" }

    return $installedSoftware -ne $null
}

# Iterate through each software and install if not installed
foreach ($software in $softwareList)
{
    $name = $software.Name

    if (-not (Is-SoftwareInstalled -softwareName $name))
    {
        if ($software.ContainsKey("UseWinget") -and $software.UseWinget)
        {
            $wingetId = $software.WingetId
            $arguments = $software.Arguments
            Write-Host "Installing $name using winget..."
            Start-Process -FilePath "winget" -ArgumentList "install $wingetId $arguments" -Wait
            Write-Host "$name installed successfully."
        }
        elseif ($software.ContainsKey("InstallerPath"))
        {
            $installerPath = $software.InstallerPath
            $arguments = $software.Arguments
            Write-Host "Installing $name..."
            Start-Process -FilePath $installerPath -ArgumentList $arguments -Wait
            Write-Host "$name installed successfully."
        }
    }
    else
    {
        Write-Host "$name is already installed. Skipping..."
    }
}

Write-Host "All installations are complete."
