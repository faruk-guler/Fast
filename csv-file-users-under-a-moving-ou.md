---
layout: post
title: Csv dosyası icindeki kullanıcıların belli bir OU altına taşınması
date: 2022-01-29 13:50
author: theguler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":333,"width":377,"height":212,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large is-resized"><img src="https://farukguler.com/assets/post_images/powershell-4-sdn.jpg?w=1024" alt="" class="wp-image-333" width="377" height="212" /></figure>
<!-- /wp:image -->

<!-- wp:paragraph -->
<p><strong>PS ISE:</strong></p>
<!-- /wp:paragraph -->

<!-- wp:preformatted -->
<pre id="block-212c4770-1090-40f9-a3aa-882bb19bd474" class="wp-block-preformatted"># Import CSV
$MoveList = Import-Csv -Path "C:\scripts\uyeler.csv"
# Specify target OU.This is where users will be moved - kullanicilarin tasinacağı OU
$TargetOU =  “OU=uyeler,DC=guler,DC=com”
# Import the data from CSV file and assign it to variable - ilgili .csv dosyası
$Imported_csv = Import-Csv -Path "C:\scripts\uyeler.csv"

$Imported_csv | ForEach-Object {
# Retrieve DN of User.
$UserDN  = (Get-ADUser -Identity $_.SAM).distinguishedName
Write-Host ” Moving Accounts ….. ”
# Move user to target OU. uyeler tasiniyor
Move-ADObject  -Identity $UserDN  -TargetPath $TargetOU
}
Write-Host ” Completed move ”
$total = ($MoveList).count
$total
Write-Host “Accounts have been moved succesfully… - tasima islemi tamamlandi..”</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p><strong>Best Regards.</strong></p>
<!-- /wp:paragraph -->
