# mesh_check
Workaround, welches Netzwerkmodul von FF-Routern bei Meshverlust neu startet.

# Variante 1 (empfohlen)
Skript, welches mit Batman misst, ob es noch Verbindung zu anderen Nodes hat

## Installation

Cronjob anlegen:
```
crontab -e
```

Dort folgendes eingragen, damit Skript ein Mal pro Minute ausgeführt wird:
```
* * * * * ash -c 'if [ $(batctl o | grep mesh0 | wc -l) -eq 0 ]; then logger "wifi reset"; wifi; fi'
```

# Variante 2 (nicht empfohlen)
Skript, welches mit Ping misst, ob es noch Verbindung zu anderen Nodes hat

## Installation
Skript in z.B. /opt/mesh_check.sh einfügen

Skript mit ausführbar machen:
```
chmod +x /opt/mesh_check.sh
```

Cronjob anlegen:
```
crontab -e
```

Dort folgendes eingragen, damit Skript ein Mal pro Stunde ausgeführt wird:
```
0 0 * * * /opt/mesh_check.sh
```
