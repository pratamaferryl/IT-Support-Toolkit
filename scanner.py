import socket
import sys
from datetime import datetime

# Banner ASCII Art
banner = """
   _____       __                 
  / ___/__  __/ /_  ___  _____    
  \__ \/ / / / __ \/ _ \/ ___/    
 ___/ / /_/ / /_/ /  __/ /        
/____/\__, /_.___/\___/_/         
     /____/  P O R T  S C A N N E R
"""

print(banner)
print("=" * 50)
target = input("[?] Masukkan IP Target WSL (contoh 172.29.20.15): ")
print("=" * 50)
print(f"[*] Memindai target : {target}")
print(f"[*] Waktu mulai   : {datetime.now()}")
print("=" * 50)

try:
    for port in range(20, 60): # Memindai port 20 sampai 59
        sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
        socket.setdefaulttimeout(0.1)
        result = sock.connect_ex((target, port))
        
        if result == 0:
            print(f"[+] Port {port:<5} : TERBUKA")
        sock.close()

except KeyboardInterrupt:
    print("\n[-] Dihentikan manual.")
    sys.exit()
except socket.error:
    print("\n[-] Gagal terhubung.")
    sys.exit()

print("=" * 50)
print("[*] Pemindaian selesai!")