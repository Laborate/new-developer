while [[ -z "$mysql_username" || -z "$mysql_password" ]]; do
    clear;
    read -p "MYSQL Admin Username: " mysql_username;
    read -p "MYSQL Admin Password: " mysql_password;
    read -p "Is this information correct [Y/n]: " mysql_correct;

    if [ "$mysql_correct" == "n" ]; then
        mysql_username=;
        mysql_password=;
    fi
done

while [[ -z "$username" || -z "$password" || -z "$name" || -z "$email" || -z "$ssh_key=" ]]; do
    clear;
    read -p "New Full Name: " name;
    read -p "Github Profile Email: " email;
    read -p "New Username: " username;
    read -p "New Password: " password;
    read -p "Local SSH Key: " ssh_key;
    read -p "Is this information correct [Y/n]: " user_correct;

    if [ "$user_correct" == "n" ]; then
        username=;
        password=;
        name=;
        email=;
        ssh_key=;
    fi
done

clear;
adduser --force-badname $username;
mysql --user="$mysql_username" --password="$mysql_password" -e "CREATE DATABASE laborate_$username;"
mysql --user="$mysql_username" --password="$mysql_password" -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password'";
mysql --user="$mysql_username" --password="$mysql_password" -e "GRANT ALL PRIVILEGES ON laborate_$username.* To '$username';"
chmod 775 -R /home/$username;
chown -R root /home/$username;
chgrp -R $username /home/$username;

su -c "git config --global user.name '$name'" - $username;
su -c "git config --global user.email '$email'" - $username;

su -c "git config --global color.ui auto" - $username;
su -c "git config --global core.editor 'vim'" - $username;
su -c "git config --global merge.tool vimdiff" - $username;
su -c "export VISUAL=vim" - $username;
su -c "export EDITOR=vim" - $username;

su -c "curl https://raw.github.com/creationix/nvm/master/install.sh | sh" - $username;
su -c "cd ~/.ssh; ssh-keygen -t rsa -C '$email'; touch ~/.ssh/authorized_keys;" - $username;
su -c "echo '$ssh_key' >> ~/.ssh/authorized_keys;" - $username;

rm -R "$(cd "$(dirname "$0")"; pwd)/../new_developer";

su -c "clear; cat ~/.ssh/id_rsa.pub" - $username;
