# secure-network-architecture

![Screenshot](https://github.com/sprokkel78/secure-network-architecture/blob/main/secure-network-architecture.png)

The linux vpn gateway uses the router as gateway, the rest of the lan connected to the router uses the linux vpn servers ip address as gateway.

Upnp must be disabled on the router. No external open ports on the linux gateway!! Use netstat -pltn for an overview.

For secure access to your network from the outside, use MESHNET. (With NordVPN meshnet breaks the linux gateway to the lan (it's a bug) so you must use MESHNET on a different machine on the lan. With ssh-tunneling on the MESHNET machine you can access all your hardware on your lan.

Actually you need this setup twice. One gateway with vpn is used as DNS server for all dns requests, another gateway is used as gateway for the rest of the traffic.  That way they can't return to your system based on dns requests. The second gateway is ip-based only.

Watch out for trojans, do your checksums on your downloads. Keep the repositories safe!

Use killswitch enabled in your VPN app on the linux vpn machine to disable non vpn traffic. No VPN , no Internet. 

Use VPN for 4G on your phone! 

To all software developers: Put your software checksums online!

You can't put personal pictures or videos online anymore. AI can create scenarios out of context with them.

Only one hacker with AI that has access to Facebook, Instagram, Microsoft or Apple can destory every accounts' life forever!

Protect your privacy! The invention of AI broke the Internet.

Maybe the world is better off without network cards. Back to buying DVDs.

Don't send selfie's to software companies! I have no longer access to Instagram, read my github pages.

Offtopic:

- Use fail2ban when hosting ssh servers

- Disable your NTP services, they expose you on the internet. (OPTIONAL)

$sudo systemctl stop systemd-timesyncd

$sudo systemctl disable systemd-timesyncd

$sudo systemctl mask systemd-timesyncd 

- Disable outgoing NTP traffic on the vpn gateway (OPTIONAL)

$sudo iptables -I OUTPUT -p tcp --dport 123 -j DROP

- It's good practise to use 1 vpn gateway for your phone's dns traffic and another vpn gateway for the rest of it's traffic. Same goes for your smarttv.

