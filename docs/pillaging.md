# Pillaging

## [⬅ Back to Index](../README.md)

---

## General

### MSF

* **Keylogging**
  * `keyscan_start`
  * `keyscan_dump` - Dump all captured
  * >todo
* **Gather live hosts on netblock**
  * `use post/multi/gather/ping_sweep`
  * `use post/windows/gather/arp_scanner` (Win Beacon)
    * `run arp_scanner -r x.x.x.x/24`

### Spoofing

* Enable port forward - `echo 1 > /proc/sys/net/ipv4/ip_forward`
* Use `arpspoof`, `bettercap`, or `ettercap`

### Shares

* CIFS mount - `mount -t cifs //<ip>/share /mnt/lolz -o rw,vers=1.0,user=<user>,password=<password>`

## Windows

### Powershell Empire

* [PowerSploit - PowerView](https://github.com/PowerShellMafia/PowerSploit/tree/master/Recon)
  * `Get-NetComputer` / `Get-NetComputers -full`
  * `Get-NetShare`
  * `Get-NetUser`

### MSF (Win)

* Auto enum - `run winenum`
* Privs - `run post/windows/gather/win_privs`

### Windows - Other Scripts / Git Resources

* SessionGopher (WMI methods of gathering session info) - <https://github.com/Arvanaghi/SessionGopher>

## Linux

### MSF (Linux)

### Linux - Other Scripts / Git Resources

* [3snake (Gather creds from new processes)](https://github.com/blendin/3snake)