#!/bin/sh
# SYSTEM MONITOR OVERVIEW
# -----------------------
# Start or run this script in the ptyxis terminal.

ptyxis --tab --title  WHO  -- watch -n 3 who -u;
ptyxis --tab --title  BTOP  -- btop;
ptyxis --tab --title  IPCONFIG  -- watch -n 10 ip a;
ptyxis --tab --title  ROUTE  --  watch -n 10 ip r;
ptyxis --tab --title  end0  --  sudo iftop -i end0 -m 50M;
ptyxis --tab --title  vpn  --  sudo iftop -i nordtun -m 50M;
ptyxis --tab --title  NETSTAT  --  watch -n 5 netstat -pltn;
ptyxis --tab --title  INET  --  watch -n 10 'netstat -anp | grep tcp |  grep ESTAB';
ptyxis --tab --title  SOCKETS  --  watch -n 5 'lsof -i -n -P | grep TCP | grep ESTAB | grep -v 127.0';
ptyxis --tab --title  SSH  --  watch -n 3 'ss -o state all dport = ssh or sport = ssh';
ptyxis --tab --title  DNS  --  journalctl -f -u unbound;
ptyxis --tab --title  LAN  --  watch -n 10 '/home/sprokkel/lan_scan.sh' &
