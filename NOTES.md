isync
---

- to use work email, need to download certificate file, else it won't work.
use: 

```
openssl s_client -connect <host>:993 -showcerts 2>&1 < /dev/null | sed
-ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' | sed -ne '1,/-END CERTIFICATE-/p' > ~/<host>.pem
```

(see https://wiki.archlinux.org/title/isync for more info)
