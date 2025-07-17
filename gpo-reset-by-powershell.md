---
layout: post
title: GPO Reset By PowerShell
date: 2022-05-17 13:53
author: theguler
comments: true
categories: [Windows Group Policy GPO]
---
<!-- wp:image {"id":333,"width":"507px","height":"auto","sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-4-sdn.jpg?w=1024" alt="" class="wp-image-333" style="width:507px;height:auto" /></figure>
<!-- /wp:image -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted"><strong>Bulk Reset Group Policy Settings PS:<br>(gpedit.msc</strong>)<br>Remove-Item -Path "C:\Windows\System32\GroupPolicy\*" -Force -Recurse<br>Remove-Item -Path "C:\Windows\System32\GroupPolicyUsers\*" -Force -Recurse<br>gpupdate /force<br><br><strong>Reset Local Security Policy Settings to Default in Windows CMD:<br>(secpol.msc)</strong><br>secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose<br><br><strong>Log Wiew:</strong><br>%windir%\security\logs\scesrv.log for detail info.</pre>
<!-- /wp:preformatted -->
