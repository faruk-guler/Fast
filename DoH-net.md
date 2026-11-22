## DOH (DNS over HTTPS) nedir? DNS sorgularını HTTPS üzerinden şifreleyerek gönderen teknolojidir.

### Hangi sistemde DoH destekliyor?

| Sistem | DoH ayarı |
|---|---|
| **Windows 11** (tüm sürümler, build 22000+) | Var, arayüzden açılır |
| Windows Server 2022 (build 20348+) | Var |
| **Windows 10 21H2 / 22H2** (build 19044 / 19045) | **Yok** |

Windows 10'da DoH yalnızca Insider build 19628 ve üstünde vardı, normal sürümlere gelmedi. Build 19044 kullanan bir bilgisayarda sistem genelinde DoH açılamaz. Tarayıcı DoH'u ya da Windows 11 gerekir.

### Windows 10/11: Nereye ne yazılır?

Wi-Fi ve kablolu için ayrı ayrı yap.

1. **Ayarlar** → **Ağ ve İnternet** → **Wi-Fi** (kablolu için **Ethernet**) → bağlı olduğun ağın **Özellikler**'i
2. **DNS sunucu ataması** yanındaki **Düzenle** → **Manuel**
3. **IPv4**'ü aç:
   - Tercih edilen DNS: `1.1.1.1`
   - DNS over HTTPS: `Açık (şifresiz geri dönüş yok)`
   - Alternatif DNS: `1.0.0.1`
   - Alternatif DNS over HTTPS: `Açık (Yalnızca şifrelenmiş (HTTPS üzerinden DNS)
)` # Windows 10 desteklenmez
4. **IPv6**'yı aç:
   - Tercih edilen DNS: `2606:4700:4700::1111`
   - DNS over HTTPS: `Açık (şifresiz geri dönüş yok)`
   - Alternatif DNS: `2606:4700:4700::1001`
   - Alternatif DNS over HTTPS: `Açık (Yalnızca şifrelenmiş (HTTPS üzerinden DNS)
)` # Windows 10 desteklenmez
5. **Kaydet**

### Windows 10: Tarayıcıdan DoH

- **Chrome / Edge:** Ayarlar → Gizlilik ve güvenlik → Güvenlik → **Güvenli DNS kullan** → **Cloudflare (1.1.1.1)**
- **Firefox:** Ayarlar → Gizlilik ve Güvenlik → **HTTPS üzerinden DNS** → Cloudflare

Bu yalnızca tarayıcı trafiğini korur. Diğer uygulamalar düz DNS kullanmaya devam eder.

### Sorgu / doğrulama

**Windows 11 (PowerShell):**

```powershell
Get-DnsClientDohServerAddress
```

**Windows 10 (PowerShell):**
```powershell
DoH desteği yok sadece adaptörler ipv4 ve v6 dns adresi değiştirilebilir.
```

Dört Cloudflare adresi `https://cloudflare-dns.com/dns-query` şablonuyla listelenmeli. Windows 10 21H2'de bu komut "tanınmıyor" hatası verir, bu da desteğin olmadığını gösterir.

**Tarayıcıda:** `https://1.1.1.1/help` sayfasını aç, **Using DNS over HTTPS (DoH): Yes** satırına bak. Bu satır yalnızca o tarayıcının durumunu gösterir.
