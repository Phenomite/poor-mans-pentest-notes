# Scanning Notes

## [⬅ Back to Index](../README.md)

---

## ARP

* MSF's `arp_scanner`
* netdiscover - `sudo netdiscover` (requires root)

## MSF

* `use auxiliary/scanner/portscan/tcp`

## Nmap

### [Fast Pre-Nmap Port Scanner - Rustscan](https://github.com/RustScan/RustScan)

**Ref:**

1. [IANA service port assignments](https://www.iana.org/assignments/service-names-port-numbers/service-names-port-numbers.xhtml?search=)
2. [Free Online Scanning at HackerTarget](https://hackertarget.com/nmap-online-port-scanner/)
3. [Port listing on speedguide](https://www.speedguide.net/port.php?port=)

### ICMP Ping Sweep

* `nmap -sn <cidr/ip>`

### TCP Sweep

* `nmap -n -sn -PS22,139,445 <cidr/ip>`

### Preferred initial service ports

* `nmap -p 21,22,23,25,465,587,53,80,8080,443,8443,110,995,111,123,135,137,139,143,993,389,445,1025,1433,2082-2083,2086-2087,3306,3389,5060,5432,5900,6001`

    ```json
    21 - FTP
    22 - SSH
    23 - Telnet
    25 - SMTP
    465 - SMTP SSL
    587 - SMTP TLS
    53 - DNS
    80 - HTTP
    8080 - HTTP Proxy (Webcache)
    443 - HTTP SSL
    8443 - HTTP SSL Alternate
    110 - POP
    995 - POP SSL
    111 - RPC Bind
    123 - NTP
    135 - MS RPC
    137 - NetBIOS Name Service
    139 - NetBIOS Session Service
    143 - IMAP
    993 - IMAP SSL
    389 - LDAP
    445 - MS DS (SMB)
    1433 - MS SQL
    1723 - PPTP
    2082-2083 - CPanel
    2086-2087 - CPanel WHM
    3306 - MySQL
    3389 - RDP
    5060 - SIP
    5432 - PostgreSQL
    5900 - VNC
    6001 - X Window Server
    ```

### Flags

* -Pn = No ping test (force port scan when no ICMP)
* -n = No reverse DNS (dont leak ip)
* -F = Reduced ports in default scan
* -oN = Output normal text to file
* -sV = Version enumeration
* -sC = Attempt script defaults
* -sT = Force TCP rather than SYN which is default when running priveleged
