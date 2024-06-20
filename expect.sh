#!/usr/bin/expect

# Get the commands to run, one per line
set f [open "commands.txt"]
set commands [split [read $f] "\n"]
close $f

set timestamp [timestamp -format %Y-%m-%d-%H-%M]
set router  "103.7.251.248"
set username  "username"
set password  "password"
set port "22"
spawn ssh -p $port $username@$router
match_max 100000000

set timeout 6

expect "(yes/no)?" {
send "yes\r"; exp_continue }

expect password:
send -- "$password\r"

expect  #

foreach host $router {

foreach cmd $commands {
        expect "# "
        send "$cmd\r"
        }
# Tidy up
    expect "# "
    send "exit\r"
    expect eof
    close
}

expect eof
