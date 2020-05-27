#!/usr/bin/env expect -f
# Usage: scp.tcl source dest
# Preconditions:
#   env variable SCP_USER
#   env variable SCP_PASS
set filename [lindex $argv 0]
set target [lindex $argv 1]
set user $::env(SCP_USER)
set pass $::env(SCP_PASS)

if { ( $filename eq "" ) || ( $target eq "" ) || ( $user eq "" ) || ( $pass eq "" ) } {
        puts "\[ERROR\] Missing values for all of filename, target, user, password."
        puts "\[USAGE\] scp.tcl <filename> <remote_target>"
        exit 1
} else {
        puts "\[INFO\] Secure copying $filename to $target (user $user)"
}

set timeout -1

spawn scp $filename $user@$target

expect {
        -re {(P|p)assword:} {
                send "$pass\r" ; exp_continue
        }
        "yes/no)?" {
                send "yes\r"; exp_continue
        }
        eof {
                exit
        }
}
