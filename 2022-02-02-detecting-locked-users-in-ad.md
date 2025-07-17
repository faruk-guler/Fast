---
layout: post
title: Powershell ile AD Ortamında Kilitli Kullanıcıları Tespit Etmek
date: 2022-02-02 22:02
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":1278,"width":596,"height":198,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/sdsd.webp?w=1024" alt="" class="wp-image-1278" width="596" height="198" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>PS:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre id="block-212c4770-1090-40f9-a3aa-882bb19bd474" class="wp-block-preformatted">Search-ADAccount -LockedOut -UsersOnly -ResultPageSize 2000 -resultSetSize $null | Select-Object Name, SamAccountName | Export-CSV “C:\KilitlenenUsers.csv” -NoTypeInformation</pre>
<!-- /wp:preformatted -->
