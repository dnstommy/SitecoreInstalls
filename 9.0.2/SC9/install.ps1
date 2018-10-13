<#
    Install script for a non-scaled XP instance on a single machine

    All sitecore applications/services are installed on the current machine
    All databases on installed on the given SqlServer
#>

# Bring parameters into scope
. $PSScriptRoot\parameters.1.ps1

### Run installs





Install-SitecoreConfiguration @certParams -Verbose

Install-SitecoreConfiguration @XconnectsolrParams

Install-SitecoreConfiguration @xconnectParams

Install-SitecoreConfiguration @SitecoresolrParams

Install-SitecoreConfiguration @sitecoreParams