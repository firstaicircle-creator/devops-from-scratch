# Request lifecycle: browser to monolith (local lab)

Lab name: `https://monolith.test`, Nginx as reverse proxy with a self-signed certificate, app on `127.0.0.1:8000`.

1. **Name resolution:** the OS checks `/etc/hosts` first and maps `monolith.test` to `127.0.0.1`. Lookup order is set in `/etc/nsswitch.conf` (`hosts: files dns`).
2. **TCP connection:** three-way handshake (SYN, SYN-ACK, ACK) to port 443.
3. **TLS handshake:** Nginx presents its certificate (SNI picks the right one). Both sides agree on session keys. Port 443 is only a convention: TLS happens because Nginx is configured for it on that port.
4. **SSL termination:** Nginx decrypts the HTTP request.
5. **Reverse proxy routing:** Nginx matches `server_name` and `location`, then forwards with `proxy_pass http://127.0.0.1:8000`. It adds `Host`, `X-Forwarded-For` and `X-Forwarded-Proto`.
6. **Response:** returns along the same path, encrypted again by Nginx.

## Notes
- Use `.test` or `.localhost` for lab names. `.local` is reserved for mDNS and can cause slow or odd lookups.
- A self-signed cert still encrypts, but the browser warns because it cannot verify identity (mkcert avoids this locally).
- **Stage 02 (Docker):** `proxy_pass` points to a container name on a Docker network instead of `127.0.0.1`.

## Reference
- **OSI:** 7 Application (HTTP, DNS) · 6 Presentation (TLS) · 5 Session · 4 Transport (TCP, UDP) · 3 Network (IP, ICMP) · 2 Data link (Ethernet) · 1 Physical. To verify against my own diagram.
- **ICMP:** type 8 echo request, 0 echo reply (`ping`), 3 destination unreachable, 11 time exceeded (`traceroute`).
- **HTTP codes:** 1xx info, 2xx success, 3xx redirect (301 permanent, 302 temporary), 4xx client error (400, 401 not authenticated, 403 forbidden, 404, 429), 5xx server error (500, 502 bad gateway, 503 unavailable, 504 gateway timeout).

## To add after running the lab
- [ ] `nginx -t` output
- [ ] `curl -vk https://monolith.test` output
- [ ] `openssl s_client -connect monolith.test:443` output
- [ ] What broke and the fix (in LESSONS.md)
