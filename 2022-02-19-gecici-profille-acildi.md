---
layout: post
title: Oturumunuz Gecici Profille Acildi Hatasi
date: 2022-05-14 07:28
author: faruk-guler
comments: true
categories: [Windows OS]
---
<!-- wp:image {"id":333,"width":414,"height":233,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/we3.jpg?w=1024" alt="" class="wp-image-333" width="614" height="233" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<strong>Kayıt defteri üzerinde bazı ayarlar ve sorun giderme - Some settings on the registry and troubleshooting.
<!-- /wp:paragraph -->

<!-- wp:heading -->

<h2 class="wp-block-heading"><strong>Nasıl Kullanılır?</strong></h2>

<!-- /wp:heading -->

<!-- wp:preformatted -->
```bash
-1 Kayıt defteri dizinine git:
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList

-2 Sol bölmede, S-1-5 (SID anahtarı) ile başlayan ve onu uzun bir sayının izlediği klasör adını arayın.
-3 Sonu.BAK olan dizini bulup Ayarları ver - Export diyerek registery ayarlarını masaüstüne yedekleyin.****** önemli
-4 Yedek aldıktan sonra sonu .BAK olan dizini silin
-5 Bilgisayarı yeniden başlatın.


1- Go to Regedit directory:
HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList

-2 In the left pane, look for the folder name that starts with S-1-5 (SID key) followed by a long number.
-3 Find the directory with .BAK at the end and click Export Settings - Export to back up the registery settings to the desktop.****** important
-4 Delete directory with .BAK after backup
-5 Restart your computer.


Saygılarımla. – Best regards.
```
<!-- wp:paragraph -->
