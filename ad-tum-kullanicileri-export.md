---
layout: post
title: AD Tüm Kullanıcıları Almak PowerShell
date: 2022-02-06 20:14
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":333,"width":486,"height":272,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-4-sdn.jpg?w=1024" alt="" class="wp-image-333" width="486" height="272" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph {"align":"left"} -->
<p class="has-text-align-left"><strong>PS:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre id="block-212c4770-1090-40f9-a3aa-882bb19bd474" class="wp-block-preformatted"><strong>Tüm-All domaindeki userlar:</strong>

Get-ADUser -filter * -properties * | Select-Object -Property DisplayName,samaccountname | ConvertTo-Csv | Out-File C:\\Tum_Users.CSV

<strong>OU Bazlı Sorgulama:</strong>

Get-ADUser -Filter * -SearchBase "OU=uyeler,DC=guler,DC=com" -properties * | Select-Object -Property DisplayName,samaccountname | ConvertTo-Csv | Out-File C:\\OU_altindaki_Users.CSV</pre>
<!-- /wp:preformatted -->
