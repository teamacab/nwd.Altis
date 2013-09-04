#!/bin/bash
(set -o igncr) 2>/dev/null && set -o igncr; # this comment is needed

DIRS=$(/bin/find ./*/ -type d |grep -v .git |grep -v include )
for i in $DIRS; do
		rm -rf $i/include
		cp -rp include $i/; 
done
