@echo off
:: Mengubah judul jendela aplikasi
color 0B
title Administrator: IT SUPPORT TOOLKIT v2.3 UNIVERSAL

:: Mengubah warna background hitam (0) dan teks Cyan/Aqua (B)
color 0A

:MENU
cls
echo.
echo    ___ _____   _____           _ _    _ _ 
echo   ^|_ _^|_   _^| ^|_   _^|__   ___ ^| ^| ^| _(_) ^|_ 
echo    ^| ^|  ^| ^|     ^| ^|/ _ \ / _ \^| ^| ^|/ / ^| __^|
echo    ^| ^|  ^| ^|     ^| ^| (_) ^| (_) ^| ^|   ^<^| ^| ^|_ 
echo   ^|___^| ^|_^|     ^|_^|\___/ \___/^|_^|_^|\_\_^|\__^|
echo.
echo ===================================================
echo      CREATED BY FERRYL YOGA PRATAMA - 2026
echo ===================================================
echo.
echo NETWORK
echo [1] Cek Koneksi Internet - Ping
echo [2] Cek IP Address
echo [3] Cek Network Interface
echo [4] Flush DNS + Renew IP + Reset Winsock
echo [5] Enable / Disable WiFi Adapter
echo.
echo SYSTEM
echo [6] Info OS dan Hardware
echo [7] Cek Serial Number CPU / Mobo / BIOS
echo [8] Clean Temp Files
echo [9] Cek Harddisk - chkdsk
echo [10] Kill Process Frozen
echo [11] Cek Windows Activation
echo [12] Cek Suhu CPU
echo.
echo DRIVER
echo [13] Scan Hardware Tanpa Driver
echo [14] Update Driver Otomatis
echo.
echo USER ACCOUNT
echo [15] Reset Password User
echo [16] Enable / Disable Admin Account
echo.
echo WINDOWS REPAIR
echo [17] Repair Windows Update - SFC + DISM
echo [18] Repair .NET Framework
echo [19] Reset Windows Firewall
echo.
echo UTILITIES
echo [20] Enable / Disable Remote Desktop
echo [21] Backup Registry
echo [22] Uninstall Program
echo [23] Shutdown / Restart Timer
echo.    
echo PRINTER
echo [24] Download Driver Printer         [28] Clear Print Queue / Spooler
echo [25] Share / Unshare Printer         [29] Set Default Printer
echo [26] Connect Shared Printer by IP    [30] Restart Print Spooler
echo [37] List Printer dan Status         [31] Close Print Queue
echo [32] Backup / Restore Printer        
echo.
echo TOMCAT
echo [33] Install Tomcat Icha Print       [35] Uninstall Tomcat - Clean
echo [34] Cek Status Port 8080            
echo.
echo POST INSTALL
echo [36] Auto Install Apps (Chrome, dll) 
echo.
echo ===================================================
echo [99] EXIT
echo ===================================================
echo.

:: Meminta input angka dari user
set /p pilihan="root@IT-TOOLKIT # "

:: Logika routing berdasarkan input
if "%pilihan%"=="1" goto PING_TEST
if "%pilihan%"=="2" goto IP_CHECK
if "%pilihan%"=="3" goto CEK_NIC
if "%pilihan%"=="4" goto RESET_NET
if "%pilihan%"=="5" goto WIFI_ADAPTER
if "%pilihan%"=="6" goto SYS_INFO
if "%pilihan%"=="7" goto CEK_SN
if "%pilihan%"=="8" goto CLEAN_TEMP
if "%pilihan%"=="9" goto CHKDSK_SCAN
if "%pilihan%"=="10" goto KILL_FROZEN
if "%pilihan%"=="11" goto CEK_AKTIVASI
if "%pilihan%"=="12" goto CEK_SUHU
if "%pilihan%"=="13" goto SCAN_DRIVER
if "%pilihan%"=="14" goto UPDATE_DRIVER
if "%pilihan%"=="15" goto RESET_PASS
if "%pilihan%"=="16" goto ADMIN_ACCOUNT
if "%pilihan%"=="17" goto REPAIR_WINDOWS
if "%pilihan%"=="18" goto REPAIR_NET
if "%pilihan%"=="19" goto RESET_FIREWALL
if "%pilihan%"=="20" goto REMOTE_DESKTOP
if "%pilihan%"=="21" goto BACKUP_REGISTRY
if "%pilihan%"=="22" goto UNINSTALL_APP
if "%pilihan%"=="23" goto SHUTDOWN_TIMER
if "%pilihan%"=="24" goto DOWNLOAD_PRINTER
if "%pilihan%"=="25" goto SHARE_PRINTER
if "%pilihan%"=="26" goto CONNECT_PRINTER
if "%pilihan%"=="27" goto LIST_PRINTER
if "%pilihan%"=="28" goto CLEAR_SPOOLER
if "%pilihan%"=="29" goto SET_DEFAULT_PRINTER
if "%pilihan%"=="30" goto RESTART_SPOOLER
if "%pilihan%"=="31" goto CLOSE_PRINT_QUEUE
if "%pilihan%"=="32" goto BACKUP_PRINTER
if "%pilihan%"=="33" goto INSTALL_TOMCAT
if "%pilihan%"=="34" goto CEK_PORT_8080
if "%pilihan%"=="35" goto UNINSTALL_TOMCAT
if "%pilihan%"=="36" goto POST_INSTALL_APPS
if "%pilihan%"=="99" goto KELUAR

