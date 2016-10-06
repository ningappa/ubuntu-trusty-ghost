#!/bin/bash
exec NODE_ENV=production forever start /var/www/html/index.js
