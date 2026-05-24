# secure-network-architecture

![Screenshot](https://github.com/sprokkel78/secure-network-architecture/blob/main/secure-network-architecture.png)

The linux vpn gateway uses the router as gateway, the rest of the lan connected to the router uses the linux vpn servers ip address as gateway.

Upnp must be disabled on the router. No external open ports on the linux gateway!!

For secure access to your network from the outside, use MESHNET. (With NordVPN meshnet breaks the linux gateway to the lan (it's a bug) so you must use MESHNET on a different machine on the lan. With ssh-tunneling you can access all your hardware on your lan.

Actually you need this setup twice. One for your internet network and one for you phone to keep them separated.

Watch out for trojans, do your checksums on your downloads.
