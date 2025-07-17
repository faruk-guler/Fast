---
layout: post
title: Who included a computer in the domain
date: 2022-04-15 13:01
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":2832,"width":421,"height":196,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/image.webp?w=1024" alt="" class="wp-image-2832" width="421" height="196" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>Yetkili bir kullanıcı ile windows\debug klasörü altındaki <strong>NetSetup.lo</strong>g dosyasını inceler, Ağınızdaki tüm bilgisayarların C:\  yolunu paylaşıma açmayı unutmayınız.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Examine the <strong>NetSetup.log</strong> file under the windows\debug folder with an effective user. Do not forget to share the C:\ path of all computers in your network.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Powershell:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">$NoInfo = $null
$Offline = $null
$List = $null

#Get-Content getir.txt | foreach {
Get-ADComputer  -Filter * | foreach {
    $FQDN = $_.DNSHostName 
    $Path = "\\$FQDN\c`$\Windows\debug\NetSetup.log"
    if (Test-Connection $FQDN -Count 1 -ErrorAction SilentlyContinue) { 
        if (Test-Path $Path) {
            write-host "`n`nChecking $FQDN..."        
            $User = ($($(Select-String -Path $Path -Pattern "lpAccount: " -CaseSensitive)  -split " ")[3])
            $User
            [array]$List += Write-Output $FQDN";"$User

        } 
    else {[array]$NoInfo += $FQDN}
    } 
    else {[array]$Offline += $FQDN}
}
$list</pre>
<!-- /wp:preformatted -->
