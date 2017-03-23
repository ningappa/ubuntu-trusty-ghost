<?php 
echo exec('supervisorctl -c /etc/supervisor/supervisord.conf restart ghost');

