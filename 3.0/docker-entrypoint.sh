#!/bin/bash
set -e

if [ ! -e "/root/.db_init" ]
then
	adduser redis root
	chmod 775 /mnt/redisdata

	su -c "mkdir -p /mnt/redisdata" redis
	ln -sf /mnt/redisdata /data
	chown -h redis:redis /data

	deluser redis root
	chmod 755 /mnt/redisdata

	touch /root/.db_init
fi

cd /data
exec $@
