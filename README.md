# My evolving iptables firewall tools

## Assumes

0. This is a Linux based system
0. Ruby is available (any version) or can be installed
0. `apt-get` is the package manager
0. `iptables-persistent` can be installed
0. The directory `/etc/iptables` exists and contains
  -  `blacklist.txt` a list of the banned addresses
  -  `whitelist.txt` a list or whitelisted addresses and ports
  -  `services.txt` a list of the accessible services

## Future stuff

0. As bugs emerge I will fix them
0. A `README.md` that actually explains the project perhaps?
