# secure-network-architecture

![Screenshot](https://github.com/gtoyman/secure-network-architecture/blob/main/secure-network-architecture.png)

All the linux servers 'and' lan clients are connected to the same router on the same LAN.

Upnp must be disabled on the router. No external open ports on the linux gateway!! Use netstat -pltn for an overview.

For secure access to your network from the outside, use MESHNET. (With NordVPN meshnet breaks the linux gateway to the lan (it's a bug) so you must use MESHNET on a different machine on the lan. With ssh-tunneling on the MESHNET machine you can access all your hardware on your lan.

Actually you need two linux vpn gateways connected to the router. One gateway with vpn is used as DNS server for all dns requests, another gateway with vpn is used as gateway for the rest of the traffic.  That way they can't return to your system based on dns requests. The second gateway is ip-based only.

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

- OR , you can run your own NTP server on the same server as the DNS gateway and redirect all clients to use this server. For camera's and other hardware you have to use wireshark to find out which ntp servers they are using and then redirect those NTP servers to your own NPT server using DNS (unbound). If your hardware uses hardcoded dns you have to redirect it to your own DNS server with iptables nat table , prerouting , then using DNAT to redirect the outgoing dns server to your own dns server. (ask chatgpt)

