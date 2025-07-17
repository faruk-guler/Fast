---
layout: post
title: Active Directory DC Health Check and Replication
date: 2022-07-20 16:56
author: theguler
comments: true
categories: [Active Directory]
---
<!-- wp:image {"id":3588,"sizeSlug":"large","linkDestination":"none","className":"is-resized"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/health_check.jpg?w=1024" alt="" class="wp-image-3588" /></figure>
<!-- /wp:image -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">-<strong>GENERAL COMMANDS</strong>

<strong>dcdiag
dcdiag /s:Guler.com
dcdiag /s:Guler.com /v &gt;&gt; c:\dcdiag_test.log</strong>
#The command runs different tests against the specified domain controller and returns a state for each test <strong>(Passed/Failed)</strong>

<strong>Dcdiag /s:Guler.com | select-string -pattern '\. (.*) \b(passed|failed)\b test (.*)'</strong>
#Display summary information only

<strong>dcdiag /v /test:FrsEvent /s:anatolia</strong>
#Detailed Event monitor

<strong>dcdiag.exe /s:guler.com /a</strong>
#To get the state of all domain controllers, use

<strong>dcdiag.exe /s:anatolia /q</strong>
#If you want to display only the errors you have found, use the /q option

<strong>dcdiag /s:anatolia /v</strong>
#Run DCDiag with Verbose Output

<strong>dcdiag /s:anatolia /fix</strong>
#There is a great switch that tries to do safe repairs on found errors: the /fix switch.</pre>
<!-- /wp:preformatted -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Some Typical tests it will do:</strong></h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><!-- wp:list-item -->
<li><strong>Connectivity</strong>&nbsp;– checks if the DC is registered in DNS, establishes test LDAP and RPC connections;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Advertising</strong>&nbsp;– checks roles and services published on the DC;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>FRSEvent</strong>&nbsp;– checks if there are any errors of file replication service (SYSVOL replication errors);</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>FSMOCheck</strong>&nbsp;– checks if the DC can connect to KDC, PDC, and Global Catalog server;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>MachineAccount&nbsp;</strong>— checks if the DC account is registered in AD correctly and if the&nbsp;domain trust relationship&nbsp;is correct;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>NetLogons</strong>&nbsp;– checks the logon privileges to allow replication to proceed;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Replications</strong>&nbsp;– checks the state of replication between domain controllers and if there are any errors;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>CrossRefValidation</strong> - Checks the validity of cross-references for domains.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>RidManager</strong> - Checks whether the RID manager is accessible or not.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>KnowsOfRoleHolders</strong>&nbsp;– checks the availability of the domain controllers with&nbsp;FSMO roles;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Services</strong>&nbsp;– checks if services on the domain controllers are running;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Systemlog</strong>&nbsp;– checks if there are any errors in the DC logs;</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Etc</strong>.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Topology</strong>&nbsp;– checks if KCC has generated full topology for all DCs</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>CheckSecurityError</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Intersite</strong>&nbsp;Check for failures that would prevent an inter-site replication</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>CutoffServers</strong>&nbsp;– finds a DC that is not replicated since its partner is unavailable</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>DNS</strong>&nbsp;– 6 DNS checks are available (<code>/DnsBasic</code>,&nbsp;<code>/DnsForwarders</code>,&nbsp;<code>/DnsDelegation</code>,&nbsp;<code>/DnsDymanicUpdate</code>,&nbsp;<code>/DnsRecordRegistration</code>,&nbsp;<code>/DnsResolveExtName</code>)</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>OutboundSecureChannels</strong></li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>VerifyReplicas</strong>&nbsp;– checks if the application partitions are replicated correctly</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>VerifyEnterpriseReferences</strong></li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p>You can find a full description of all available dcdiag tests&nbsp;<a href="https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2012-r2-and-2012/cc731968(v=ws.11)">here</a>.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Troubleshoot Active Directory Replication Errors Between DC 's</strong></h2>
<!-- /wp:heading -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">-<strong>REPLICATION</strong> 

<strong>repadmin /replsum</strong>
#Here is the basic command to check AD replication

<strong>repadmin /replsum *</strong>
#To check replication for all DC' s in the domain

<strong>repadmin /showreps</strong>
#It provides a detailed view of the replication status.

<strong>repadmin /showrepl</strong>
#To view the replication topology and errors (if any), run this command
#The command will check the DCs and return the time and date of the last successful replication for each directory partition

<strong><strong>repadmin </strong>/showrepl *</strong>
#To display additional replication info, use this command

<strong>repadmin /rodcpwdrepl</strong>
#To run password replication from a writable domain controller to a read-only domain controller (RODC)

<strong>repadmin /showrepl dc* /verbose /all /intersite</strong>
#displaying detailed information

<strong>repadmin /syncall /AdeP</strong>
#To quickly initiate and synchronize replications between all domain controllers

<strong>Repadmin /syncall anatolia /A /e /P</strong>
#Synchronize with all replication partners on the domain controller

<strong>repadmin /syncall guler.com</strong>
#To synchronize a specified DC with all its replication partners, use the command below

<strong>repadmin /queue</strong>
#To view the replication queue (Ideally, the replication queue should be empty)

<strong>Repadmin /showbackup *</strong>
#Check when the latest backup of the current domain controller was created</pre>
<!-- /wp:preformatted -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Using DCDiag to test DNS</strong></h2>
<!-- /wp:heading -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted"><strong>-DNS CHECKING</strong>

<strong>dcdiag /test:dns
dcdiag /s:anatolıa /test:dns</strong>
#By default, /test:dns performs all of the following basic tests on DNS, except for external name resolution.

<strong>dcdiag /test:dns</strong>
#The basic DNS test includes network connectivity, DNS client, zones, and service availability.

<strong>dcdiag /s:guler.com /test:dns /e /v</strong>
#For example, to check if DNS is working correctly on all domain controllers, use the following command

<strong>dcdiag /DnsForwarders</strong>
#Performs the basic test and checks the configuration of DNS forwarders.

<strong>dcdiag /DnsDelegation</strong>
#Basic and DNS delegation test.

<strong>dcdiag /DnsDynamicUpdate</strong>
#Runs the basic test and checks whether dynamic DNS updates are enabled in AD

<strong>dcdiag /DnsRecordRegistration</strong>
#Performs the /DNSBasic test and checks the registration of resource records (A, CNAME, and SRV).

<strong>dcdiag /DnsResolve&lt;Internet Name&gt;</strong>
#Performs the basic DNS tests and attempts to resolve the &lt;Internet name&gt;

<strong>dcdiag /DnsResolveExtName</strong>
#&lt;internet name&gt; To test DNS resolution for external names.

<strong>dcdiag</strong> <strong>/DNSAll</strong>
#Perform all above tests, except the /DnsResolveExtName.</pre>
<!-- /wp:preformatted -->

<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Active Directory Port List &amp; Active Directory Replikasyonu için Gerekli Port Listesi:</strong></h2>
<!-- /wp:heading -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted"><strong>TCP ve UDP 25: </strong>SMTP (Çoğaltma)
<strong>TCP ve UDP 53:</strong> DNS (Ad Çözme, Güven, Kullanıcı ve Bilgisayar Kimlik Doğrulama)
<strong>TCP ve UDP 88:</strong> Kerberos (Kullanıcı ve Bilgisayar Kimlik Doğrulama, Orman Düzeyi Güven)
<strong>TCP 135: </strong>RPC, EPM (Çoğaltma)
<strong>TCP ve UDP 137:</strong> NetBIOS Ad Çözümleme, NetBIOS Oturum Hizmeti, Kullanıcı ve Bilgisayar Kimlik Doğrulama, DFS, Grup İlkesi, NetLogon, NetBIOS Datagram Hizmeti
<strong>UDP 138:</strong> NetBIOS Datagram Hizmeti, DFS, Grup İlkesi, DFSN, NetLogon
<strong>TCP 139:</strong> NetBIOS Oturum Hizmeti, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Çoğaltma, DFSN
<strong>TCP ve UDP 389:</strong> LDAP (Dizin, Çoğaltma, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Grup İlkesi, Güven)
<strong>TCP 445:</strong> SMB, CIFS, SMB2, DFSN, LSARPC, NbtSS, NetLogonR, SamR, SrvSvc (Çoğaltma, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Grup İlkesi, Güven)
<strong>TCP 636: </strong>LDAP SSL (Dizin, Çoğaltma, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Grup İlkesi, Güven)
<strong>TCP 9389:</strong> SOAP (AD DS Web Hizmetleri)
<strong>TCP 3268:</strong> LDAP GC (Dizin, Çoğaltma, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Grup İlkesi, Güven)
<strong>TCP 3269:</strong> LDAP GC SSL (Dizin, Çoğaltma, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Grup İlkesi, Güven)
<strong>TCP 5722:</strong> DFSR (SYSVOL), RPC (Dosya Çoğaltma)
<strong>UDP 123:</strong> Windows Saati (Windows Saati, Güven)
<strong>TCP ve UDP 464: </strong>Kerberos (Çoğaltma, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Güven)
<strong>UDP Dinamik:</strong> DCOM, RPC, EPM, FRS, DRSUAPI, NetLogonR, SamR (Grup İlkesi)
<strong>TCP 9389:</strong> AD DS Web Hizmetleri (SOAP)
<strong>UDP 137:</strong> NetBIOS Ad Çözümleme, NetBIOS Oturum Hizmeti, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Çoğaltma
<strong>TCP 139:</strong> NetBIOS Oturum Hizmeti, Kullanıcı ve Bilgisayar Kimlik Doğrulama, Çoğaltma, DFSN</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p><strong>Faydalı olması dileğiyle – Hope it’s useful</strong></p>
<!-- /wp:paragraph -->
