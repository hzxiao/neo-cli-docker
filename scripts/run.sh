#!/usr/bin/expect -f
set no [lindex $argv 0]
spawn dotnet neo-cli.dll --rpc
expect "neo>"
send "open wallet ./wallets/${no}.js6on"
expect "password:"
send "123456"
expect "neo>"
send "start consensus"
interact