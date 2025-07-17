---
layout: post
title: Oturumunuz Geçici Profille Açıldı
date: 2022-02-19 03:15
author: theguler
comments: true
categories: [Windows OS]
---
<!-- wp:image {"id":1896,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://farukguler.com/assets/post_images/we3.png?w=740" alt="" class="wp-image-1896" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>Sorun giderme yöntemi - Troubleshooting method</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Kayıt defteri üzerinde bazı ayarlar - Some settings on the registry</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre id="block-212c4770-1090-40f9-a3aa-882bb19bd474" class="wp-block-preformatted"><strong>-1</strong> Kayıt defteri dizinine git:
<strong>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList</strong>

<strong>-2</strong> Sol bölmede, S-1-5 (SID anahtarı) ile başlayan ve onu uzun bir sayının izlediği klasör adını arayın.
<strong>-3</strong> Sonu.BAK olan dizini bulup <strong>Ayarları ver - Export</strong> diyerek registery ayarlarını masaüstüne yedekleyin.****** önemli
<strong>-4</strong> Yedek aldıktan sonra sonu .BAK olan dizini silin

<strong>-5</strong> Bilgisayarı yeniden başlatın.


<strong>1-</strong> Go to <strong>Regedit</strong> directory:
<strong>HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList</strong>

<strong>-2</strong> In the left pane, look for the folder name that starts with S-1-5 (SID key) followed by a long number.
<strong>-3</strong> Find the directory with .BAK at the end and click Export Settings - Export to back up the registery settings to the desktop.<strong>****** important</strong>
<strong>-4</strong> Delete directory with .BAK after backup
<strong>-5</strong> Restart your computer.


<strong>Saygılarımla. – Best regards.</strong></pre>
<!-- /wp:preformatted -->
