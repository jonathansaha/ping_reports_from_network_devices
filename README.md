# ping_reports_from_network_devices

There is a list of commands in commands.txt. The expect.sh script takes every line from that as a command and runs on a device, the device is specificed in the script itself.

  ./expcet.sh | tee output.txt

Output is stored in output.txt. Then you can sort it. Below is an example.

  grep "Success" output.txt | cut -d '=' -f 2-
