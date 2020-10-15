# Enumeration

## [⬅ Back to Index](../README.md)

---

## General

### RPC

#### Users

* `./scripts/rpc-getusers.sh` - Use list of potential usernames to enumerate existence via RPCclient (Alternative to RID bruteforce)

### SNMP

* Gather targets: `onesixtyone -c /usr/share/seclists/Discovery/SNMP/common-snmp-community-strings.txt <ip>`
* `snmpwalk -v2c -c <community-string> <ip>`
* `snmpenum <ip> <community-string> <server-type>`
  * `<server-type>` Type of:
    * linux.txt
    * windows.txt
    * cisco.txt

### NTLM Relay

* Using crackmapexec (automation)
  * `pip3 install pipx`
  * `pipx ensurepath`
  * `pipx install crackmapexec`
  * `cme smb <cidr> --gen-relay-list lol.txt`
* Responder
  * `edit Responder.conf and disable SMB`
  * `responder -I tun0 -r -d -w`
* NTLM Relay using output
  * `ntlmrelayx.py -tf lol.txt`

### NetBIOS

* Win: `nbtstat -a <ip>`
* Lin: `nmblookup -A <ip>`
* <20> indicates file shares
* `enum4linux -USGPoni <ip>`

## Linux

> todo

## Windows

### MSF

* Applications: `run post/windows/gather/enum_applications`


## Web

`/EyeWitness.py -f urls.txt --web --proxy-ip 127.0.0.1 --proxy-port 8080 --proxy-type socks5 --timeout 120`

### DNS

#### Zone Transfer

* `dig -t AXFR +nocookie <domain> @<ip>`

### Trace route

* Identify gateway
  * `traceroute <ip> -m x`
  * `route` (local)
  * Windows - `winmtr`

### CMS

#### Wordpress

* <https://hackertarget.com/wordpress-security-scan/>
* <https://github.com/wpscanteam/wpscan>

#### Joomla

* <https://hackertarget.com/joomla-security-scan/>

#### Drupal

* <https://hackertarget.com/drupal-security-scan/>
