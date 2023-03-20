# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Set menu prompt
PS3="Choose what you would like to install: "

# Display header
echo -e "${GREEN}"
echo "----------------------------------"
echo "TechProAcademy Installation Script"
echo "Made with <3 by Thanasis Ratsikas"
echo "----------------------------------"
echo -e "${NC}"
echo -e "${BLUE}"
echo "Useful links:"
echo "VirtualBox: https://www.virtualbox.org/wiki/Downloads"
echo "Ubuntu 20.04 LTS: https://ubuntu.com/download/server#downloads"
echo "Visual Studio Code: https://code.visualstudio.com/download"
echo "MobaXterm: https://mobaxterm.mobatek.net/download.html"
echo "Alternatively use \"ssh username@ip-address\" for ssh connections."
echo -e "${NC}"
echo

# Display menu options
options=("Update" "Install OpenSSH" "Install OpenJDK-11" "Install Maven" "Install Node.js" "Install Git" "Install Docker" "Install All" "Exit")

# Process menu selections
select option in "${options[@]}"
do
    case $option in
        "Update")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Install OpenSSH")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing OpenSSH...${NC}"
            sudo apt install openssh-client || echo -e "${RED}Failed to install - OpenSSH.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Install OpenJDK-11")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing OpenJDK-11...${NC}"
            sudo apt install openjdk-11-jdk || echo -e "${RED}Failed to install - OpenJDK-11.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Install Maven")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Maven...${NC}"
            sudo apt install maven || echo -e "${RED}Failed to install - Maven.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Install Node.js")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Node.js...${NC}"
            sudo apt install nodejs || echo -e "${RED}Failed to install - Node.js.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Install Git")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Git...${NC}"
            sudo apt install git || echo -e "${RED}Failed to install - Git.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Install Docker")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Docker...${NC}"
            sudo apt install \
                    ca-certificates \
                    curl \
                    gnupg \
                    lsb-release

            sudo mkdir -m 0755 -p /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

            echo \
              "deb [arch=$(dpkg --print-architecture) signed-by=etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

            sudo apt update
            sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || echo -e "${RED}Failed to install - Docker.${NC}"

            sudo docker run hello-world
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Setting Docker as SUDO...${NC}"
            sudo groupadd docker
            sudo usermod -aG docker $USER
            echo -e "${RED}Your machine will restart in 15 seconds to register the user changes made to Docker.${NC}"
            echo "----------------------------------"
            sleep 15
            sudo reboot
            ;;
        "Install All")
            echo -e "${YELLOW}Updating all currently installed packages...${NC}"
            sudo apt update
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing OpenSSH...${NC}"
            sudo apt install openssh-client || echo -e "${RED}Failed to install - OpenSSH.${NC}"
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing OpenJDK-11...${NC}"
            sudo apt install openjdk-11-jdk || echo -e "${RED}Failed to install - OpenJDK-11.${NC}"
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Maven...${NC}"
            sudo apt install maven || echo -e "${RED}Failed to install - Maven.${NC}"
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Node.js...${NC}"
            sudo apt install nodejs || echo -e "${RED}Failed to install - Node.js.${NC}"
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Git...${NC}"
            sudo apt install git || echo -e "${RED}Failed to install - Git.${NC}"
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Installing Docker...${NC}"
            sudo apt update
            sudo apt install \
                    ca-certificates \
                    curl \
                    gnupg \
                    lsb-release

            sudo mkdir -m 0755 -p /etc/apt/keyrings
            curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

            echo \
              "deb [arch=$(dpkg --print-architecture) signed-by=etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
              $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

            sudo apt update
            sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || echo -e "${RED}Failed to install - Docker.${NC}"

            sudo docker run hello-world
            echo -e "${GREEN}Done.${NC}"
            echo -e "${YELLOW}Setting Docker as SUDO...${NC}"
            sudo groupadd docker
            sudo usermod -aG docker $USER
            echo -e "${RED}Your machine will restart in 15 seconds to register the user changes made to Docker.${NC}"
            echo "----------------------------------"
            sleep 15
            sudo reboot
            ;;
        "Exit")
            echo -e "${YELLOW}Exiting...${NC}"
            break
            ;;
        *) 
            echo "${RED}Invalid option. Please try again.${NC}"
            ;;
    esac
done