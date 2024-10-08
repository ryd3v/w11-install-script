# Windows Software Installation Script

This repository contains a PowerShell script to automate the installation of commonly used software on a Windows
development system.
The script uses **winget** (the Windows Package Manager) and custom installer paths to download and install the
software, ensuring your system is set up quickly and consistently.

## Features

- **Checks if software is already installed**: The script uses the Windows registry to determine if each software is
  already installed and skips the installation if the software is detected.
- **Installs multiple popular applications**: The script includes the following software for installation:
    - Git
    - Google Chrome
    - Firefox Developer Edition
    - Node.js (LTS version)
    - Python 3
    - GPG (Gpg4win)
- **Silent Installation**: Each installation is performed silently to minimize interruptions during the setup process.

## Prerequisites

- **winget**: This script uses `winget` for some installations. Make sure `winget` is installed and properly configured
  on your system. Winget is usually pre-installed on Windows 10 and later versions.
- **Administrator privileges**: Run PowerShell as an administrator to allow installations.

## How to Use the Script

1. **Download or Clone the Repository**: You can download the script or clone this repository using Git.
   ```sh
   git clone https://github.com/ryd3v/win11-install-script.git
   ```

2. **Run the Script**: Open PowerShell with administrator privileges and run the script.
   ```powershell
   .\install.ps1
   ```
   This will start installing the applications listed in the script.

## Software Installation Logic

- The script defines a list of software to install, specifying whether to use **winget** or a direct installer path.
- For each piece of software, the script:
    1. **Checks if it is already installed** using the registry.
    2. **Installs the software** if it is not already present.
    3. Prints a message indicating whether the installation was performed or skipped.

## Customization

- **Add More Software**: You can easily add more software to the `$softwareList` array in the script by specifying the *
  *Name**, **WingetId**, and **Arguments** for each software.
- **Modify Arguments**: Adjust the `Arguments` field for each software to customize the installation behavior (e.g.,
  silent mode, custom installation directories).

## Example Software List Entry

Each software is represented as an object in the `$softwareList` array:

```powershell
@{ Name = "Git"; UseWinget = $true; WingetId = "Git.Git"; Arguments = "--silent" }
```

- **Name**: Display name of the software.
- **UseWinget**: Indicates whether to use winget for installation.
- **WingetId**: The ID used by winget to locate the software.
- **Arguments**: Command-line arguments to be passed to the installer.

## License

This project is licensed under the MIT License. Feel free to use, modify, and share!

## Contributions

Contributions are welcome! If you have suggestions to improve the script or add more functionality, feel free to create
a pull request or open an issue.

## Contact

For any issues or suggestions, please reach out through GitHub.