:: Jika input salah, kembali ke menu awal
goto MENU


:: ========================================
:: BAGIAN FUNGSI / PERINTAH
:: ========================================

:PING_TEST
cls
echo Melakukan Ping ke Google DNS (8.8.8.8)...
ping 8.8.8.8
echo.
pause
goto MENU

:IP_CHECK
cls
echo Menampilkan IP Address...
ipconfig
echo.
pause
goto MENU

:CEK_NIC
cls
echo ===================================================
echo STATUS NETWORK INTERFACE (ADAPTER JARINGAN)
echo ===================================================
echo.
netsh interface show interface
echo.
echo Menampilkan informasi MAC Address:
ipconfig /all | findstr /i "Description Physical"
echo.
pause
goto MENU

:RESET_NET
cls
echo ===================================================
echo MERESET JARINGAN (DNS, IP, DAN WINSOCK)
echo ===================================================
echo.
echo [1/3] Menghapus cache DNS...
ipconfig /flushdns
echo.
echo [2/3] Memperbarui IP Address (mohon tunggu)...
ipconfig /release
ipconfig /renew
echo.
echo [3/3] Mereset konfigurasi Winsock...
netsh winsock reset
echo.
echo ===================================================
echo PROSES SELESAI!
echo Note: Windows biasanya meminta Restart PC agar
echo reset Winsock berfungsi secara maksimal.
echo ===================================================
pause
goto MENU

:WIFI_ADAPTER
cls
echo ===================================================
echo ENABLE / DISABLE WIFI ADAPTER
echo ===================================================
echo.
echo Catatan: Pastikan nama adapter kamu adalah "Wi-Fi". 
echo (Bisa dicek melalui menu nomor 3).
echo.
echo [1] Matikan (Disable) Wi-Fi
echo [2] Nyalakan (Enable) Wi-Fi
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_wifi="Pilih aksi (0/1/2): "

if "%aksi_wifi%"=="1" (
    echo.
    echo Mematikan adapter Wi-Fi...
    netsh interface set interface name="Wi-Fi" admin=disable
    echo Selesai!
) else if "%aksi_wifi%"=="2" (
    echo.
    echo Menyalakan adapter Wi-Fi...
    netsh interface set interface name="Wi-Fi" admin=enable
    echo Selesai!
) else (
    goto MENU
)
echo.
pause
goto MENU

:SYS_INFO
cls
echo Menampilkan Informasi Sistem...
systeminfo
echo.
pause
goto MENU

:CEK_SN
cls
echo ===================================================
echo SERIAL NUMBER CPU, MOTHERBOARD, DAN BIOS
echo ===================================================
echo.
echo [1/3] Informasi CPU (Processor):
powershell -command "Get-CimInstance Win32_Processor | Select-Object Name, ProcessorId | Format-Table -AutoSize"
echo.
echo [2/3] Informasi Motherboard (BaseBoard):
powershell -command "Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product, SerialNumber | Format-Table -AutoSize"
echo.
echo [3/3] Informasi BIOS:
powershell -command "Get-CimInstance Win32_BIOS | Select-Object Manufacturer, SMBIOSBIOSVersion, SerialNumber | Format-Table -AutoSize"
echo.
echo ===================================================
pause
goto MENU

:CLEAN_TEMP
cls
echo ===================================================
echo MEMBERSIHKAN FILE TEMPORARY (SAMPAH)
echo ===================================================
echo.
echo [1/2] Menghapus file cache User...
del /q/f/s "%TEMP%\*"
echo.
echo [2/2] Menghapus file cache Sistem Windows...
del /q/f/s "C:\Windows\Temp\*"
echo.
echo ===================================================
echo Selesai dibersihkan! 
echo (Abaikan peringatan 'Access Denied' karena 
echo itu adalah file yang sedang dipakai oleh Windows).
echo ===================================================
pause
goto MENU

:CHKDSK_SCAN
cls
echo ===================================================
echo CEK KESEHATAN HARDDISK / SSD (CHKDSK)
echo ===================================================
echo.
echo Pilih mode pemindaian untuk Drive C:
echo [1] Scan Normal (Read-only, Aman ^& Cepat)
echo [2] Scan dan Perbaiki Error (Butuh Restart PC)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_disk="Pilih mode (0/1/2): "

