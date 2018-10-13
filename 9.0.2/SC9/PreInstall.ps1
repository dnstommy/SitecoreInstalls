Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install googlechrome -Y
choco install jre8 -Y
choco install winrar -Y
choco install javaruntime -Y
choco install git.install -Y
choco install dotnetcore -Y
choco install nodejs.install -Y
choco install notepadplusplus -Y
choco install conemu -Y
choco install visualstudiocode -Y
choco install visualstudio2017professional -Y
choco install webdeploy -Y
choco install urlrewrite -Y

