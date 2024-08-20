#!/bin/bash  
 

# You must run this with sudo, not the root user itself
# because in some questions i need to give ownership to root and otherusers 
# so i need sudo access and $USER != root at the same time :)
# sorry because of this, i'm not good at bash scripting :))  

# Check that root user did not run this 
if [[ $EUID == 0 ]] && [[ $SUDO_USER == "root" ]] || [[ -z $SUDO_USER ]] ; then
    echo "You must run this by another user ( not root ). use sudo" 
    exit 1
fi

# Making sure that script is running in sudo 
if [[ -z $SUDO_USER ]]; then
	echo "You must run this script using sudo"
	exit 1
fi


# Create directories  
sudo -u $SUDO_USER mkdir -p ./part/var/log  
sudo -u $SUDO_USER mkdir -p ./part/var/www  
sudo -u $SUDO_USER mkdir -p ./part/var/logs  
sudo -u $SUDO_USER mkdir -p ./part/usr/local/bin  
sudo -u $SUDO_USER mkdir -p ./part/usr/local/lib  
sudo -u $SUDO_USER mkdir -p ./part/usr/local/include  
sudo -u $SUDO_USER mkdir -p ./part/usr/local/share  
sudo -u $SUDO_USER mkdir -p ./part/backups  
sudo -u $SUDO_USER mkdir -p ./part/backup/logs  
  

# Create non-empty files with diffrent sizes in ./part/var/log
# Also modify times ( suitable for question 1 )
sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/log_file_1.log bs=1M count=12  
touch -d "10 days ago" ./part/var/log/log_file_1.log  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/log_file_2.log bs=1M count=9  
touch -d "12 days ago" ./part/var/log/log_file_2.log  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/log_file_3.log bs=1M count=20  
touch -d "5 days ago" ./part/var/log/log_file_3.log  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/log_file_4.log bs=1M count=2  
touch -d "2 days ago" ./part/var/log/log_file_4.log  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/log_file_5.log bs=1M count=32  
touch -d "19 days ago" ./part/var/log/log_file_5.log  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/log_file_6.log bs=1M count=15
touch -d "4 days ago" ./part/var/log/log_file_6.log  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/log_file_7.log bs=1M count=7  
touch -d "20 days ago" ./part/var/log/log_file_7.log  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/not_a_log_file_1.txt bs=1M count=12  
touch -d "2 days ago" ./part/var/log/not_a_log_file_1.txt  

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/not_a_log_file_2.txt bs=1M count=1  
touch -d "5 days ago" ./part/var/log/not_a_log_file_2.txt

sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/log/not_a_log_file_3.html bs=1M count=13  
touch -d "10 days ago" ./part/var/log/not_a_log_file_3.html  

# Create files in ./part/var/www  
sudo -u $SUDO_USER touch ./part/var/www/index.html  
touch -d "10 days ago" ./part/var/www/index.html  

sudo -u $SUDO_USER touch ./part/var/www/style.css  
touch -d "17 days ago" ./part/var/www/style.css  

sudo -u $SUDO_USER touch ./part/var/www/script.js  
touch -d "23 days ago" ./part/var/www/script.js  

sudo -u $SUDO_USER touch ./part/var/www/just_file.txt  
touch -d "12 days ago" ./part/var/www/just_file.txt  

sudo -u $SUDO_USER touch ./part/var/www/lit_file.txt  
touch -d "10 days ago" ./part/var/www/lit_file.txt  

sudo -u $SUDO_USER touch ./part/var/www/tmp_file.tmp  
touch -d "20 days ago" ./part/var/www/tmp_file.tmp  

sudo -u $SUDO_USER touch ./part/var/www/another_tmp_file.tmp  
touch -d "10 days ago" ./part/var/www/another_tmp_file.tmp  

# Create files in ./part/var/logs    
sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/logs/user1.log bs=1M count=14 >/dev/null  
sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/logs/user2.log bs=1M count=2  >/dev/null 
sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/logs/user3.log bs=1M count=3  >/dev/null 


dd if=/dev/zero of=./part/var/logs/not-user1.log bs=1M count=1 >/dev/null # root is owner for this one  
dd if=/dev/zero of=./part/var/logs/not-user2.log bs=1M count=3 >/dev/null # root is owner for this one  
  
sudo -u $SUDO_USER mkdir -p ./part/var/logs/subdir  
sudo -u $SUDO_USER dd if=/dev/zero of=./part/var/logs/subdir/user4.log bs=1M count=5
  
dd if=/dev/zero of=./part/var/logs/subdir/not-user3.log bs=1M count=2 # root is owner for this one  



# Create files and symblic links in ./usr/local
sudo -u $SUDO_USER touch ./part/usr/local/bin/some_file1.txt  
sudo -u $SUDO_USER touch ./part/usr/local/bin/some_file2.txt  
sudo -u $SUDO_USER touch ./part/usr/local/share/some_file3.txt  
sudo -u $SUDO_USER touch ./part/usr/local/include/some_file4.txt  
sudo -u $SUDO_USER touch ./part/usr/local/some_file.txt  
sudo -u $SUDO_USER touch ./part/usr/local/lib/some_file.txt  
sudo -u $SUDO_USER ln -s some_file1.txt ./part/usr/local/bin/some_file_link.txt



# Copying files to .part/files dir
if [[ -d ./files ]]; then
    cp -r files part/
else
    echo "couldn't find files directory. but it does'nt matter you can download files from telegram and copy in ./part directory by yourself"
fi


echo "All Done. Enjoy :)"