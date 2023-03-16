# Define color variables
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Set menu prompt
PS3="Choose the action you want to run: "

# Display header
echo -e "${GREEN}"
echo "----------------------------------"
echo "Docker Quick Actions Script"
echo "Made with <3 by Thanasis Ratsikas"
echo "----------------------------------"
echo -e "${NC}"
echo -e "${BLUE}"
echo "Useful links:"
echo "Docker Documentation: https://docs.docker.com/"
echo "Docker Engine Installation (Ubuntu): https://docs.docker.com/engine/install/ubuntu/#installation-methods"
echo "Docker Engine Post-Installation (Linux): https://docs.docker.com/engine/install/linux-postinstall/"
echo "OpenJDK11-Alpine-JRE Image: https://hub.docker.com/r/adoptopenjdk/openjdk11"
echo "Apache2 Ubuntu Image: https://hub.docker.com/r/ubuntu/apache2"
echo -e "${NC}"
echo

# Display menu options
options=("List images" "List containers" "Start container" "Stop container" "Remove container" "Prune containers" "Prune Images" "Exit")

# Process menu selections
select option in "${options[@]}"
do
    case $option in
        "List images")
            echo -e "${YELLOW}Listing Docker images...${NC}"
            docker images
            echo -e "${GREEN}Done.${NC}"
            ;;
        "List containers")
            echo -e "${YELLOW}Listing Docker containers...${NC}"
            docker ps -a
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Start container")
            echo -e "${YELLOW}Starting a Docker container...${NC}"
            read -p "Enter the name of the container you want to start: " container_name
            docker start $container_name || echo -e "${RED}Failed to start container.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Stop container")
            echo -e "${YELLOW}Stopping a Docker container...${NC}"
            read -p "Enter the name of the container you want to stop: " container_name
            docker stop $container_name || echo -e "${RED}Failed to stop container.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Remove container")
            echo -e "${YELLOW}Removing a Docker container...${NC}"
            read -p "Enter the name of the container you want to remove: " container_name
            docker rm $container_name || echo -e "${RED}Failed to remove container.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Prune containers")
            echo -e "${YELLOW}Pruning Docker containers...${NC}"
            docker container prune || echo -e "${RED}Failed to prune containers.${NC}"
            echo -e "${GREEN}Done.${NC}"
            ;;
        "Prune images")
            echo -e "${YELLOW}Pruning Docker images...${NC}"
            docker image prune || echo -e "${RED}Failed to prune images.${NC}"
            echo -e "${GREEN}Done.${NC}"
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
