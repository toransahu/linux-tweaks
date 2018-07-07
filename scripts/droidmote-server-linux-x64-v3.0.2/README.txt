DroidMote Server for Linux 3.0.2  x64

How to start the server:

Disable the firewall on port 2302
chmod 777 ./droidmote
sudo su
./droidmote 2302 password


How to start the server at boot time: (you can use also an alternative configuration, but you must start droidmote after X11)

get root permission with sudo su
copy droidmote to /usr/bin
chmod 777 /usr/bin/droidmote
create a shell script startdm.sh in /usr/bin

-----------------------------
the content of startdm.sh is:
#!/bin/sh
droidmote 2302 password &
-----------------------------

chmod +x /usr/bin/startdm.sh
edit the file /etc/lightdm/lightdm.conf and add the line: greeter-setup-script=/usr/bin/startdm.sh
restart your machine
