---
layout: post
title: Exporting the OS Active Directory Computers
date: 2022-09-25 19:06
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":2148,"width":399,"height":224,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-as-admin.webp?w=1024" alt="" class="wp-image-2148" width="399" height="224" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>PS ISE:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Get-ADComputer -Filter * -Property * | Select-Object Name,OperatingSystem,ipv4Address,OperatingSystemServicePack,OperatingSystemVersion | Export-CSV C:\Export\Allcomputer.csv -NoTypeInformation -Encoding UTF8</pre>
<!-- /wp:preformatted -->
