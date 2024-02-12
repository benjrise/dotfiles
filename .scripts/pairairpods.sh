#!/usr/bin/expect -f

# Define the MAC address of the Bluetooth device you want to pair with
set mac_address "EC:73:79:03:D9:49"

# Timeout for each expect command (adjust as needed)
set timeout 10

# Start bluetoothctl, the interactive command-line tool
spawn bluetoothctl

# Wait for bluetoothctl to start successfully
expect "Agent registered"

# Turn the Bluetooth power on
send "power on\r"
expect "Changing power on succeeded"

# Enable the agent
send "agent on\r"
expect "Agent is already registered"

# Set the default agent
send "default-agent\r"
expect "Default agent request successful"

# Start scanning for devices
send "scan on\r"
expect "Discovery started"

# Wait a bit to ensure the device can be discovered (adjust the sleep time as needed)
sleep 20

# Pair with the device
send "pair $mac_address\r"
expect {
    "Authorize service 0000110e-0000-1000-8000-00805f9b34fb (yes/no):" {
        send "yes\r"
        exp_continue
    }
    timeout {
        send_user "No authorization prompt appeared, continuing...\n"
    }
}
expect "Pairing successful" {
    send "trust $mac_address\r"
    expect "trust succeeded"
    send "connect $mac_address\r"
    expect "Connection successful"
} timeout {
    send_user "Failed to pair with the device\n"
}

send "scan off\r"
expect "Discovery stopped"

send "quit\r"
expect eof

