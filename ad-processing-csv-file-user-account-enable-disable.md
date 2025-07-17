---
layout: post
title: AD Processing CSV file user account [enable - disable]
date: 2023-02-13 11:21
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":2148,"width":"509px","height":"auto","sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-as-admin.webp?w=1024" alt="" class="wp-image-2148" style="width:509px;height:auto" /></figure>
<!-- /wp:image -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted"># CSV dosyasının yolu<br>$csvPath = "C:\passreset_users.csv"<br><br># CSV dosyasını oku<br>$users = Import-Csv -Path $csvPath<br><br># Her bir kullanıcı için işlem yap<br>foreach ($user in $users) {<br>    $username = $user.Username<br>    $userStatus = Get-ADUser -Filter {SamAccountName -eq $<strong>username</strong>} | Select-Object -ExpandProperty Enabled<br>    if ($userStatus -eq $false) {<br>        # Kullanıcı devre dışı ise etkinleştir<br>        Enable-ADAccount -Identity $username<br>        Write-Host "Kullanıcı $username etkinleştirildi."<br>    } else {<br>        Write-Host "Kullanıcı $username zaten etkin durumda."<br>    }<br>}</pre>
<!-- /wp:preformatted -->
