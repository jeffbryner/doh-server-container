# doh-server-container
a container for https://github.com/DNSCrypt/doh-server

## Build

```bash
docker build -t doh-server-container:latest .
```

## Run

```bash
docker run --rm -p3000:3000 doh-server-container
```

## Test

Run the container in one session via:

```bash
docker run --rm -p3000:3000 doh-server-container
```

In another session, test via curl

```bash
curl -s -H 'accept: application/dns-message' 'http://localhost:3000/dns-query?dns=rmUBAAABAAAAAAAAB2NhcmVlcnMHb3BlbmRucwNjb20AAAEAAQ' | hexdump -C
00000000  ae 65 81 80 00 01 00 01  00 00 00 01 07 63 61 72  |.e...........car|
00000010  65 65 72 73 07 6f 70 65  6e 64 6e 73 03 63 6f 6d  |eers.opendns.com|
00000020  00 00 01 00 01 c0 0c 00  01 00 01 00 00 0e 10 00  |................|
00000030  04 d0 43 da 02 00 00 29  04 d0 00 00 00 00 00 04  |..C....)........|
00000040  00 0c 00 00                                       |....|
00000044
```


## References

RFC
https://datatracker.ietf.org/doc/html/rfc8484

Query examples
https://support.opendns.com/hc/en-us/articles/360038463251-Querying-OpenDNS-using-DoH-for-developers-

Firefox
https://wiki.mozilla.org/Trusted_Recursive_Resolver
https://support.mozilla.org/en-US/kb/firefox-dns-over-https