if "%aksi_disk%"=="1" goto CHKDSK_1
if "%aksi_disk%"=="2" goto CHKDSK_2
goto MENU

:CHKDSK_1
echo.
echo Memulai proses scanning Drive C: (mohon tunggu)...
chkdsk C:
echo.
pause
goto MENU

:CHKDSK_2
echo.
echo PERHATIAN: Perbaikan sistem file membutuhkan PC untuk di-restart.
echo Silakan ketik 'Y' lalu tekan Enter saat muncul konfirmasi (Y/N).
echo.
chkdsk C: /f /r /x
echo.
pause
goto MENU

:KILL_FROZEN
cls
echo ===================================================
echo MENGHENTIKAN APLIKASI YANG HANG / FROZEN
echo ===================================================
echo.
echo [1] Otomatis tutup semua aplikasi "Not Responding"
echo [2] Tutup aplikasi secara manual (Ketik nama .exe)
echo [3] Restart Windows Explorer (Jika Taskbar/Desktop Blank)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_kill="Pilih mode (0/1/2/3): "

if "%aksi_kill%"=="1" goto KILL_AUTO
if "%aksi_kill%"=="2" goto KILL_MANUAL
if "%aksi_kill%"=="3" goto KILL_EXPLORER
goto MENU

:KILL_AUTO
echo.
echo Mencari dan menghentikan aplikasi yang Not Responding...
taskkill /f /fi "status eq not responding"
echo.
pause
goto MENU

:KILL_MANUAL
echo.
echo Daftar aplikasi yang sedang berjalan (sebagian):
tasklist | findstr /i ".exe" | more
echo.
set /p nama_exe="Masukkan nama aplikasi (contoh: chrome.exe): "
taskkill /f /im "%nama_exe%" /t
echo.
pause
goto MENU

:KILL_EXPLORER
echo.
echo Merestart Windows Explorer (Layar mungkin berkedip)...
taskkill /f /im explorer.exe
start explorer.exe
echo Selesai!
echo.
pause
goto MENU

:CEK_AKTIVASI
cls
echo ===================================================
echo STATUS AKTIVASI LISENSI WINDOWS
echo ===================================================
echo.
echo [1/2] Mengecek masa aktif lisensi...
cscript //nologo c:\windows\system32\slmgr.vbs /xpr
echo.
echo [2/2] Menampilkan detail lisensi...
cscript //nologo c:\windows\system32\slmgr.vbs /dli
echo.
echo ===================================================
pause
goto MENU

:CEK_SUHU
cls
echo ===================================================
echo CEK SUHU CPU (ACPI THERMAL ZONE)
echo ===================================================
echo.
echo Mengekstrak data dari sensor motherboard...
echo.
powershell -command "$tz = Get-CimInstance -Namespace root\wmi -ClassName MSAcpi_ThermalZoneTemperature -ErrorAction SilentlyContinue; if ($tz) { foreach ($z in $tz) { $c = ($z.CurrentTemperature - 2732) / 10; Write-Host ('Suhu Area Sensor : ' + $c + ' derajat Celcius') -ForegroundColor Green } } else { Write-Host 'Pembacaan sensor suhu diblokir oleh BIOS / tidak didukung sistem bawaan.' -ForegroundColor Red }"
echo.
echo ===================================================
pause
goto MENU

:SCAN_DRIVER
cls
echo ===================================================
echo SCAN HARDWARE TANPA DRIVER (BERMASALAH)
echo ===================================================
echo.
echo Mencari perangkat keras yang tidak dikenali atau error...
echo.
powershell -command "Get-CimInstance Win32_PnPEntity | Where-Object { $_.ConfigManagerErrorCode -ne 0 } | Select-Object Name, DeviceID, Status | Format-Table -AutoSize"
echo.
echo ===================================================
pause
goto MENU

:UPDATE_DRIVER
cls
echo ===================================================
echo UPDATE DRIVER OTOMATIS (VIA WINDOWS UPDATE)
echo ===================================================
echo.
echo [1/2] Memindai perubahan hardware (Plug and Play)...
pnputil /scan-devices
echo.
echo [2/2] Membuka modul Windows Update...
echo.
echo Jendela pengaturan Windows Update akan terbuka.
echo Pastikan komputer terkoneksi internet, lalu klik 
echo tombol "Check for updates" atau periksa bagian 
echo "View optional updates" untuk menginstal driver.
echo ===================================================
start ms-settings:windowsupdate-action
pause
goto MENU

:RESET_PASS
cls
echo ===================================================
echo RESET PASSWORD USER (AKUN LOKAL)
echo ===================================================
echo.
echo Daftar Akun User di komputer ini:
net user
echo.
set /p nama_user="Ketik nama user yang ingin direset (contoh: admin): "
set /p pass_baru="Ketik password baru (atau biarkan kosong lalu tekan Enter): "
echo.

