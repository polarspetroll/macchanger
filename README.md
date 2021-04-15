# macchanger
mac address changer

## features
**+** built in small database with popular hardware authors

**+** light weight 

**+** easy to use and install


### installation 

**quick usage**


```bash
git clone https://github.com/polarspetroll/macchanger.git && cd macchanger

chmod +x mchanger.rb

./mchanger.rb
```

**full installation**

```bash
chmod +x install.sh

./install.sh

mchanger.rb
```

### options

```
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
```


