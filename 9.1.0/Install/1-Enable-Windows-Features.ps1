
function Check-WindowsFeature {

    param(
        [Parameter(Position=0,Mandatory=$true)] [string]$FeatureName 
    )  
  if((Get-WindowsOptionalFeature -FeatureName $FeatureName -Online).State -eq "Enabled") {
        # $FeatureName is Installed
        ECHO "Feature " $FeatureName " is already installed."
    } else {
        ECHO "Installing " $FeatureName
        Enable-WindowsOptionalFeature -FeatureName $FeatureName -Online -All
    }
  }



Check-WindowsFeature "IIS-WebServerRole"
Check-WindowsFeature "IIS-WebServer"
Check-WindowsFeature "NetFx3"
Check-WindowsFeature "NetFx4-AdvSrvs"
Check-WindowsFeature "NetFx4Extended-ASPNET45"
Check-WindowsFeature "IIS-CommonHttpFeatures"
Check-WindowsFeature "IIS-HttpErrors"
Check-WindowsFeature "IIS-HttpRedirect"
Check-WindowsFeature "IIS-ApplicationDevelopment"
Check-WindowsFeature "IIS-NetFxExtensibility"
Check-WindowsFeature "IIS-NetFxExtensibility45"
Check-WindowsFeature "IIS-HealthAndDiagnostics"
Check-WindowsFeature "IIS-HttpLogging"
Check-WindowsFeature "IIS-RequestMonitor"
Check-WindowsFeature "IIS-HttpTracing"
Check-WindowsFeature "IIS-Security"
Check-WindowsFeature "IIS-URLAuthorization"
Check-WindowsFeature "IIS-RequestFiltering"
Check-WindowsFeature "IIS-IPSecurity"
Check-WindowsFeature "IIS-Performance"
Check-WindowsFeature "IIS-WebServerManagementTools"
Check-WindowsFeature "IIS-ManagementScriptingTools"
Check-WindowsFeature "WCF-Services45"
Check-WindowsFeature "WCF-HTTP-Activation"
Check-WindowsFeature "WCF-NonHTTP-Activation"
Check-WindowsFeature "WCF-HTTP-Activation45"
Check-WindowsFeature "WCF-TCP-Activation45"
Check-WindowsFeature "IIS-WindowsAuthentication"
Check-WindowsFeature "IIS-ODBCLogging"
Check-WindowsFeature "IIS-StaticContent"
Check-WindowsFeature "IIS-DefaultDocument"
Check-WindowsFeature "IIS-DirectoryBrowsing"
Check-WindowsFeature "IIS-ApplicationInit"
Check-WindowsFeature "IIS-ASPNET"
Check-WindowsFeature "IIS-ASPNET45"
Check-WindowsFeature "IIS-CustomLogging"
Check-WindowsFeature "IIS-BasicAuthentication"
Check-WindowsFeature "IIS-HttpCompressionStatic"
Check-WindowsFeature "IIS-ManagementService"
Check-WindowsFeature "IIS-ManagementConsole"
Check-WindowsFeature "Windows-Identity-Foundation"
