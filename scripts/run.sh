#!/usr/bin/expect -f
set no [lindex $argv 0]
spawn dotnet neo-cli.dll --rpc --log
expect "neo>"
send "open wallet ./wallets/${no}.json\r"
expect "password:"
send "123456\r"
expect "neo>"
send "start consensus\r"
interact