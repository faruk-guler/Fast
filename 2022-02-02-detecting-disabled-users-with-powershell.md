---
layout: post
title: Detecting Disabled Users with Powershell - Powershell ile Disable Edilmiş Kullanıcıları Tespit Etmek 
date: 2022-02-02 22:07
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":333,"width":528,"height":296,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-4-sdn.jpg?w=1024" alt="" class="wp-image-333" width="528" height="296" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>PS:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre id="block-212c4770-1090-40f9-a3aa-882bb19bd474" class="wp-block-preformatted"><strong>Genel sorgu:</strong>
Search-ADAccount –AccountDisabled –UsersOnly –ResultPageSize 2000 –ResultSetSize $null | Select-Object SamAccountName, DistinguishedName | Export-CSV “C:\DisabledUsers.CSV” –NoTypeInformation

<strong>OU bazlı sorgulama:</strong>

Get-ADUser -Filter * -SearchBase “OU=uyeler,DC=guler,DC=com ” -Properties * | Where-Object {$_.Enabled -eq $false} | Select-Object DisplayName,SAMAccountName,mail | Export-Csv -Path C:\\DisabledUsers.CSV -NoTypeInformation</pre>
<!-- /wp:preformatted -->
