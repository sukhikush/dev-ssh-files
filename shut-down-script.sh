#!/bin/bash

exec > >(tee /home/sukhi/MyFiles/0_CustomShhFiles/Shut_Down_log_files.txt) 2>&1

# Define the color code for green
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
NC=$(tput sgr0) # No Color (resets to default)



###############################################################################################################
#-------------------- Dbeaver Git Hub Commit Code -------------------------------------------------------------
# Redirect all output (stdout and stderr) to a file using tee

  echo -e "${YELLOW}cd to /home/sukhi/MyFiles/1_Development/DBeaver-Postgresql${NC}"
  cd /home/sukhi/MyFiles/1_Development/DBeaver-Postgresql

  echo -e "${YELLOW}Fetching Latest Code (git pull sukhi main)${NC}"
  git pull sukhi main

  # Check for changes in the Git working directory
  if [[ -n $(git status --porcelain) ]]; then
      echo -e "${YELLOW}Changes detected. Committing changes...${NC}"

      echo -e "${YELLOW}Adding all chnages (git add .)${NC}"
      git add .

      echo -e "${YELLOW}Commiting Changes (git commit -a -m 'Auto push')${NC}"
      git commit -a -m "Auto push"
      
      echo -e "${YELLOW}Publishing changes (git push sukhi main)${NC}"
      git push sukhi main

      echo "${GREEN}Changes committed successfully.${NC}"
  else
    echo "${GREEN}No changes detected. Nothing to commit.${NC}"
  fi

###############################################################################################################
#--------------------  Delete Folder "Sukhi" -------------------------------------------------------------
#!/bin/bash

# Define the path to the "Sukhi" folder on the Desktop
folder_path="$HOME/Desktop/Sukhi"

# Check if the folder exists
if [ -d "$folder_path" ]; then
    # Delete the folder and its contents
    rm -rf "$folder_path"
    echo "Folder 'Sukhi' deleted from the Desktop."
else
    echo "Folder 'Sukhi' does not exist on the Desktop."
fi
