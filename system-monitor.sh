#!/bin/sh

#sudo setenforce 0;
#./nas.sh;
killall notify-who.sh &
killall notify-ssh.sh &

ptyxis --tab --title  WHO  -- watch -n 3 who -u;
ptyxis --tab --title  BTOP  -- btop;
ptyxis --tab --title  IPCONFIG  -- watch -n 10 ip a;
ptyxis --tab --title  ROUTE  --  watch -n 10 ip r;
ptyxis --tab --title  end0  --  iftop -i end0 -f 'not host repeater and host not wiz2 and host not wiz3 and host not wiz4 and host not wiz5 and host not wiz6 and host not wiz7' -m 50M;
ptyxis --tab --title  vpn  --  iftop -i nordtun -m 50M;
ptyxis --tab --title  NETSTAT  --  watch -n 5 netstat -pltn;
ptyxis --tab --title  INET_T  --  watch -n 10 'netstat -anp | grep tcp |  grep ESTAB';
ptyxis --tab --title  INET_U  --  watch -n 10 'netstat -anp | grep udp |  grep ESTAB';
ptyxis --tab --title  SOCKETS  --  watch -n 5 'lsof -i -n -P | grep TCP | grep ESTAB | grep -v 127.0';
ptyxis --tab --title  SSH  --  watch -n 3 'ss -o state all dport = ssh or sport = ssh';
ptyxis --tab --title  DNS  --  journalctl -f -u unbound;
ptyxis --tab --title  GATEWAY  --  tail -f /var/log/vpn-gateway.log;
ptyxis --tab --title  LAN  --  watch -n 10 'ip neigh' &
/home/sprokkel/notify-who.sh &
/home/sprokkel/notify-ssh.sh &
