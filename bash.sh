#!/bin/bash
for i in $(eval echo {1..$1})
do
        echo "Loop: $i"
        echo "============="
        service tor restart
        sleep 1
        proxychains4 -q curl ifconfig.me
        ip=$(proxychains4 -q curl ifconfig.me)
        echo "IP: $ip"
        echo $ip >> bash.log
        #sleep 1
        proxychains4 -q casperjs --engine=slimerjs niki.js
done
