---
layout: post
title: ERR_SSL_KEY_USAGE_INCOMPATIBLE
date: 2022-10-25 08:48
author: theguler
comments: true
categories: [Fix - Troubleshooting]
---
<!-- wp:image {"id":3241,"width":"319px","height":"auto","sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/solved.webp?w=852" alt="" class="wp-image-3241" style="width:319px;height:auto" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p>REG: Add</p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">Windows Registry Editor Version 5.00<br><br>[HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Google\Chrome]<br>"RSAKeyUsageForLocalAnchorsEnabled"=dword:00000000</pre>
<!-- /wp:preformatted -->
