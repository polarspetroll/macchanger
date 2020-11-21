#!/usr/bin/ruby
options = Array.new
options = ARGV
def helpmenu()
  puts "
    mac address changer
    usage : mchanger [options]

    options:

    -h : help menu
    -i : interface (device)
    -m : mac address
    -c : set mac address to the selected author
    examples :
     mchanger -i wlan0 -m 66:55:44:33:22:11
     mchanger -i eth0 -c raspberrypi
    available hardware authors for -c :
      cisco, intel-Corporation, apple, samsung, mikrotik, asus, cybertan, raspberrypi, tenda
      zyxel, tp-link, nokia, lg, d-link, microsoft, netgear, alcatel, ubiquiti, ibm, google
      amd, hp

        "
        abort
end
if options[0] == "-h"
  helpmenu()
end
author = options.index("-c")
iswitch = options.index("-i")
mswitch = options.index("-m")

if  mswitch != nil && author != nil
  abort "you cannot use both -m and -c "
elsif mswitch == nil && author == nil
  helpmenu()
elsif author != nil
  mac = options[author + 1]
  compname = options[author + 1]
elsif mswitch != nil
  mac = options[mswitch + 1]
else
  abort "no address specified"
end

if iswitch != nil
  iface = options[iswitch + 1]
else
  abort "no interface specified"
end

if mac == nil
  abort "no address specified "
end

case (Process.uid)
when 0
else
  abort("You must run this tool with root privilege")
end

macdb ={
  "cisco" => "00:00:0C:33:22:11",
  "Intel-corporation" => "00:02:B3:31:43:12",
  "apple" => "00:03:93:35:23:75",
  "samsung" => "00:07:AB:33:22:11",
  "mikrotik" => "64:D1:54:81:EF:8C",
  "asus" => "00:04:0F:33:22:11",
  "cybertan" => "00:90:A2:33:22:11",
  "raspberrypi" => "B8:27:EB:33:22:13",
  "tenda" => "B8:3A:08:33:22:15",
  "zyxel" => "B8:EC:A3:33:22:11",
  "tp-link" => "BC:46:99:22:11:33",
  "nokia" => "BC:52:B4:44:64:22",
  "lg" => "BC:F5:AC:33:22:11",
  "d-link" => "BC:F6:85:23:21:55",
  "microsoft" => "C0:33:5E:35:12:66",
  "netgear" => "C0:3F:0E:23:22:11",
  "alcatel" => "C8:F8:6D:33:22:11",
  "ubiquiti" => "FC:EC:DA:33:22:11",
  "ibm" => "FC:CF:62:12:23:35",
  "google" => "F4:F5:E8:23:46:22",
  "amd" => "00:00:1A:34:12:00",
  "hp" => "00:00:63:23:00:22"
 }

 if author != nil && macdb.include?(mac)
  mac = macdb[mac]
 elsif author != nil
  abort "sorry, the selected address doesn't included in list"
end
system("ifconfig #{iface} down")
system(
  "
  ifconfig #{iface} hw ether #{mac}
  if [ $? -eq 0 ]; then
    echo '\e[92maddress changed succesfully. new address: #{compname} => \e[95m#{mac}'
  fi
  ifconfig #{iface} up

  "
)
