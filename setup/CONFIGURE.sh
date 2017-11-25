#!/bin/bash
echo ""
echo ""
echo -n "Do you want to use your [O]wn server to send the email notification or use [D]efault server [o/d]: "
read op
case $op in
o) echo "OK... CONFIGURING ALL...";
echo -n "Type your PHP script URL (Eg.: http://server.com/send.php): "
read servs
echo -n "Type your email to receive alert emails (Eg.: your@ema.il): "
read email1
echo "$servs" > tools/mailer/config/server.txt
echo "$email1" > tools/mailer/config/emailaddr.txt
sh ANTIDDOS.sh
echo "[OK] DDOS2TRACK IS NOW CONFIGURED"
rm ANTIDDOS.sh
rm CONFIGURE.sh
;;
d) echo "OK... CONFIGURING ALL...";
echo "http://ddos2track.000webhostapp.com/send.php" > tools/mailer/config/server.txt
echo -n "Type your email to receive alert emails (Eg.: your@ema.il): "
read email2
echo "$email2" > tools/mailer/config/emailaddr.txt
echo "Executing Anti-DDoS  Script IPTables Rules..."
sh ANTIDDOS.sh
echo "[OK] DDOS2TRACK IS NOW CONFIGURED"
rm ANTIDDOS.sh
rm CONFIGURE.sh
;;
*) echo "Sorry, $op is not an option";
echo "Press enter to continue..."
read foo;;
esac
