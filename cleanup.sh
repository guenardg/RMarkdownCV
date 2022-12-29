#!/bin/bash
rm -f *~
rm -f Academic/*~
rm -f Academic/*.log
rm -f Academic/.Rhistory
rm -f Academic/.RData
rm -f Corporate/*~
rm -f Corporate/*.log
rm -f Corporate/.Rhistory
rm -f Corporate/.RData
find -type f \( -not -name "MD5" \) -exec md5sum '{}' \; > MD5
