function setup-az-204 {    
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/SuperUsersDK/automation/master/Setup/setup-az-204.ps1'))
}


function setup-scoop {
    Write-Host "Installing scoop (PowerShell Package Manager)" -ForegroundColor yellow

    # Install scoop (powershell package manager)
    iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

    scoop install 7zip 
    scoop install git 
    scoop install gitignore
    scoop install sudo 
    scoop install touch
    scoop install azure-cli 
    scoop install python
    scoop install pulumi

    # install http, because curl is not for humans
    pip install httpie

    # Add GUI Tools
    scoop bucket add extras
    scoop install googlechrome 
    scoop install vscode
    scoop install win32-openssh 
    scoop install pwsh
    scoop install concfg 
    scoop install gow 
    scoop install vim 
    scoop install starship
    scoop install windows-terminal
}

function setup-chocolatey {
    # Install chocolatey
    Write-Host "Installing Chocolatey (Windows Package Manager)" -ForegroundColor yellow

    Set-ExecutionPolicy Bypass -Scope Process -Force; 
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    choco install gitextensions -y
    choco install dotnetcore-sdk -y
    choco install dotnet-5.0-sdk -y
    choco install nodejs-lts --version=14.18.1 -y
    choco install azure-functions-core-tools-3 --params="'/x64:true'" -y
    choco install azurestorageemulator -y
    choco install microsoftazurestorageexplorer -y
    choco install azure-data-studio -y
    choco install postman -y
    choco install ngrok -y
    
}

function setup-dotnet {
    # Install httprepl
    dotnet tool install -g Microsoft.dotnet-httprepl
    dotnet nuget add source https://api.nuget.org/v3/index.json -n nuget.org


    # Visual Studio as CLI 
    # https://www.clarius.org/dotnet-vs/
    dotnet tool update -g dotnet-vs
    # start visual studio with --> vs
    # Install VS community with the .NET Core, ASP.NET and Azure workloads, 
    # shows installation progress and waits for it to finish before returning
    vs install +core +web +azure

    # Intall VS Code Extensions
    Write-Host "Installing VS Code Extensions" -ForegroundColor yellow

    code --install-extension ms-dotnettools.csharp
    code --install-extension ms-vscode.powershell
    code --install-extension ms-vscode.azurecli
    code --install-extension ms-vscode.azure-account
    code --install-extension ms-azuretools.vscode-azureappservice
    code --install-extension ms-azuretools.vscode-docker
    code --install-extension ms-azuretools.vscode-cosmosdb
    code --install-extension ms-azuretools.vscode-azurefunctions
    code --install-extension ms-azuretools.vscode-azurestaticwebapps
    code --install-extension GitHub.vscode-pull-request-github
    code --install-extension redhat.vscode-yaml
    code --install-extension bencoleman.armview
    code --install-extension msazurermtools.azurerm-vscode-tools
    code --install-extension CoenraadS.bracket-pair-colorizer-2
    code --install-extension mdickin.markdown-shortcuts
    code --install-extension mhutchie.git-graph 
    code --install-extension humao.rest-client
    code --install-extension ms-vscode.azurecli
}

function setup-angular {    
    # Install Angular
    Write-Host "Installing Angular " -ForegroundColor yellow

    npx @angular/cli@latest analytics off
    npm install  @angular/cli --global

    Write-Host "Installing NPM tools " -ForegroundColor yellow
    npm install fkill-cli kill-tabs rimraf empty-trash-cli pen speed-test live-server http-server is-online-cli is-up-cli clipboard-cli --global
}


function scoop-update-all {
<#
 How to update everything? 
 scoop  help update
#>
    scoop update 
    scoop update * --force --quiet
}

function scoop-list {
    scoop list
}


function scoop-homepage {
    param($appName)
    scoop home $appName
}


function scoop-info {
    param($appName)
    scoop info $appName
}


function setup-winget {
    # just for fun
    # https://devblogs.microsoft.com/commandline/
    winget install wingetcreate --silent
    WinGet install --id Microsoft.PowerToys --silent
    winget list 
}