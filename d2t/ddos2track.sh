#!/bin/bash
clear
cat tools/banner
while :
do
echo ""
echo "                        By kernelF00d"
echo "--------------------------------------"
echo ""
echo "  1.- Start Detector"
echo "  2.- Setup Boot Starting"
echo "  3.- Honeypot Control"
echo ""
echo "  99.- Exit"
echo "--------------------------------------"
echo -n "Select an option: "
read op
case $op in
1) echo "[*] Selected: Start Detector";
echo "Detector is not finished yet."
;;
2) echo "[*] Selected: Setup Boot Starting";
echo "chmod 777 setup.sh
echo '#!/bin/sh 
      cd /etc/ddos2track/tools/detector
      sh detector.sh
      exit' > ddos2track.sh
cp ddos2track.sh /etc/init.d/ddos2track.sh
rm ddos2track.sh
chmod 777 /etc/init.d/ddos2track.sh
ln -s /etc/init.d/ddos2track.sh /etc/rc2.d/S88ddos2track" > setup.sh
echo "[+] Boot Starting Installed Successfully!"
sh setup.sh
rm setup.sh
;;
3) echo "[*] Selected: Honeypot Control";
clear
while :
do
echo ""
echo ""
echo "--------------------------------------"
echo ""
echo "  1.- Start Honeypot Server"
echo "  2.- View Logs"
echo ""
echo "  99.- Exit"
echo "--------------------------------------"
echo -n "Select an option: "
read op1
case $op1 in
1) echo "[*] Selected: Start Honeypot Server";
cd tools/analyzer/
python logger.py
;;
2) echo "[*] Selected: View Logs";
cat tools/analyzer/ddos.log
;;
99) echo "[*] Exiting...";
exit 1;;
*) echo "[!] $op1 is not a valid option.";
echo "Press enter to continue...";
read foo;;
esac
done
;;
99) echo "[*] Exiting...";
exit 1;;
*) echo "[!] $op is not a valid option.";
echo "Press enter to continue...";
read foo;;
esac
done
