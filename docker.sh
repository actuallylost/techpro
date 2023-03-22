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
options=("List images" "List containers" "Start container" "Stop container" "Remove container" "Prune containers" "Prune images" "Create docker-compose.yml" "Create Dockerfile" "Exit")

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
        "Create docker-compose.yml")
            echo -e "${YELLOW}Creating a docker-compose.yml file...${NC}"

            # Prompt user for project name
            read -p "Enter project name: " project_name

            # Prompt user for Docker image name
            read -p "Enter Docker image name: " image_name

            # Prompt user for container name (optional)
            read -p "Enter container name (optional, default is my_app): " container_name
            container_name=${container_name:-my_app}

            # Prompt user for restart policy (optional)
            read -p "Enter restart policy (optional, default is none): " restart_policy
            restart_policy=${restart_policy:-none}

            # Prompt user for whether to add volumes or not
            read -p "Add volumes? (y/n): " add_volumes

            if [[ $add_volumes == "y" || $add_volumes == "Y" ]]; then
                # Prompt user for outside volume
                read -p "Enter outside volume: " outside_volume

                # Prompt user for container volume
                read -p "Enter container volume: " container_volume
            fi

            # Prompt user for whether to add ports or not
            read -p "Add ports? (y/n): " add_ports

            if [[ $add_ports == "y" || $add_ports == "Y" ]]; then
                # Prompt user for outside port
                read -p "Enter outside port: " outside_port

                # Prompt user for container port
                read -p "Enter container port: " container_port

                # Prompt user for container IP (optional)
                read -p "Enter container IP (optional): " container_ip
            fi

            # Create docker-compose.yml file
            cat > docker-compose.yml <<EOF
version: '3.8'
services:
    $project_name:
        image: $image_name
        container_name: $container_name
EOF

            if [[ $add_ports == "y" || $add_ports == "Y" ]]; then
                echo "        ports:" >> docker-compose.yml
                echo "          - \"$outside_port:$container_port\"" >> docker-compose.yml
            fi

            if [[ $add_volumes == "y" || $add_volumes == "Y" ]]; then
                echo "        volumes:" >> docker-compose.yml
                echo "          - $outside_volume:$container_volume" >> docker-compose.yml
            fi
            echo "        deploy:" >> docker-compose.yml
            echo "            restart_policy:" >> docker-compose.yml
            echo "              condition: $restart_policy" >> docker-compose.yml

            # Success message
            echo -e "${GREEN}docker-compose.yml created successfully!${NC}"
            ;;
        "Create Dockerfile")
            echo -e "${YELLOW}Creating a Dockerfile...${NC}"
            
            # Prompt user for base image
            read -p "Enter base image: " base_image

            # Prompt user for WORKDIR
            read -p "Enter working directory: " working_directory

            # Prompt user for Port
            read -p "Enter port: " port

            # Prompt user for CMD
            read -p "Enter command: " command

            # Promt user for EntryPoint
            read -p "Enter entrypoint: " entrypoint

            # Create Dockerfile
            cat > Dockerfile <<EOF
FROM $base_image
WORKDIR $working_directory
EXPOSE $port
CMD $command
ENTRYPOINT [$entrypoint]
EOF

            echo -e "${GREEN}Dockerfile created successfully!${NC}"
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
