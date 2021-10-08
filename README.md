# nmap

simples script para nmap para detectar Path Traversal

cp cve-2021-41773.nse /usr/share/nmap/scripts/

Uso.:

Por ejemplo:

nmap <IP> -Pn -p80,443 -sVC --script=cve-2021-41773.nse
