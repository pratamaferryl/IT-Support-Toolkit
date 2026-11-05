# 🛠️ IT Support Toolkit v2.3 Universal

[![Platform](https://img.shields.io/badge/Platform-Windows%2010%20%7C%2011-blue.svg)](#)
[![Script](https://img.shields.io/badge/Script-Batch%20%2F%20PowerShell-green.svg)](#)
[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-brightgreen.svg)](#)

**IT Support Toolkit** adalah alat otomatisasi berbasis *Command Line Interface* (CLI) komprehensif yang dirancang khusus untuk mempercepat alur kerja harian *IT Support* dan *System Administrator*. Skrip ini merangkum puluhan utilitas pemecahan masalah sistem, manajemen jaringan, hingga peluncuran server lokal ke dalam satu antarmuka interaktif yang ringan dan efisien.

---

## 🎯 Mengapa Toolkit Ini Dibuat?
Menghadapi *troubleshooting* PC pengguna atau melakukan *setup* perangkat baru (*post-install*) sering kali memakan waktu berjam-jam jika dilakukan secara manual melalui GUI. Toolkit ini diciptakan untuk memangkas waktu diagnosis dan perbaikan dengan mengeksekusi *command* tingkat lanjut (seperti `netsh`, `sfc`, `dism`, dan `winget`) secara otomatis melalui 36 menu pilihan yang terstruktur rapi.

## 🚀 Fitur Utama (36 Modul Terintegrasi)

### 🌐 1. Network & System Diagnostics
* Pemantauan stabilitas koneksi ping dan informasi antarmuka jaringan (*Network Interface*).
* Eksekusi *Flush DNS*, perpanjangan IP (Renew), dan *Winsock Reset* dalam satu klik.
* Pembersihan berkas *Temporary* tingkat sistem dan diagnostik kesehatan *Harddisk* (`chkdsk`).

### 🔧 2. Driver & User Account Management
* Pemindaian perangkat keras kritis yang kehilangan *driver*.
* Fitur pembaruan *driver* otomatis terintegrasi.
* Manajemen hak akses (*Enable/Disable Admin Account*) dan *reset password* pengguna lokal.

### 🛠️ 3. Windows Repair & Utilities
* Perbaikan instan integritas berkas sistem yang korup (*Corrupted System Files*) menggunakan kombinasi `SFC /scannow` dan `DISM`.
* Pencadangan dan pemulihan *Registry* (`HKLM` & `HKCU`) yang aman sebelum melakukan modifikasi sistem.
* Konfigurasi akses *Remote Desktop* (RDP) dan manajemen *Windows Firewall*.

### 🖨️ 4. Printer Configuration & Spooler Management
* Modul lengkap pengelolaan *sharing* printer jaringan dan pemantauan status *real-time*.
* Pembersihan instan antrean cetak (*Clear Print Queue*) dan *restart* layanan *Spooler* tanpa perlu membuka `services.msc`.
* Migrasi dan pencadangan konfigurasi printer yang efisien.

### ☕ 5. Tomcat Server Automation (Icha Print)
* Otomatisasi instalasi dan *clean-uninstall* lingkungan *web server* Tomcat.
* Pemantauan lalu lintas peladen lokal pada Port 8080 secara interaktif.

### 📦 6. Post Install Automation (Winget)
* Instalasi aplikasi esensial (Google Chrome, Firefox, WinRAR, LibreOffice, dll.) secara *silent* di latar belakang tanpa kotak dialog persetujuan (bebas *bloatware*).

---

## 💻 Prasyarat Sistem
* OS: Windows 10 (Build 1809 ke atas) atau Windows 11.
* Hak Akses: **Wajib dijalankan sebagai Administrator** (*Run as administrator*).
* Koneksi internet aktif (khusus untuk modul *Post Install* / `winget`).

## ⚙️ Cara Penggunaan
1. Unduh atau *clone* repositori ini ke komputer target:
   ```bash
   git clone [https://github.com/pratamaferryl/IT-Support-Toolkit.git](https://github.com/pratamaferryl/IT-Support-Toolkit.git)