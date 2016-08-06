#!/bin/bash

mopidy local scan

if [[ "$PULSE_COOKIE_DATA" != "" ]]
then
    echo -ne $(echo $PULSE_COOKIE_DATA | sed -e 's/../\\x&/g') >$HOME/pulse.cookie
    export PULSE_COOKIE=$HOME/pulse.cookie
fi

exec /usr/bin/mopidy --config /var/lib/mopidy/.config/mopidy/mopidy.conf:/var/lib/mopidy/.config/mopidy/account-config/accounts.conf
