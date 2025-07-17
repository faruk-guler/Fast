---
layout: post
title: Working with multiple PHP versions on XAMPP
date: 2022-04-06 18:49
author: theguler
comments: true
categories: [Web Servers]
---
<!-- wp:image {"id":12795,"width":"641px","height":"auto","sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/x_multi.png?w=745" alt="" class="wp-image-12795" style="width:641px;height:auto" /></figure>
<!-- /wp:image -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted"><strong>Download php versions:</strong><br>https://windows.php.net/downloads/releases/archives/<br>https://www.php.net/downloads.php<br><strong>Extract downloaded files to the directory:</strong><br>C:\xampp\ C:\xampp\php816 or x.x.x<br>-------------------------------------------------------------<br><strong>Edit File C++:</strong> C:\xampp\apache\conf\extra\httpd-xampp.conf <br>-------------------------------------------------------------<br><strong>Important!:</strong><br>extension_dir="C:\xampp\php\ext" <strong>-&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</strong><br><strong>#Change the extension's new php version path#</strong><br>-------------------------------------------------------------<br>ScriptAlias /php816/ "C:/xampp/php816/"<br>Action application/x-httpd-php816-cgi "/php816/php-cgi.exe" <strong>-&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;</strong><br><strong>#Replace php816 in the code block with the name of the php file you created#</strong><br>	&lt;Directory "C:/xampp/php816"&gt;<br>		AllowOverride None<br>		Options None<br>		Require all denied<br>		&lt;Files "php-cgi.exe"&gt;<br>			Require all granted<br>		&lt;/Files&gt;<br>		SetEnv PHPRC "C:/xampp/php816"<br>	&lt;/Directory&gt;<br>---------------------------------------------------------------<br>&lt;Directory "C:\xampp\htdocs\users_dokumans\public"&gt;| <strong>-&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;  </strong><br><strong>#This directory is the path to the site that will use the new version of PHP#</strong><br>	UnsetEnv PHPRC<br>	&lt;FilesMatch "\.php$"&gt;<br>		php_flag engine off<br>		SetHandler application/x-httpd-php816-cgi  <strong>-&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt;&gt; </strong><br><strong>#Replace this with the folder name containing the new php version#</strong><br>	&lt;/FilesMatch&gt;<br>&lt;/Directory&gt;<br>---------------------------------------------------------------<br><strong>#Please restart Xampp#</strong></pre>
<!-- /wp:preformatted -->
