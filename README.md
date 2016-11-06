# mesh_check
Workaround, welches Netzwerkmodul von FF-Routern bei Meshverlust neu startet.

# Installation
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
