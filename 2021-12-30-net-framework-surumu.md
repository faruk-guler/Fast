---
layout: post
title: How to find .Net-Framework version ?
date: 2021-12-30 09:11
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:paragraph -->
<p><strong>PS: </strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">gci 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse | gp -name Version -EA 0 | where { $_.PSChildName -match '^(?!S)\p{L}'} | select PSChildName, Version</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":808,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://farukguler.com/assets/post_images/2222.png?w=584" alt="" class="wp-image-808" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>CMD: </strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">reg query "HKEY_Local_Machine\Software\Microsoft\NET Framework Setup\NDP</pre>
<!-- /wp:preformatted -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">dir /b /ad /o-n %systemroot%\Microsoft.NET\Framework\v?.*</pre>
<!-- /wp:preformatted -->

<!-- wp:image {"id":810,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://farukguler.com/assets/post_images/111.png?w=599" alt="" class="wp-image-810" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>.NET Framework Yükleme-Kaldırma , Aktif etme - Framework Installation-Uninstallation, Activation</strong></p>
<!-- /wp:paragraph -->

<!-- wp:image {"id":819,"sizeSlug":"large","linkDestination":"none","className":"is-resized"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/333-1.png?w=1024" alt="" class="wp-image-819" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>Faydalı olması dileğiyle. – Hope it’s useful.</strong></p>
<!-- /wp:paragraph -->
