#define parameters
$prefix = "xp0"
$PSScriptRoot = "C:\resourcefiles"

$XConnectCollectionService = "$prefix.xconnect"
$sitecoreSiteName = "$prefix.sc"
$SolrUrl = "https://solr:8983/solr"
$SolrRoot = "C:\solr\solr-6.6.2"
$SolrService = "Solr-6.6.2"
$SqlServer = "EC2AMAZ-T73CCDV\SQLEXPRESS"
$SqlAdminUser = "dev"
$SqlAdminPassword = "EhA%49Y!jd(w#iF"
#install client certificate for xconnect






$certParams = @{
 Path = "$PSScriptRoot\xconnect-createcert.json"
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
 Package = "$PSScriptRoot\Sitecore 9.0.2 rev. 180604 (OnPrem)_xp0xconnect.scwdp.zip"
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
 Package = "$PSScriptRoot\Sitecore 9.0.2 rev. 180604 (OnPrem)_single.scwdp.zip"
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