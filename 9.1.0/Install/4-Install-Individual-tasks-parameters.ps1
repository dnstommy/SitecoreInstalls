#define parameters
$prefix = "usmssc9"
$PSScriptRoot = "C:\resourcefiles"

$XConnectCollectionService = "$prefix.xconnect"
$sitecoreSiteName = "$prefix.sc"
$SolrUrl = "https://solr:8983/solr"
$SolrRoot = "C:\solr\solr-7.2.1"
$SolrService = "Solr-7.2.1"
$SqlServer = ".\SQLEXPRESS"
$SqlAdminUser = "dev"
$SqlAdminPassword = "dev123"
$IdentityServerSiteName = "$prefix.identityserver"
$ClientSecret="Random_STRING"



#install client certificate for xconnect
$certParams = @{
 Path = "$PSScriptRoot\createcert.json"
 CertificateName = "$prefix.xconnect_client"
}



#install solr cores for xdb
$XconnectsolrParams = @{
 Path = "$PSScriptRoot\xconnect-solr.json"
 SolrUrl = $SolrUrl
 SolrRoot = $SolrRoot
 SolrService = $SolrService
 CorePrefix = $prefix
}




#deploy xconnect instance
$xconnectParams = @{
 Path = "$PSScriptRoot\xconnect-xp0.json"
 Package = "$PSScriptRoot\Sitecore 9.1.0 rev. 001564 (OnPrem)_xp0xconnect.scwdp.zip"
 LicenseFile = "$PSScriptRoot\license.xml"
 Sitename = $XConnectCollectionService
 XConnectCert = $certParams.CertificateName
 SqlDbPrefix = $prefix
 SqlServer = $SqlServer
 SqlAdminUser = $SqlAdminUser
 SqlAdminPassword = $SqlAdminPassword
 SolrCorePrefix = $prefix
 SolrURL = $SolrUrl
}


#install solr cores for sitecore
$SitecoresolrParams = @{
 Path = "$PSScriptRoot\sitecore-solr.json"
 SolrUrl = $SolrUrl
 SolrRoot = $SolrRoot
 SolrService = $SolrService
 CorePrefix = $prefix
}


#install sitecore instance
$xconnectHostName = "$prefix.sc"
$sitecoreParams = @{
 Path = "$PSScriptRoot\sitecore-XP0.json"
 Package = "$PSScriptRoot\Sitecore 9.1.0 rev. 001564 (OnPrem)_single.scwdp.zip"
 LicenseFile = "$PSScriptRoot\license.xml"
 SqlDbPrefix = $prefix
 SqlServer = $SqlServer
 SqlAdminUser = $SqlAdminUser
 SqlAdminPassword = $SqlAdminPassword
 SolrCorePrefix = $prefix
 SolrUrl = $SolrUrl
 XConnectCert = $certParams.CertificateName
 Sitename = $sitecoreSiteName
 XConnectCollectionService = "https://$XConnectCollectionService" 
}


$certParamsForIdentityServer = @{
Path = "$PSScriptRoot\createcert.json"
CertificateName = $IdentityServerSiteName
}

#install Sitecore Identity Server
$identityParams =
 @{
 Path = "$PSScriptRoot\IdentityServer.json"
 Package = "$PSScriptRoot\Sitecore.IdentityServer 2.0.0 rev. 00157 (OnPrem)_identityserver.scwdp.zip"
 SqlDbPrefix = $prefix
 SqlServer = $SqlServer
 SqlCoreUser = $SqlAdminUser
 SqlCorePassword = $SqlAdminPassword
 SitecoreIdentityCert = $certParamsForIdentityServer.CertificateName
 Sitename = $IdentityServerSiteName
 PasswordRecoveryUrl = $sitecoreSiteName
 AllowedCorsOrigins = $sitecoreSiteName
 ClientSecret = $ClientSecret
 LicenseFile = "$PSScriptRoot\license.xml"
 }

