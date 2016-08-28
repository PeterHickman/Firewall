# My evolving iptables firewall tools

## Assumes

0. This is a Linux based system
0. `iptables-persistent` has been installed
0. The directory `/etc/iptables` exists and contains
  -  `blacklist.txt` a list of the banned addresses
  -  `services.txt` a list of the accessible services

## Future stuff

0. As bugs emerge I will fix them
0. As new features are require ('whitelist' ?) they will be added
0. Future versions will probably be written in something other than bash (Python?)
