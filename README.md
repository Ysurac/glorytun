# Glorytun

Glorytun is a small, simple and secure VPN over [mud](https://github.com/angt/mud).

Please visit the [wiki](https://github.com/angt/glorytun/wiki) for how-to guides, tutorials, etc.

## Compatibility

Glorytun only depends on [libsodium](https://github.com/jedisct1/libsodium) version >= 1.0.4.
Which can be installed on a wide variety of systems.

Linux is the platform of choice but the code is standard so it should be easily ported on other posix systems.
It was successfully tested on OpenBSD, FreeBSD and MacOS.

IPv4 and IPv6 are supported.
On Linux you can have both at the same time by binding `::`.

## Features

The key features of Glorytun come directly from mud:

 * **Fast and highly secure**

   The use of UDP and libsodium allows you to secure your communications without impacting performance.
   Glorytun uses AEGIS-256 (a new and very fast AEAD construction) only if AES-NI is available otherwise ChaCha20-Poly1305 is used.
   Of course, you can force the use of ChaCha20-Poly1305 for higher security.
   All messages are encrypted, authenticated and timestamped to mitigate a large set of attacks.
   Perfect forward secrecy is also implemented with ECDH over Curve25519. Keys are rotated every hours.

 * **Multipath and active failover**

   Connectivity is now crucial, especially in the SD-WAN world.
   This feature allows a TCP connection (and all other protocols) to explore and exploit all available links without being disconnected.
   Aggregation should work on all conventional links, only very high latency (+500ms) links are not recommended for now.

 * **Traffic shaping**

   Shaping is very important in network, it allows to keep a low latency without sacrificing the bandwidth.
   It also helps the multipath scheduler to make better decisions.
   Currently it must be configured by hand, but soon Glorytun will do it for you.

 * **Path MTU discovery without ICMP**

   Bad MTU configuration is a very common problem in the world of VPN.
   As it is critical, Glorytun will try to setup it correctly by guessing its value.
   It doesn't rely on Next-hop MTU to avoid ICMP black holes.
   In asymmetric situations the minimum MTU is selected.

## Caveats

Glorytun is strongly secure by default and protects against replay attacks,
the clock between the client and the server must be synchronized.
By default, an offset of 10min is accepted.


---

For feature requests and bug reports, please create an [issue](https://github.com/angt/glorytun/issues).
