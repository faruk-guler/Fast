---
layout: post
title: GPO Reset By PowerShell
date: 2022-05-13 07:16
author: faruk-guler
comments: true
categories: [Windows OS]
---
<!-- wp:image {"id":333,"width":414,"height":233,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-4-sdn.jpg?w=1024" alt="" class="wp-image-333" width="414" height="233" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>Windows işletim sistemlerinde Grup İlkesi (Group Policy - GPO) ve Yerel Güvenlik İlkesi (Local Security Policy) ayarları PowerShell ve CMD komutlarıyla varsayılan haline döndürülebilir.</p>
<!-- /wp:paragraph -->


<!-- wp:heading -->
<h2 class="wp-block-heading"><strong>Nasıl Kullanılır?</strong></h2>
<!-- /wp:heading -->

<!-- wp:preformatted -->
```bash
Bulk Reset Group Policy Settings PS:
(gpedit.msc)
Remove-Item -Path "C:\Windows\System32\GroupPolicy\*" -Force -Recurse
Remove-Item -Path "C:\Windows\System32\GroupPolicyUsers\*" -Force -Recurse
gpupdate /force

Reset Local Security Policy Settings to Default in Windows CMD:
(secpol.msc)
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose

Log Wiew:
%windir%\security\logs\scesrv.log for detail info.
```
<!-- wp:paragraph -->
