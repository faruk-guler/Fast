---
layout: post
title: Preventing "Server Manager" From Opening Automatically on Every Logon Process
date: 2023-05-01 00:07
author: theguler
comments: true
categories: [Windows OS]
---
<!-- wp:image {"id":6981,"width":524,"height":388,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/server_manager-1.jpg?w=1024" alt="" class="wp-image-6981" width="524" height="388" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>CMD: Run as Administrator</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted">#To Block
<strong>schtasks /change /tn "Microsoft\Windows\Server Manager\ServerManager" /disable</strong>

#To Activate
<strong>schtasks /change /tn "Microsoft\Windows\Server Manager\ServerManager" /enable</strong></pre>
<!-- /wp:preformatted -->
