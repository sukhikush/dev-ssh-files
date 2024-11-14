
#!/bin/bash

exec > >(tee /home/sukhi/MyFiles/0_CustomShhFiles/Shut_Down_log_files.txt) 2>&1


###############################################################################################################
#--------------------  Secure Folder Check -------------------------------------------------------------

# echo -n "YourSecretPassphrase" | md5sum
# ff705f1b6f527fe2038d5ad152f64769

# Wait for 2 minutes
sleep 120

# Define the path to the "Sukhi" folder on the Desktop
folder_path="$HOME/Desktop/Sukhi"

# Set the MD5 hash of the correct passphrase
correct_hash="ff705f1b6f527fe2038d5ad152f64769"  # Replace with your actual MD5 hash

# Check if the folder exists
if [ ! -d "$folder_path" ]; then
    echo "Folder 'Sukhi' not found on the Desktop."
    
    # Prompt for the passphrase
    read -sp "Enter passphrase to prevent shutdown: " user_passphrase
    echo
    
    # Calculate the MD5 hash of the entered passphrase
    user_hash=$(echo -n "$user_passphrase" | md5sum | awk '{print $1}')
    
    # Check if the hash of the entered passphrase matches the correct hash
    if [ "$user_hash" != "$correct_hash" ]; then
        echo "Incorrect passphrase. Shutting down..."
        # sudo shutdown now
    else
        echo "Passphrase correct. Shutdown aborted."
    fi
else
    echo "Folder 'Sukhi' found. No shutdown needed."
fi


###############################################################################################################
#--------------------  Open Log Files -------------------------------------------------------------
# Open a text file with nano
# cat /home/sukhi/MyFiles/0_CustomShhFiles/Shut_Down_log_files.txt
 kate /home/sukhi/MyFiles/0_CustomShhFiles/Shut_Down_log_files.txt