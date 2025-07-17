---
layout: post
title: AD User Detailed Check PowerShell
date: 2025-01-01 23:33
By: faruk-guler
comments: true
categories: [PowerShell]
---
<!-- wp:image {"id":15489,"sizeSlug":"large","linkDestination":"none"} -->
<figure class="wp-block-image size-large"><img src="https://farukguler.com/assets/post_images/powershell-4-sdn.jpg?w=225" alt="" class="wp-image-15489" /></figure>
<!-- /wp:image -->

<!-- wp:preformatted -->
<pre class="wp-block-preformatted"><strong># Add user CSV file:</strong><br>$csvPath = "C:\100.csv"<br><br><strong># Export CSV:</strong><br>$outputPath = "C:\output.csv"<br><br># Import data:<br>$users = Import-Csv -Path $csvPath<br><br># Export info:<br>$output = @()<br><br># For each user:<br>foreach ($user in $users) {<br>    # SamAccountName found..<br>    if (-not $user.SamAccountName) {<br>        Write-Host "Empty SamAccountName Found!" -ForegroundColor Yellow<br>        continue<br>    }<br><br>    try {<br>        # GEt user AD:<br>        $adUser = Get-ADUser -Filter "SamAccountName -eq '$($user.SamAccountName)'" -Properties DisplayName, SamAccountName, LastLogonDate, Enabled<br><br>        if ($adUser) {<br>            # Add user information:<br>            $output += [PSCustomObject]@{<br>                "Ad Soyad"         = $adUser.DisplayName<br>                "TCNO"             = $adUser.SamAccountName<br>                "Son Logon Date"   = if ($adUser.LastLogonDate) { $adUser.LastLogonDate } else { "no login" }<br>                "Hesap Durumu"     = if ($adUser.Enabled) { "Enabled" } else { "Disabled" }<br>            }<br>        } else {<br>            # User not found warning:<br>            $output += [PSCustomObject]@{<br>                "TCNO"             = "Not found!"<br>                "Ad Soyad"         = "Not found!"<br>                "Son Logon Date"   = "N/A"<br>                "Hesap Durumu"     = "N/A"<br>            }<br>        }<br>    } catch {<br>        Write-Host "An error occurred: $_" -ForegroundColor Red<br>    }<br>}<br><br><strong># Save file xx.csv</strong><br>$output | Export-Csv -Path $outputPath -NoTypeInformation -Encoding UTF8<br><br>Write-Host "Process completed! Output file: $outputPath"</pre>
<!-- /wp:preformatted -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->
