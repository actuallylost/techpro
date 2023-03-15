PS3="Choose what you would like to install"

echo "----------------------------------"
echo
echo "TechProAcademy Installation Script"
echo "Made with <3 by Thanasis Ratsikas"
echo
echo "----------------------------------"
echo "Useful links:"
echo "VirtualBox: https://www.virtualbox.org/wiki/Downloads"
echo "Ubuntu 20.04 LTS: https://ubuntu.com/download/server#downloads"
echo "Visual Studio Code: https://code.visualstudio.com/download"
echo "MobaXterm: https://mobaxterm.mobatek.net/download.html | Alternatively use \"ssh username@ip-address\" for ssh connections."
echo "----------------------------------"
echo

select option in "Install All" "Install OpenSSH" "Install OpenJDK-11" "Install Maven" "Install Git" "Install Docker" "Exit"
do
    case $option in
        "Install All")
            echo "Updating all currently installed packages"
            sudo apt update
            echo "----------------------------------"
            echo "OpenSSH:"
            sudo apt install openssh-client || echo "Failed to install - OpenSSH"
            echo "----------------------------------"
            echo "OpenJDK-11:"
            sudo apt install openjdk-11-jdk || echo "Failed to install - OpenJDK-11"
            echo "----------------------------------"
            echo "Maven:"
            sudo apt install maven || echo "Failed to install - Maven"
            echo "----------------------------------"
            echo "Git:"
            sudo apt install git || echo "Failed to install - Git"
            echo "----------------------------------"
            echo "Docker:"
            sudo apt update
            sudo apt install \
                    ca-certificates \
                    curl \
                    gnupg \
                    lsb-release

            sudo mkdir -m 0755 -p /etc/apt/keyrings
            curl -fsSL https://download.docker.com/liacnux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

            echo \
              "deb [arch=$(dpkg --print-architecture) signed-by=etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

            sudo apt update
            sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

            sudo docker run hello-world
            echo "----------------------------------"
            echo "Set Docker as SUDO"
            sudo groupadd docker
            sudo usermod -aG docker $USER
            echo "Your machine will restart in 15 seconds to register the user changes made to Docker"
            echo "----------------------------------"
            sleep 15
            sudo reboot
            ;;
        "Install OpenSSH")
            echo "Updating all currently installed packages"
            sudo apt update
            echo "----------------------------------"
            echo "OpenSSH:"
            sudo apt install openssh-client || echo "Failed to install - OpenSSH"
            ;;
        "Install OpenJDK-11")
            echo "Updating all currently installed packages"
            sudo apt update
            echo "----------------------------------"
            echo "OpenJDK-11:"
            sudo apt install openjdk-11-jdk || echo "Failed to install - OpenJDK-11"
            ;;
        "Install Maven")
            echo "Updating all currently installed packages"
            sudo apt update
            echo "----------------------------------"
            echo "Maven:"
            sudo apt install maven || echo "Failed to install - Maven"
            ;;
        "Install Git")
            echo "Updating all currently installed packages"
            sudo apt update
            echo "----------------------------------"
            echo "Git:"
            sudo apt install git || echo "Failed to install - Git"
            ;;
        "Install Docker")
            echo "Updating all currently installed packages"
            sudo apt update
            echo "----------------------------------"
            echo "Docker:"
            sudo apt install \
                ca-certificates \
                curl \
                gnupg \
                lsb-release

            sudo mkdir -m 0755 -p /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

            echo \
              "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

            sudo apt update
            sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

            sudo docker run hello-world
            echo "----------------------------------"
            echo "Set Docker as SUDO"
            sudo groupadd docker
            sudo usermod -aG docker $USER
            echo "Your machine will restart in 15 seconds to register the user changes made to Docker"
            echo "----------------------------------"
            sleep 15
            sudo reboot
            ;;
        "Exit")
            break
            ;;
        *) 
            echo "Invalid option"
            ;;
    esac
done