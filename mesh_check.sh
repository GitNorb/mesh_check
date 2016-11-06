#!/bin/ash

# next Node
IP="2a01:198:70a:ff::FFFE"

#fastd1
#IP="2a01:198:70a:ff::100:1"

DATE=$(date +%d.%m.%Y,%H:%M:%S)
LOGOUTPUT="/tmp/mesh_check.log"

# Problem mit for-Schleife in ash
#for (( i=0 ; i>3 ; i++ ))
#do
        echo "try $i"
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
                echo "$IP offline"
                #if [ $i -lt 2 ]; then
                #        echo "sleep 1m"
                #        sleep 1m
                #fi
        fi                        
#done

# Router hat Mesh verloren                
echo "$DATE restart network">>"$LOGOUTPUT"
echo "restart network"                    
/etc/init.d/network restart