if "%pass_baru%"=="" (
    net user "%nama_user%" ""
    echo Password untuk %nama_user% berhasil dihapus (dikosongkan).
) else (
    net user "%nama_user%" "%pass_baru%"
    echo Password untuk %nama_user% berhasil diubah.
)
echo.
pause
goto MENU

:ADMIN_ACCOUNT
cls
echo ===================================================
echo ENABLE / DISABLE SUPER ADMINISTRATOR BAWAAN
echo ===================================================
echo.
echo Status Akun Administrator saat ini:
net user administrator | findstr /i "active aktif"
echo.
echo [1] Aktifkan (Enable) Akun Administrator
echo [2] Nonaktifkan (Disable) Akun Administrator
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_admin="Pilih aksi (0/1/2): "

if "%aksi_admin%"=="1" (
    echo.
    net user administrator /active:yes
    echo Akun Super Administrator berhasil DIAKTIFKAN.
    echo (Kini akun tersebut akan muncul di layar Login Windows).
) else if "%aksi_admin%"=="2" (
    echo.
    net user administrator /active:no
    echo Akun Super Administrator berhasil DINONAKTIFKAN.
) else (
    goto MENU
)
echo.
pause
goto MENU

:REPAIR_WINDOWS
cls
echo ===================================================
echo REPAIR WINDOWS (SFC ^& DISM)
echo ===================================================
echo.
echo PENTING: Proses ini membutuhkan waktu 15-45 menit
echo dan PC harus terhubung ke Internet untuk DISM.
echo Jangan tutup jendela saat proses berjalan!
echo.
echo [1] Jalankan SFC Scan Saja (Cek File Sistem)
echo [2] Jalankan DISM Saja (Perbaiki Image Windows)
echo [3] Jalankan Keduanya (Rekomendasi Terbaik)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_repair="Pilih mode (0/1/2/3): "

if "%aksi_repair%"=="1" goto RUN_SFC
if "%aksi_repair%"=="2" goto RUN_DISM
if "%aksi_repair%"=="3" goto RUN_BOTH
goto MENU

:RUN_SFC
echo.
echo Memulai System File Checker (SFC)...
sfc /scannow
echo.
pause
goto MENU

:RUN_DISM
echo.
echo Memulai DISM RestoreHealth...
dism /online /cleanup-image /restorehealth
echo.
pause
goto MENU

:RUN_BOTH
echo.
echo [1/2] Memulai System File Checker (SFC)...
sfc /scannow
echo.
echo [2/2] Memulai DISM RestoreHealth...
dism /online /cleanup-image /restorehealth
echo.
echo Proses perbaikan selesai! Disarankan untuk Restart PC.
echo.
pause
goto MENU

:REPAIR_NET
cls
echo ===================================================
echo REPAIR .NET FRAMEWORK
echo ===================================================
echo.
echo Memperbaiki error aplikasi yang gagal dibuka akibat .NET.
echo.
echo [1] Reset via Windows Features (Offline)
echo [2] Download ^& Run Official .NET Repair Tool (Online)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_net="Pilih mode (0/1/2): "

if "%aksi_net%"=="1" (
    echo.
    echo Membuka modul Windows Features...
    echo Tips: Hapus centang pada ".NET Framework", klik OK, Restart PC.
    echo Setelah restart, jalankan menu ini lagi dan centang kembali.
    start OptionalFeatures.exe
) else if "%aksi_net%"=="2" (
    echo.
    echo Mengunduh Microsoft .NET Repair Tool ke folder Temp...
    curl -L -o "%TEMP%\NetFxRepairTool.exe" "https://download.microsoft.com/download/2/B/9/2B9BC455-A34E-411F-83BE-F871578330D0/NetFxRepairTool.exe"
    echo.
    echo Menjalankan aplikasi...
    start "" "%TEMP%\NetFxRepairTool.exe"
) else (
    goto MENU
)
echo.
pause
goto MENU

:RESET_FIREWALL
cls
echo ===================================================
echo RESET WINDOWS FIREWALL KE PENGATURAN AWAL
echo ===================================================
echo.
echo PERHATIAN: Semua aturan (rules) pengecualian khusus
echo yang pernah dibuat oleh aplikasi akan dihapus.
echo.
echo [1] Lanjutkan Reset Firewall
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_fw="Pilih aksi (0/1): "

if "%aksi_fw%"=="1" (
    echo.
    echo Mereset Windows Defender Firewall...
    netsh advfirewall reset
    echo.
    echo Selesai! Firewall telah kembali ke pengaturan default pabrik.
) else (
    goto MENU
)
echo.
pause
goto MENU

:REMOTE_DESKTOP
cls
echo ===================================================
echo ENABLE / DISABLE REMOTE DESKTOP (RDP)
echo ===================================================
echo.
echo [1] Aktifkan (Enable) Remote Desktop
echo [2] Nonaktifkan (Disable) Remote Desktop
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_rdp="Pilih aksi (0/1/2): "

