#!/bin/sh -e

cat /etc/alertmanager/alertmanager.yml |\
    sed "s@#auth_token: <hipchat_auth_token>#@auth_token: $hipchat_auth_token@g" |\
    sed "s@#room_id: <hipchat_room_id>#@room_id: $hipchat_room_id@g" > /tmp/alertmanager.yml

mv /tmp/alertmanager.yml /etc/alertmanager/alertmanager.yml

set -- /bin/alertmanager "$@"

exec "$@"
