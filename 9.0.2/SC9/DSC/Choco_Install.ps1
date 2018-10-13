Write-Output "installing Chocolatey"
(iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1')))>$null 2>&1
choco --version
Write-Output "Chocolatey install complete"

#Default path for config file after installation.
#$path = "C:\ProgramData\chocolatey\config\chocolatey.config"

#Default Choco repo path
#$defaultPath = "https://chocolatey.org/api/v2/"

#AFHS Nexus choco repo path
#$repoPath = "http://ci-nexus.ashleyfurniture.com:8081/nexus/service/local/nuget/AshleyChocolateyRepositories/";

#Reading the content of XML file.
#$xml = [xml](Get-Content $path)

# Update �chocolatey�: Changing Attribute value of node at level 3 based on �id� attribute on same level.
#$node = $xml.chocolatey.sources.source | where {$_.id -eq 'chocolatey'}
#$node.value = $repoPath

#Save the file to apply changes.
#$xml.Save($path)

choco install webpi
if (! (& 'C:\Program Files\Microsoft\Web Platform Installer\WebPICMD.exe' /List /ListOption:Installed | sls UrlRewrite -Quiet))
{
	choco install UrlRewrite -Y
}

choco install atom -Y
choco install git.install -Y
choco install sourcetree -Y
choco install googlechrome -Y
choco install firefox -Y
choco install fiddler4 -Y
choco install beyondcompare -Y
choco install nodejs.install -Y
choco install agentransack -Y
choco install visualstudio2013professional -Y
choco install conemu -Y
choco install dotpeek -Y
