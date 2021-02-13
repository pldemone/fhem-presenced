# fhem-presenced
Fork of Fhem's PRESENCE SVN Project

Fork of presenced from FHEM's SVN repository
* https://svn.fhem.de/fhem/trunk/fhem/contrib/PRESENCE/presenced
* Copyright by Markus Bloch
* e-mail: Notausstieg0309@googlemail.com

## Description
Set of scripts that provides several possibilities to check the presence of mobile phones or Bluetooth Low Energy Beacons & Tags.

## lepresenced
Checks for one or multiple bluetooth devices for their presence state and report this to the FHEM Server.

## Usage
```sh
sudo chmod +x lepresenced
sudo chgrp -cR dialout lepresenced
./lepresenced -h
```