if "%aksi_rdp%"=="1" (
    echo.
    echo Mengubah Registry untuk MENGAKTIFKAN RDP...
    reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f
    echo Membuka jalur Firewall untuk RDP...
    netsh advfirewall firewall set rule group="remote desktop" new enable=Yes >nul 2>&1
    echo.
    echo Selesai! Komputer ini sekarang bisa diremote.
) else if "%aksi_rdp%"=="2" (
    echo.
    echo Mengubah Registry untuk MEMATIKAN RDP...
    reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 1 /f
    echo Menutup jalur Firewall untuk RDP...
    netsh advfirewall firewall set rule group="remote desktop" new enable=No >nul 2>&1
    echo.
    echo Selesai! Akses Remote Desktop telah ditutup.
) else (
    goto MENU
)
echo.
pause
goto MENU

:BACKUP_REGISTRY
cls
echo ===================================================
echo BACKUP WINDOWS REGISTRY (HKLM ^& HKCU)
echo ===================================================
echo.
echo Menyiapkan folder backup di Desktop...
set "FOLDER_BACKUP=%USERPROFILE%\Desktop\Registry_Backup"
if not exist "%FOLDER_BACKUP%" mkdir "%FOLDER_BACKUP%"
echo.
echo [1/2] Menyimpan HKEY_CURRENT_USER (Pengaturan User)...
reg export HKCU "%FOLDER_BACKUP%\Backup_HKCU.reg" /y
echo.
echo [2/2] Menyimpan HKEY_LOCAL_MACHINE (Pengaturan Sistem)...
echo (Proses ini memakan waktu agak lama, mohon bersabar)
reg export HKLM "%FOLDER_BACKUP%\Backup_HKLM.reg" /y
echo.
echo ===================================================
echo PROSES SELESAI!
echo File backup reg telah aman disimpan di folder: 
echo %FOLDER_BACKUP%
echo ===================================================
pause
goto MENU

:UNINSTALL_APP
cls
echo ===================================================
echo UNINSTALL PROGRAM / APLIKASI
echo ===================================================
echo.
echo [1] Buka Control Panel Lama (Programs and Features)
echo [2] Buka Windows Settings Modern (Installed Apps)
echo [3] Uninstall via Winget (Mode CLI / Silent)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_uninst="Pilih mode (0/1/2/3): "

if "%aksi_uninst%"=="1" (
    echo.
    echo Membuka appwiz.cpl...
    start appwiz.cpl
) else if "%aksi_uninst%"=="2" (
    echo.
    echo Membuka ms-settings:appsfeatures...
    start ms-settings:appsfeatures
) else if "%aksi_uninst%"=="3" (
    echo.
    echo Menampilkan daftar aplikasi yang terinstal...
    winget list
    echo.
    set /p nama_app="Ketik ID aplikasi dari daftar di atas (contoh: Mozilla.Firefox): "
    echo.
    winget uninstall --id "!nama_app!" -e
) else (
    goto MENU
)
echo.
pause
goto MENU

:SHUTDOWN_TIMER
cls
echo ===================================================
echo SHUTDOWN / RESTART TIMER
echo ===================================================
echo.
echo [1] Shutdown PC dengan Timer
echo [2] Restart PC dengan Timer
echo [3] Batalkan Timer (Cancel)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_power="Pilih aksi (0/1/2/3): "

if "%aksi_power%"=="1" goto SET_SHUTDOWN
if "%aksi_power%"=="2" goto SET_RESTART
if "%aksi_power%"=="3" goto CANCEL_TIMER
goto MENU

:SET_SHUTDOWN
echo.
set /p waktu="Masukkan waktu mundur dalam DETIK (contoh: 3600 untuk 1 jam): "
shutdown /s /t %waktu%
echo.
echo Selesai! Komputer akan SHUTDOWN dalam %waktu% detik.
pause
goto MENU

:SET_RESTART
echo.
set /p waktu="Masukkan waktu mundur dalam DETIK (contoh: 3600 untuk 1 jam): "
shutdown /r /t %waktu%
echo.
echo Selesai! Komputer akan RESTART dalam %waktu% detik.
pause
goto MENU

:CANCEL_TIMER
echo.
shutdown /a
echo.
echo Selesai! Semua jadwal Shutdown/Restart telah dibatalkan.
pause
goto MENU

:DOWNLOAD_PRINTER
cls
echo ===================================================
echo DOWNLOAD DRIVER PRINTER (OFFICIAL SITES)
echo ===================================================
echo.
echo Pilih merek printer untuk membuka web resminya:
echo [1] Epson (epson.co.id)
echo [2] Canon (id.canon)
echo [3] HP (support.hp.com)
echo [4] Brother (support.brother.com)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_printer="Pilih merek (0/1/2/3/4): "

