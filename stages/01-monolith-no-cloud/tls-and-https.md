# TLS, HTTPS and certificates

- **SSL** is deprecated (SSL 3.0 in 2015). **TLS** replaced it. People still say "SSL" out of habit.
- **HTTPS** is HTTP carried over TLS.
- **Versions:** TLS 1.2 is widely supported, 1.3 is current. 1.0 and 1.1 are deprecated.
- **TLS** is the protocol. The **certificate** is the document (X.509): domain names (CN/SAN), public key, issuer (CA), validity dates, signature.
- **CA:** a trusted authority that verifies domain control and signs the certificate. The signature proves the cert was issued by that CA. Browsers trust a built-in list of CAs.
- **Self-signed cert:** signed by yourself, so browsers warn unless the cert is trusted manually (for example with mkcert).

## Keys: how it really works
- The certificate holds the **public key**. The server keeps the **private key** secret.
- During the handshake the server proves it owns the private key, and both sides agree a **session key** (in TLS 1.3 through ephemeral Diffie-Hellman).
- The actual page data is encrypted with that **symmetric** session key (for example AES), because it is much faster than public-key encryption.
- Private key locations: `/etc/ssl/private/` (Debian/Ubuntu), `/etc/pki/tls/private/` (RHEL). Permissions should be restrictive (600).

## SSL termination
The load balancer or reverse proxy decrypts TLS and passes plain HTTP to backends. Alternatives: **passthrough** (backend decrypts) and **re-encrypt** (proxy decrypts, then encrypts again to the backend).

## `/etc/hosts`
Maps names to IPs locally. Lookup order is set in `/etc/nsswitch.conf` (`hosts: files dns`). Browsers and the OS also cache DNS.
