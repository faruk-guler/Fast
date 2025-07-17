---
layout: post
title: The wizard will be available after data collection finishes
date: 2022-02-12 01:39
author: theguler
comments: true
categories: [Fix - Troubleshooting]
---
<!-- wp:image {"id":1724,"width":645,"height":289,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/screenshot-1.png?w=627" alt="" class="wp-image-1724" width="645" height="289" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>Uyarı: </strong>Yapılacak işlem öncesi kesinlikle checkpoint veya snapshot alınmalıdır.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Important: </strong>A checkpoint or snapshot must be taken before the operation to be performed.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>CMD:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre id="block-212c4770-1090-40f9-a3aa-882bb19bd474" class="wp-block-preformatted">cd c:\Windows\System32\wbem\AutoRecover
for /f %s in ('dir /b *.mof *.mfl') do mofcomp %s</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p><strong>Faydalı olması dileğiyle. – Hope it will be useful</strong>.</p>
<!-- /wp:paragraph -->