if "%aksi_printer%"=="1" (
    echo Membuka situs resmi Epson...
    start https://www.epson.co.id/Support/Printers/sh/s1
) else if "%aksi_printer%"=="2" (
    echo Membuka situs resmi Canon...
    start https://id.canon/id/support
) else if "%aksi_printer%"=="3" (
    echo Membuka situs resmi HP...
    start https://support.hp.com/id-en/drivers/printers
) else if "%aksi_printer%"=="4" (
    echo Membuka situs resmi Brother...
    start https://support.brother.com/g/b/countrytop.aspx?c=id^&lang=en
) else (
    goto MENU
)
echo.
pause
goto MENU

:SHARE_PRINTER
cls
echo ===================================================
echo SHARE / UNSHARE PRINTER KE JARINGAN LOKAL
echo ===================================================
echo.
echo Daftar Printer di Komputer Ini:
powershell -command "Get-Printer | Select-Object Name, Shared, ShareName | Format-Table -AutoSize"
echo.
echo [1] Share Printer (Bagikan)
echo [2] Unshare Printer (Berhenti Bagikan)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_share="Pilih aksi (0/1/2): "

if "%aksi_share%"=="1" (
    echo.
    set /p nama_printer="Ketik 'Name' printer persis seperti tabel di atas: "
    set /p nama_share="Ketik nama Share baru (bebas, disarankan tanpa spasi): "
    powershell -command "Set-Printer -Name '%nama_printer%' -Shared $true -ShareName '%nama_share%'"
    echo.
    echo Selesai! Printer '%nama_printer%' telah di-share dengan nama '%nama_share%'.
) else if "%aksi_share%"=="2" (
    echo.
    set /p nama_printer="Ketik 'Name' printer yang ingin di-unshare: "
    powershell -command "Set-Printer -Name '%nama_printer%' -Shared $false"
    echo.
    echo Selesai! Printer '%nama_printer%' berhenti dibagikan.
) else (
    goto MENU
)
echo.
pause
goto MENU

:CONNECT_PRINTER
cls
echo ===================================================
echo CONNECT KE SHARED PRINTER (VIA IP ADDRESS)
echo ===================================================
echo.
echo Pastikan komputer target (Print Server) dalam keadaan
echo menyala, tidak sleep, dan satu jaringan (LAN/WiFi).
echo.
set /p ip_server="Ketik IP Address komputer server (contoh: 192.168.1.10): "
set /p nama_share="Ketik Nama Share Printer (contoh: KasirEpson): "
echo.
echo Mencoba terhubung ke \\%ip_server%\%nama_share% ...
echo (Mohon tunggu, proses instalasi berjalan di latar belakang)
echo.
rundll32 printui.dll,PrintUIEntry /in /n "\\%ip_server%\%nama_share%"
echo.
echo Perintah eksekusi telah dikirim ke sistem!
echo Jika berhasil, tidak ada pesan error yang muncul dan
echo printer akan masuk ke daftar 'Devices and Printers'.
echo ===================================================
pause
goto MENU

:LIST_PRINTER
cls
echo ===================================================
echo DAFTAR PRINTER DAN STATUS SAAT INI
echo ===================================================
echo.
echo Mengambil data dari sistem (mohon tunggu sebentar)...
echo.
powershell -command "Get-Printer | Select-Object Name, PrinterStatus, PortName, Shared | Format-Table -AutoSize"
echo.
echo ===================================================
echo Keterangan Status:
echo Normal / Ready = Printer siap digunakan.
echo Offline        = Printer mati atau kabel/WiFi terputus.
echo Error          = Ada masalah fisik (kertas macet, tinta habis).
echo ===================================================
pause
goto MENU

:CLEAR_SPOOLER
cls
echo ===================================================
echo CLEAR PRINT QUEUE / SPOOLER (RESET PRINTER MACET)
echo ===================================================
echo.
echo [1/3] Menghentikan layanan Print Spooler...
net stop spooler
echo.
echo [2/3] Menghapus file antrean cetak yang nyangkut...
del /Q /F /S "%systemroot%\System32\Spool\Printers\*.*"
echo.
echo [3/3] Menjalankan kembali layanan Print Spooler...
net start spooler
echo.
echo ===================================================
echo Selesai! Antrean printer sudah bersih.
echo Silakan minta user mencoba mencetak kembali.
echo ===================================================
pause
goto MENU

:SET_DEFAULT_PRINTER
cls
echo ===================================================
echo SET DEFAULT PRINTER UTAMA
echo ===================================================
echo.
echo [1/3] Mematikan auto-manage printer bawaan Windows...
reg add "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v LegacyDefaultPrinterMode /t REG_DWORD /d 1 /f >nul
echo.
echo [2/3] Daftar Printer di Komputer Ini:
powershell -command "Get-Printer | Select-Object Name, PrinterStatus | Format-Table -AutoSize"
echo.
set /p nama_printer="[3/3] Ketik persis 'Name' printer untuk dijadikan Default: "
echo.
rundll32 printui.dll,PrintUIEntry /y /n "%nama_printer%"
echo Selesai! Printer '%nama_printer%' kini menjadi perangkat cetak utama.
echo ===================================================
pause
goto MENU

