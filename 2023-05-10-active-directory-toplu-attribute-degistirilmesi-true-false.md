---
layout: post
title: Active Directory Toplu Attribute Değiştirilmesi
date: 2023-05-10 13:28
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":2148,"sizeSlug":"large","linkDestination":"none","className":"is-resized"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-as-admin.webp?w=1024" alt="" class="wp-image-2148" /></figure>
<!-- /wp:image -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Get-aduser -SearchBase “ou=test1,dc=guler,dc=com” -filter * -properties taahhut | where {($_.taahhut -eq $notset)} | Select-Object sAMAccountName,taahhut| Export-Csv C:\personel.csv -NoTypeInformation -Encoding UTF8  
#Burada test OU'su içerisindeki <strong>"taahhutleri notset olan"</strong> userler "personel.csv" dosyasina export edilir.

# "{($_.taahhut -eq $notset)}" bu kisimdaki "notset" kismi ilk asamada <strong>ne ise</strong> o yazilmalidir.

Import-Csv -Path C:\personels.csv | ForEach {Set-ADUser $_.sAMAccountName -Replace @{taahhut=$true}}
# burada ise kullanicilar okunup atributeleri degistirilir. (true yada false)</pre>
<!-- /wp:preformatted -->
