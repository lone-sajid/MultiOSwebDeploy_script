#!/bin/bash

### Multi OS website deployment script.

# Global Variable Declaration
TEM_DIR="/tmp/webappdir"
URL="https://www.tooplate.com/zip-templates/2133_moso_interior.zip"
ARTI="2133_moso_interior"

# Check if yum based
sudo yum --help &>  /dev/null

if [ $? -eq 0 ]
then

   # Variable Declaration
   PACKAGE="httpd zip unzip wget"
   SRV="httpd"

   # Installing Dependencies
    echo "########################################"
    echo "Installing packages for YUM based OS."
    echo "########################################"
    sudo yum install $PACKAGE -y > /dev/null
    echo

    # Creating Temp Directory
    echo "########################################"
    echo "Starting Artifact Deployment"
    echo "########################################"
    mkdir -p $TEM_DIR
    cd $TEM_DIR

    echo
    wget $URL > /dev/null
    unzip $ARTI.zip > /dev/null
    cp -r $ARTI/* /var/www/html/ > /dev/null
    echo


    # Restart & Enable Service
    echo "########################################"
    echo "Start & Enable HTTPD Service"
    echo "########################################"
    sudo systemctl restart $SRV
    sudo systemctl enable $SRV

else

    # Variable Declaration
    PACKAGE="apache2 zip unzip wget"
    SRV="apache2"

    # Installing Dependencies
    echo "########################################"
    echo "Installing packages for APT based OS."
    echo "########################################"
    sudo apt update > /dev/null 
    sudo apt install $PACKAGE -y > /dev/null
    echo

    # Creating Temp Directory
    echo "########################################"
    echo "Starting Artifact Deployment"
    echo "########################################"
    mkdir -p $TEM_DIR
    cd $TEM_DIR

    echo
    wget $URL > /dev/null
    unzip $ARTI.zip > /dev/null
    cp -r $ARTI/* /var/www/html/ > /dev/null
    echo


    # Restart & Enable Service
    echo "########################################"
    echo "Start & Enable HTTPD Service"
    echo "########################################"
    sudo systemctl restart $SRV
    sudo systemctl enable $SRV
fi

# Remove downloaded template
rm -rf $TEM_DIR

ls /var/www/html/


 
