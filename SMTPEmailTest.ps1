############# Start Variables ################
$SMTPServerName = "smtp.servername.com"
$MailServerPort = 25  # Sayısal değer olarak tanımlamak daha iyidir
$MailFrom = "SMTPTest@YourDomain.com"
$MailTo = "YourUser@YourDomain.com"
$Subject = "Telnet SMTP Mail Test"
$MailBody = "This is a Telnet SMTP Mail Test."
############# End Variables ################

# Komutu parametreleri tam kullanarak çalıştıralım
Send-MailMessage -From $MailFrom `
                 -To $MailTo `
                 -Subject $Subject `
                 -Body $MailBody `
                 -SmtpServer $SMTPServerName `
                 -Port $MailServerPort `
                 -ErrorAction Stop

Write-Host "Mail başarıyla gönderilmeye çalışıldı." -ForegroundColor Green
