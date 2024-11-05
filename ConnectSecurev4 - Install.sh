
macurl=$(curl -L -s -g "https://configuration.myconnectsecure.com/api/v4/configuration/agentlink?ostype=darwin" | tr -d '"')

sudo curl -k $macurl -o cybercnsagent_darwin.pkg

sudo installer -pkg ./cybercnsagent_darwin.pkg -target /

sudo /opt/install.sh   -c $ConnectSecure_CompanyIDv4 -e 247525770241531907 -j LYDrX9pJpYM93_UxbhS4Gb4_vN2F63aXoDK-3E90J_D7n46YCo5jZQ9Otz9ixcWEh23g8tOCpwqDEBsr5DeeemwEM2wbhHpXeGjErg -i;

