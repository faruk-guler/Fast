---
layout: post
title: Windows 10 Çoklu Uzak Masaüstü Bağlantısı
date: 2022-06-16 16:56
author: theguler
comments: true
categories: [Hacking - Security]
---
<!-- wp:image {"id":230,"width":493,"height":301,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/rdp-tool-windows.jpg?w=424" alt="" class="wp-image-230" width="493" height="301" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>Windows 10'da aynı anda RDP oturumları açmak için termrv.dll</strong>&nbsp;&nbsp;dosyasında&nbsp;küçük değişiklikler yapmanız gerekir .&nbsp;Bu dosya&nbsp;&nbsp;<strong>C:\Windows\System32</strong>&nbsp;klasöründe bulunur.&nbsp;<strong>termrv.dll'yi</strong>&nbsp;değiştirmeden önce, sahipliği almanız ve kendinize tam izinler vermeniz gerekir.&nbsp;Ayrıca&nbsp; çalışıyorsa&nbsp;<strong>Uzak Masaüstü</strong>&nbsp;&nbsp;servisini (<strong>TermService</strong>) durdurmanız gerekir.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>DLL</strong> dosyaları herhangi bir HEX Düzenleyicisi kullanılarak değiştirilebilir (örneğin:&nbsp;&nbsp;<strong>Tiny Hexer</strong>, <strong>Hex Editor</strong>).&nbsp;Aşağıda gösterilen dizeleri değiştirerek bunu kendiniz yapabilir veya buradan yamalı sürümleri indirebilirsiniz. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>**<strong>Önemli</strong>: her ihtimale karşı DLL dosyasının kesinlikle bir kopyasını saklayınız!</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>**<strong>Important:</strong> Definitely keep a copy of the DLL just in case!</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Windows 10 x64 v21H1 - Mayıs 2021 Update</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>201H1 güncellemesinde termrv.dll sürümünü değiştirilmedi&nbsp;<strong>10.0.19041.1023</strong> olarak kaldı, bu yüzden aynı 20H2 yaması gayet iyi çalışıyor.</p>
<!-- /wp:paragraph -->

<!-- wp:heading {"level":3} -->
<h3>Windows 10 x64 v20H2 - Ekim 2020 Update</h3>
<!-- /wp:heading -->

<!-- wp:paragraph -->
<p>Bu güncellemeden sonra&nbsp;&nbsp;<strong>termrv.dll</strong>&nbsp;&nbsp;<strong>10.0.19041.1023</strong> sürümüne yükseltildi. Eşzamanlı uzak masaüstü bağlantıları yapabilmek için  DLL üzerinde aşağıdaki değişiklikleri yapın:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Bunu:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>39 81 3C 06 00 00 0F 84 21 68 01 00</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Bununla değiştirin:</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>B8 00 01 00 00 89 81 38 06 00 00 90</strong></p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p>Yamalı dosya ve orijinal dosya buradan indirilebilir . Orijinal: v10.0.19041.1023</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Download:</strong> https://github.com/faruk-guler/JumpTools</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Bir sonraki makalemizde görüşmek üzere.</strong> <strong>- See you in our next article.</strong></p>
<!-- /wp:paragraph -->
