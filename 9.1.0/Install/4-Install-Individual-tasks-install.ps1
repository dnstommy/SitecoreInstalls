

### Bring parameters into scope
. $PSScriptRoot\4-Install-Individual-tasks-parameters.ps1

### Run installs
Install-SitecoreConfiguration @certParams -Verbose

Install-SitecoreConfiguration @XconnectsolrParams

Install-SitecoreConfiguration @xconnectParams

Install-SitecoreConfiguration @SitecoresolrParams

Install-SitecoreConfiguration @sitecoreParams

Install-SitecoreConfiguration @certParamsForIdentityServer -Verbose

Install-SitecoreConfiguration @identityParams -Verbose