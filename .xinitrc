#!/bin/bash

SESSION=$1
STARTXINIT=0

if [ "$SESSION" == "" ] ; then
	SESSION="default"
fi

for AUTORUNFILE in $(ls ~/.xinit/autorun/); do
	source ~/.xinit/autorun/${AUTORUNFILE} bevor ${SESSION}
done

source ~/.xinit/sessions/${SESSION}

for AUTORUNFILE in $(ls ~/.xinit/autorun/); do
   source ~/.xinit/autorun/${AUTORUNFILE} after ${SESSION} &
done

if [ "$STARTXINIT" == "1" ] ; then
	exec /usr/local/bin/xinitrc
fi

echo "Exiting xinit"
exit 0
