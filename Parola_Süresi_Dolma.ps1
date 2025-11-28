# Kullanıcıdan kullanıcı adını iste
$username = Read-Host "Kullanıcı adını giriniz"

# Kullanıcı bilgilerini al
try {
    $user = Get-ADUser -Identity $username -Properties msDS-UserPasswordExpiryTimeComputed, DisplayName, Enabled, PasswordLastSet, LockedOut -ErrorAction Stop
}
catch [Microsoft.ActiveDirectory.Management.ADIdentityNotFoundException] {
    Write-Host "HATA: '$username' kullanıcısı Active Directory'de BULUNAMADI!" -ForegroundColor Red
    Write-Host "Lutfen kullanıcı adını kontrol edip tekrar deneyin." -ForegroundColor Yellow
    Write-Host "Devam etmek için bir tuşa basın..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}
catch {
    Write-Host "HATA: Beklenmeyen bir hata olustu: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Devam etmek için bir tuşa basın..." -ForegroundColor Gray
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    exit
}

# Hesap kilit durumunu kontrol et
if ($user.LockedOut) {
    Write-Host "UYARI: $($user.DisplayName) ($username) kullanıcısının hesabı KILITLI!" -ForegroundColor Red -BackgroundColor DarkGray
    Write-Host "Oncelikle hesabın kilidini acmanız gerekmektedir." -ForegroundColor Yellow
}

# Hesap etkin durumda mı kontrol et
if ($user.Enabled -eq $false) {
    Write-Host "UYARI: $($user.DisplayName) ($username) kullanıcısının hesabı DEVRE DISI bırakılmış." -ForegroundColor DarkYellow
}

# Şifre son kullanma tarihini hesapla
$passwordExpiryDate = [DateTime]::FromFileTime($user.'msDS-UserPasswordExpiryTimeComputed')
$currentDate = Get-Date

# Şifre durumunu kontrol et
if ($currentDate -ge $passwordExpiryDate) {
    Write-Host "UYARI: $($user.DisplayName) ($username) kullanıcısının parola süresi DOLMUS." -ForegroundColor Red
    Write-Host "Parolanın dolduğu tarih: $passwordExpiryDate" -ForegroundColor Yellow
}
else {
    $daysRemaining = ($passwordExpiryDate - $currentDate).Days
    Write-Host "BILGI: $($user.DisplayName) ($username) kullanıcısının parola süresi dolmamış." -ForegroundColor Green
    Write-Host "Parolanın dolacağı tarih: $passwordExpiryDate" -ForegroundColor Cyan
    Write-Host "Kalan gün sayısı: $daysRemaining gün" -ForegroundColor Cyan
}

# Ek bilgiler
Write-Host "`n--- Ek Bilgiler ---" -ForegroundColor Gray
Write-Host "Kullanıcı Durumu: $(if ($user.Enabled) {'Etkin'} else {'Devre Disi'})"
Write-Host "Hesap Kilit Durumu: $(if ($user.LockedOut) {'Kilitli'} else {'Kilitli Degil'})"
Write-Host "Sifre Son Değiştirme: $($user.PasswordLastSet)"

# Bekleme
Write-Host "`nDevam etmek için bir tuşa basın..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")