:RESTART_SPOOLER
cls
echo ===================================================
echo RESTART PRINT SPOOLER SERVICE (TANPA HAPUS ANTREAN)
echo ===================================================
echo.
echo [1/2] Menghentikan layanan Print Spooler...
net stop spooler
echo.
echo [2/2] Menjalankan kembali layanan Print Spooler...
net start spooler
echo.
echo ===================================================
echo Selesai! Layanan berhasil disegarkan (Restarted).
echo ===================================================
pause
goto MENU

:CLOSE_PRINT_QUEUE
cls
echo ===================================================
echo CLOSE PRINT QUEUE (TUTUP PAKSA JENDELA ANTREAN)
echo ===================================================
echo.
echo Menutup paksa proses dan jendela antrean cetak yang hang...
echo.
taskkill /F /IM splwow64.exe /T >nul 2>&1
taskkill /F /IM printui.exe /T >nul 2>&1
taskkill /F /IM printfilterpipelinesvc.exe /T >nul 2>&1
taskkill /F /IM printisolationhost.exe /T >nul 2>&1
echo.
echo ===================================================
echo Selesai! Semua antarmuka printer yang nyangkut
echo telah dihentikan secara paksa dari memori.
echo ===================================================
pause
goto MENU

:BACKUP_PRINTER
cls
echo ===================================================
echo BACKUP ^& RESTORE PENGATURAN PRINTER
echo ===================================================
echo.
echo Alat ini akan mencadangkan/mengembalikan semua
echo driver, port, dan antrean printer di komputer ini.
echo.
echo [1] Backup Printer ke Desktop
echo [2] Restore Printer dari Desktop
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_brm="Pilih aksi (0/1/2): "

set "FILE_BACKUP=%USERPROFILE%\Desktop\PrinterBackup.printerExport"

if "%aksi_brm%"=="1" (
    echo.
    echo Memulai proses Backup... (Mungkin memakan waktu)
    cd /d "%WINDIR%\System32\Spool\Brm"
    PrintBrm.exe -b -s \\%COMPUTERNAME% -f "%FILE_BACKUP%"
    echo.
    echo Selesai! File backup telah disimpan di:
    echo %FILE_BACKUP%
) else if "%aksi_brm%"=="2" (
    echo.
    if not exist "%FILE_BACKUP%" (
        echo ERROR: File backup tidak ditemukan di Desktop!
        echo Pastikan file "PrinterBackup.printerExport" ada di Desktop.
    ) else (
        echo Memulai proses Restore... (Mungkin memakan waktu)
        cd /d "%WINDIR%\System32\Spool\Brm"
        PrintBrm.exe -r -s \\%COMPUTERNAME% -f "%FILE_BACKUP%"
        echo.
        echo Selesai! Semua printer telah berhasil dikembalikan.
    )
) else (
    goto MENU
)
echo.
pause
goto MENU

:INSTALL_TOMCAT
cls
echo ===================================================
echo INSTALL TOMCAT - ICHA PRINT SERVER (FULL SETUP)
echo ===================================================
echo.
echo Script ini akan menyiapkan Environment Web Server lokal.
echo Pastikan file Tomcat (.zip) atau ichaprint.war sudah Anda miliki.
echo.
echo [1] Mulai Setup (Cek Java, Buat Folder, Buka Port 8080)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_tomcat="Pilih aksi (0/1): "

if "%aksi_tomcat%"=="1" (
    echo.
    echo [1/3] Memeriksa ketersediaan Java Runtime (JRE/JDK)...
    java -version >nul 2>&1
    if errorlevel 1 (
        echo [ERROR] Java tidak terdeteksi di sistem ini!
        echo Tomcat membutuhkan Java. Menghentikan proses instalasi...
        echo Silakan instal Java terlebih dahulu.
        pause
        goto MENU
    )
    echo [OK] Mesin Java terdeteksi.
    echo.
    echo [2/3] Menyiapkan direktori server di C:\Tomcat_IchaPrint...
    if not exist "C:\Tomcat_IchaPrint" mkdir "C:\Tomcat_IchaPrint"
    echo Direktori C:\Tomcat_IchaPrint telah disiapkan.
    echo.
    echo [3/3] Konfigurasi Firewall untuk Port 8080 (HTTP)...
    netsh advfirewall firewall add rule name="Icha Print Server (Port 8080)" dir=in action=allow protocol=TCP localport=8080 >nul
    echo Port 8080 berhasil dibuka untuk jaringan lokal.
    echo.
    echo ===================================================
    echo SETUP LINGKUNGAN SERVER BERHASIL!
    echo ===================================================
    echo Langkah selanjutnya:
    echo 1. Ekstrak folder Apache Tomcat ke C:\Tomcat_IchaPrint
    echo 2. Copy file 'ichaprint.war' ke dalam folder \webapps\
    echo 3. Jalankan 'startup.bat' di dalam folder \bin\
    echo ===================================================
) else (
    goto MENU
)
echo.
pause
goto MENU

