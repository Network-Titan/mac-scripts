
#!/bin/bash

SerialNumber=$(ioreg -l | grep IOPlatformSerialNumber | awk '{print $4}' | sed 's/\"//g')
foundSerial=false
RecoveryKey=$(fdesetup changerecovery -personal | awk '{print $6}' | tr -d "'")

if [ RecoveryKey != "" ];then

cat >  /tmp/FV.plist <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" 
"http://www.apple.com/DTDs/PropertyList-1.0.dtd"> 
<plist version="1.0">
<dict>
	<key>RecoveryKey</key> 
	<string>$RecoveryKey</string> 
	<key>SerialNumber</key>
	<string>$SerialNumber</string>
</dict>
</plist>
EOF

	# Upload Key to Addigy
	#stores the path of the FileVault plist
	FDataPath=/tmp/FV.plist
	# Addigy FV Escrow Location
	FVMgr=/Library/Addigy/fv-escrows
	#Create Escrow directory if it does not exist

	if [ -d "$FVMgr" ]; then
		echo "Addigy FV Escrow Directory exists already"
		#copy file to escrow location
		cp -n $FDataPath $FVMgr/fdesetup.plist
		#run escrow
		/Library/Addigy/filevault-manager -escrow
	else
		echo "Addigy FV Escrow Directory does not exist"
		mkdir $FVMgr
		#copy file to escrow location
		cp -n $FDataPath $FVMgr/fdesetup.plist
		#run escrow
		/Library/Addigy/filevault-manager -escrow
	fi

fi

rm -rf $FDataPath
