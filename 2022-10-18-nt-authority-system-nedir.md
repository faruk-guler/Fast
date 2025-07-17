---
layout: post
title: NT AUTHORITY_SYSTEM Nedir?
date: 2022-10-18 19:03
author: theguler
comments: true
categories: [Hacking - Security]
---
<!-- wp:image {"id":13315,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://farukguler.com/assets/post_images/nt-user.jpg?w=442" alt="" class="wp-image-13315" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>"NT AUTHORITY\SYSTEM" </strong>refers to the user account with the highest privileges on the system in Windows NT and later versions. This account is used by the operating system to execute or manage a program or process. The "SYSTEM" account has a much higher level of permissions and authorities than regular user accounts. Access to this account is typically used for operations required at the administrator level.</p>
<!-- /wp:paragraph -->

<!-- wp:list -->
<ul class="wp-block-list"><!-- wp:list-item -->
<li><strong>Has the highest privileges</strong>: <strong>SYSTEM</strong> is the account with the highest privileges on a system, including full access to the operating system's kernel mode. This includes the ability to perform operations such as making file and registry changes, starting and stopping services, and performing operations that are not permitted to other users. For example, some versions of SQL Server use the NT AUTHORITY\SYSTEM account.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Cannot be created or deleted by the user: </strong>The SYSTEM account is automatically created by the operating system and cannot be managed by a user.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The SYSTEM account has no password because a local "token" is used for authentication instead of a password.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The SYSTEM account does not have a profile for logging in.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The SYSTEM account cannot be used to access a computer remotely.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>It is used to manage the services of the operating system.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Accessing system resources:</strong> The SYSTEM account is used to access system resources such as files and registry.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li>The SYSTEM account is used to perform administrative tasks such as creating and deleting user accounts, managing groups, and configuring system policies.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Backup and Restore: </strong>Backup software can usually access and back up all files and folders using the "NT AUTHORITY\SYSTEM" account.</li>
<!-- /wp:list-item -->

<!-- wp:list-item -->
<li><strong>Security:</strong> This account has the highest security privileges in the system. Therefore, malwares may try to take over this account.</li>
<!-- /wp:list-item --></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p><strong>***Important: </strong>Due to the privileges of the SYSTEM account, it is important that only authorized users use this account. Access to the SYSTEM account by unauthorized users may compromise the security and integrity of the system.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph -->
<p><strong>Defend yourself, be stay strong. /Faruk GULER</strong></p>
<!-- /wp:paragraph -->