:CEK_PORT_8080
cls
echo ===================================================
echo CEK STATUS PORT 8080 (ICHA PRINT SERVER)
echo ===================================================
echo.
echo Menjalankan Netstat untuk mencari Port 8080...
echo.
echo PROTO  LOCAL ADDRESS          FOREIGN ADDRESS        STATE           PID
netstat -ano | findstr :8080
echo.
echo ===================================================
echo KETERANGAN STATUS:
echo LISTENING   = Server berjalan normal dan siap menerima koneksi.
echo CLOSE_WAIT  = Koneksi terputus/nyangkut (butuh restart server).
echo (Kosong)    = Server Tomcat mati / belum dijalankan.
echo.
echo Tips: Jika status LISTENING, komputer kasir bisa mengakses via:
echo http://(IP_Server_Ini):8080/ichaprint
echo ===================================================
pause
goto MENU

:UNINSTALL_TOMCAT
cls
echo ===================================================
echo UNINSTALL TOMCAT ICHA PRINT (CLEAN WIPE)
echo ===================================================
echo.
echo PERINGATAN: Proses ini akan menghapus paksa seluruh
echo folder C:\Tomcat_IchaPrint beserta database di dalamnya,
echo dan menutup kembali jalur Port 8080 di Firewall.
echo.
echo [1] Lanjutkan Uninstall Bersih
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_un_tomcat="Pilih aksi (0/1): "

if "%aksi_un_tomcat%"=="1" (
    echo.
    echo [1/3] Menghentikan proses Java/Tomcat di latar belakang...
    taskkill /F /IM java.exe /T >nul 2>&1
    echo.
    echo [2/3] Menghapus rule Windows Firewall untuk Port 8080...
    netsh advfirewall firewall delete rule name="Icha Print Server (Port 8080)" >nul 2>&1
    echo.
    echo [3/3] Menghapus direktori C:\Tomcat_IchaPrint secara permanen...
    rmdir /s /q "C:\Tomcat_IchaPrint" >nul 2>&1
    echo.
    echo ===================================================
    echo SELESAI! Tomcat Icha Print telah bersih dari sistem.
    echo ===================================================
) else (
    goto MENU
)
echo.
pause
goto MENU

:POST_INSTALL_APPS
cls
echo ===================================================
echo AUTO INSTALL APLIKASI DASAR (VIA WINGET)
echo ===================================================
echo.
echo Pastikan komputer terhubung ke internet!
echo Script ini akan mengunduh dan menginstal aplikasi
echo secara otomatis di latar belakang (Silent Install).
echo.
echo [1] Install Paket Standar (Chrome, Firefox, WinRAR, VLC)
echo [2] Install Office (LibreOffice - Gratis/Open Source)
echo [3] Custom (Ketik ID Aplikasi Manual)
echo [0] Batal / Kembali ke Menu Utama
echo.
set /p aksi_install="Pilih paket instalasi (0/1/2/3): "

if "%aksi_install%"=="1" goto INST_STANDAR
if "%aksi_install%"=="2" goto INST_OFFICE
if "%aksi_install%"=="3" goto INST_CUSTOM
goto MENU

:INST_STANDAR
echo.
echo Memulai instalasi Paket Standar...
echo Menginstal Google Chrome...
winget install --id Google.Chrome -e --silent --accept-package-agreements --accept-source-agreements
echo Menginstal Mozilla Firefox...
winget install --id Mozilla.Firefox -e --silent --accept-package-agreements --accept-source-agreements
echo Menginstal WinRAR...
winget install --id RARLab.WinRAR -e --silent --accept-package-agreements --accept-source-agreements
echo Menginstal VLC Media Player...
winget install --id VideoLAN.VLC -e --silent --accept-package-agreements --accept-source-agreements
echo.
echo Selesai! Semua aplikasi standar berhasil diinstal.
pause
goto MENU

:INST_OFFICE
echo.
echo Menginstal LibreOffice...
winget install --id TheDocumentFoundation.LibreOffice -e --silent --accept-package-agreements --accept-source-agreements
echo.
echo Selesai! Office gratis siap digunakan.
pause
goto MENU

:INST_CUSTOM
echo.
echo Silakan cari ID aplikasi terlebih dahulu di web:
echo https://winget.run
echo.
set /p app_id="Ketik ID Aplikasi Winget (contoh: Zoom.Zoom): "
winget install --id %app_id% -e --silent --accept-package-agreements --accept-source-agreements
echo.
echo Selesai mengeksekusi instalasi %app_id%!
pause
goto MENU

:KELUAR
exit