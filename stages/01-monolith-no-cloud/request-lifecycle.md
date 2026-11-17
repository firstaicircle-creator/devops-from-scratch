# Request lifecycle: browser to monolith (local lab)

1. **Name resolution:** the browser asks the OS, which checks `/etc/hosts` first and maps `monolith.test` to `127.0.0.1`.
2. **TCP connection:** three-way handshake to port 443.
3. **TLS handshake:** Nginx presents its certificate (SNI selects the right one). Keys are agreed.
4. **HTTP request:** now encrypted inside TLS. Nginx decrypts it (SSL termination).
5. **Reverse proxy routing:** Nginx matches `server_name` and `location`, then `proxy_pass` to the app (for example `127.0.0.1:8000`). It adds `Host`, `X-Forwarded-For` and `X-Forwarded-Proto`.
6. **Response** returns the same path.

Notes:
- Use `.test` or `.localhost` for lab names. `.local` is reserved for mDNS and can cause slow or odd lookups.
- Port 443 is only a convention for HTTPS. TLS happens because Nginx is configured for it.
- With Docker (Stage 02), `proxy_pass` points to a container name on a Docker network instead.

## HTTP status codes
1xx info, 2xx success, 3xx redirect (301 permanent, 302 temporary), 4xx client error (400, 401 not authenticated, 403 forbidden, 404, 429 too many requests), 5xx server error (500, 502 bad gateway, 503 unavailable, 504 gateway timeout).

## To add
- OSI layers and ICMP tables (images did not copy over).
- Verified commands I ran: nginx config, `curl -v`, `openssl s_client`.
