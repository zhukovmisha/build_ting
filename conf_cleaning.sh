#!/bin/sh

PLUGINS_VAR1="devel\/ting-plugin-kaspersky"

PLUGINS_VAR2="net\/ntopng"

PORTS_VAR1="net\/ntopng"

PORTS_VAR2="ting\/kaspersky"

PORTS_VAR3="emulators\/linux-c7"

sleep 3

sed -i '' "/^$PLUGINS_VAR1/d" /usr/tools/config/23.1/plugins.conf

sleep 3

sed -i '' "/^$PLUGINS_VAR2/d" /usr/tools/config/23.1/plugins.conf

sleep 3

sed -i '' "/^$PORTS_VAR1/d" /usr/tools/config/23.1/ports.conf

sleep 3

sed -i '' "/^$PORTS_VAR2/d" /usr/tools/config/23.1/ports.conf

sleep 3

sed -i '' "/^$PORTS_VAR3/d" /usr/tools/config/23.1/ports.conf