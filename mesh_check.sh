#!/bin/ash

# Bitte beachten: Das Skript ist gerade in der Testphase.


# next Node
IP="2a01:198:70a:ff::FFFE"

# fastd1
#IP="2a01:198:70a:ff::100:1"

DATE=$(date +%d.%m.%Y,%H:%M:%S)

echo "start ping to $IP"
ping -c 10 "$IP" > /dev/null # 10x Ping
if [ $? -eq 0 ]; then # Erfolgreich?
    # Ja, Ende
    echo "$IP online"
    echo "exit"
    #echo "$DATE exit">>"$LOGOUTPUT"               
    exit 0
else          
    # Nein.                   
    # Router hat Mesh verloren                
    echo "$IP offline"
    logger "wifi reset"
    echo "restart wifi"                    
    wifi
fi
exit 0
