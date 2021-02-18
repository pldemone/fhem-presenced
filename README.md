# fhem-presenced
Set of scripts that provides several possibilities to check the presence of mobile phones or Bluetooth Low Energy Beacons & Tags

Fork of presenced from FHEM's SVN repository
* https://svn.fhem.de/fhem/trunk/fhem/contrib/PRESENCE/presenced
* Copyright by Markus Bloch

# Description

## npresenced
Checks dedicated Bluetooth devices for their response status and reports it to the FHEM server.

## lepresenced
Checks for one or multiple Low Energy (LE) bluetooth devices for their presence state and report this to the FHEM Server.

## presenced
Checks for one or multiple bluetooth devices for their presence state and report this to the FHEM Server.


# Installation and usage

## Prerequisites
Install bluetooth and bluez on your system

## Installation
```sh
make install
```

## Usage
Start the server on your FHEM instance or on a remote system
```sh
/usr/bin/npresenced -l LOG_INFO -t stdout --fast
```

Define a monitored system under FHEM
```
define MyIphone PRESENCE lan-bluetooth 11:22:33:44:55:66 192.168.0.1:5333 60
```

