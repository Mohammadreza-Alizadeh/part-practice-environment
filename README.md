# part-practice-environment
This is a simple bash script to setup a directory structure that satisfies all questions in part college course AKA emperor penguin

# What is this anyway 
this script generates a directory named part that contains following structure 
```
./part
    ├── backup
    │   └── logs
    ├── backups
    ├── files
    │   ├── auth.log
    │   ├── data.txt
    │   ├── employee.txt
    │   ├── linux.txt
    │   ├── system.log
    │   ├── users.csv
    │   └── web.log
    ├── usr
    │   └── local
    │       ├── bin
    │       │   ├── some_file1.txt
    │       │   ├── some_file2.txt
    │       │   └── some_file_link -> some_file1.txt
    │       ├── include
    │       │   └── some_file4.txt
    │       ├── lib
    │       │   └── some_file.txt
    │       ├── share
    │       │   └── some_file3.txt
    │       └── some_file.txt
    └── var/
        ├── log/
        │   ├── log_file_1.log
        │   ├── log_file_2.log
        │   ├── log_file_3.log
        │   ├── log_file_4.log
        │   ├── log_file_5.log
        │   ├── log_file_6.log
        │   ├── log_file_7.log
        │   ├── not_a_log_file_1.txt
        │   ├── not_a_log_file_2.txt
        │   └── not_a_log_file_3.html
        ├── logs/
        │   ├── not-user1.log
        │   ├── not-user2.log
        │   ├── subdir/
        │   │   ├── not-user3.log
        │   │   └── user4.log
        │   ├── user1.log
        │   ├── user2.log
        │   └── user3.log
        └── www/
            ├── another_tmp_file.tmp
            ├── index.html
            ├── just_file.txt
            ├── lit_file.txt
            ├── script.js
            ├── style.css
            └── tmp_file.tmp
```
# Benefits
by using this you'll be able to solve questions provided by Mr Hosseinalinejad 
because the files in this structure is relativly less than actual `/` directories you'll be able to check about you answer to be correct 
i tried and covered all the senarios, created files with diffrent `sizes`, `modification times` and `types` so you can easily check if your command is correct 
if you wanted to try with actual `/var/log`, it would be a disaster.



# how to 
### 1. Clone the Repository

To clone the repository to your local machine, open your terminal and run the following command:

```bash
git clone https://github.com/Mohammadreza-Alizadeh/part-practice-environment.git
```
### 2. Navigate to the Project Directory
Once the repository is cloned, navigate into the project directory:

```bash
cd part-practice-environment
```
### 3. Run the .sh Script
After navigating to the project directory, you can execute the provided .sh script. Make sure the script has executable permissions. If not, you can add execute permission using:

```bash
chmod +x ./setup.sh
```
Run the script using the following command:

```bash
sudo bash ./setup.sh
```

## Read This ( Or Don't  )
Althogh you can't run this code in any otherway but i'll explain to you why i am being strict about this concept

You must execute this file only and only using `sudo` and with a user that is not the `root` 
it is because we need to change `ownership` of some files, therefor we need high permissions `but` we also need to give ownership to an user other than `root` itself so by running this with another user, this script will be able to know which user is in your computer and it can give that user ownership
this situation is because of question number 2, i needed to create files with two diffrent `users` , so i decided to use `root` and `$SUDO_USER` 