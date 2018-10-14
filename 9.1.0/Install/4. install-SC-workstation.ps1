# The prefix that will be used on the SOLR, Website, and Database instances.
$Prefix = "sc910"

# The root folder with the license file and the WDP files.
$SCInstallRoot = "C:\Temp\XP0"

# The name of the XConnect service.
$XConnectSiteName = "$prefix.xconnect"

# The Sitecore site instance name.
$SitecoreSiteName = "$prefix.sc"

# The Identity Server site name.
$IdentityServerSiteName = "$prefix.identityserver"

# The path to the license file.
$LicenseFile = "$SCInstallRoot\license.xml"

# The URL of the Solr Server.
$SolrUrl = "https://solr:8983/solr"

# The folder that Solr has been installed in.
$SolrRoot = "C:\solr\solr-7.2.1"

# The name of the Solr Service.
$SolrService = "Solr-7.2.1"

# The DNS name or IP address of the SQL Instance.
$SqlServer = "EC2AMAZ-5FFJEBR\SQLEXPRESS"

# A SQL user with sysadmin privileges.
$SqlAdminUser = "dev"

# The password for $SQLAdminUser.
$SqlAdminPassword = "dev123"

# The path to the XConnect package to deploy.
$XConnectPackage = "$SCInstallRoot\Sitecore 9.1.0 rev. 001442 (OnPrem)_xp0xconnect.scwdp.zip"

# The path to the Sitecore package to deploy.
$SitecorePackage = "$SCInstallRoot\Sitecore 9.1.0 rev. 001442 (OnPrem)_single.scwdp.zip"

# The path to the Identity Server package to deploy.
$IdentityServerPackage = "$SCInstallRoot\Sitecore.IdentityServer 2.0.0 rev. 00151 (OnPrem)_identityserver.scwdp.zip"

# The Identity Server password recovery URL, this should be the URL of the CM instance.
$PasswordRecoveryUrl = "http://$SitecoreSiteName"

# The URL of the XconnectService.
$XConnectCollectionService = "https://$XConnectSiteName"

# The URL of the Identity Authority.
$SitecoreIdentityAuthority = "https://$IdentityServerSiteName"

# The random string key used for establishing a connection with the IdentityService.
$ClientSecret = "SIF-Default"

# A pipe-separated list of instances (URIs) that are allowed to log in through Sitecore Identity.
$AllowedCorsOrigins = "http://$SitecoreSiteName"

# Install XP0 via combined partials file.
$singleDeveloperParams = @{
 Path = "$SCInstallRoot\XP0-SingleDeveloper.json"
 SqlServer = $SqlServer
 SqlAdminUser = $SqlAdminUser
 SqlAdminPassword = $SqlAdminPassword
 SolrUrl = $SolrUrl
 SolrRoot = $SolrRoot
 SolrService = $SolrService
 Prefix = $Prefix
 XConnectCertificateName = $XConnectSiteName
 IdentityServerCertificateName = $IdentityServerSiteName
 IdentityServerSiteName = $IdentityServerSiteName
 LicenseFile = $LicenseFile
 XConnectPackage = $XConnectPackage
 SitecorePackage = $SitecorePackage
 IdentityServerPackage = $IdentityServerPackage
 XConnectSiteName = $XConnectSiteName
 SitecoreSitename = $SitecoreSiteName
 PasswordRecoveryUrl = $PasswordRecoveryUrl
 SitecoreIdentityAuthority = $SitecoreIdentityAuthority
 XConnectCollectionService = $XConnectCollectionService
 ClientSecret = $ClientSecret
 AllowedCorsOrigins = $AllowedCorsOrigins
}

Push-Location $SCInstallRoot
Install-SitecoreConfiguration @singleDeveloperParams *>&1 | Tee-Object XP0-SingleDeveloper.log
Pop-Location