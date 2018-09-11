#!/bin/bash
cd `dirname $0`

nohup  ./brook server -l :5555 -p "password1" > /dev/null 2>&1 &

