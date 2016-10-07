#!/bin/bash
forever stopall
NODE_ENV=production forever start /var/www/html/index.js
