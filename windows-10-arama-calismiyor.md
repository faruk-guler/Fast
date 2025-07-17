---
layout: post
title: Windows 10 Search bar Not Working
date: 2022-08-29 17:33
author: theguler
comments: true
categories: [Fix - Troubleshooting]
---
<!-- wp:image {"id":4196,"width":554,"height":258,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/how-to-fixed-error.png?w=750" alt="" class="wp-image-4196" width="554" height="258" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>PS:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted"><strong>reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Search” /v BingSearchEnabled /t REG_DWORD /d 0 /f

reg add “HKCU\Software\Microsoft\Windows\CurrentVersion\Search” /v CortanaConsent /t REG_DWORD /d 0 /f 
tskill searchui

#Restart-Computer</strong></pre>
<!-- /wp:preformatted -->
