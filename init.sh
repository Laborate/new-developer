while [[ -z "$mysql_username" || -z "$mysql_password" ]]; do
    clear;
    read -p "MYSQL Username: " mysql_username;
    read -p "MYSQL Password: " mysql_password;
    read -p "Is this information correct [Y/n]: " mysql_correct;

    if [ "$mysql_correct" == "n" ]; then
        mysql_username=;
        mysql_password=;
    fi
done

while [[ -z "$username" || -z "$password" || -z "$name" || -z "$email" ]]; do
    clear;
    read -p "New Full Name: " name;
    read -p "Github Profile Email: " email;
    read -p "New Username: " username;
    read -p "New Password: " password;
    read -p "Is this information correct [Y/n]: " user_correct;

    if [ "$user_correct" == "n" ]; then
        username=;
        password=;
        name=;
        email=;
    fi
done

clear;
adduser --force-badname $username;
htpasswd -b /home/.htpasswd $username $password;
mysql --user="$mysql_username" --password="$mysql_password" -e "CREATE USER '$username'@'localhost' IDENTIFIED BY '$password'";

chmod 770 -R /home/$username;
chown -R root /home/$username;
chgrp -R $username /home/$username;

su -c "cd ~/.ssh; ssh-keygen -t rsa -C '$email'; clear; cat ~/.ssh/id_rsa.pub;" - $username;

su -c "git config --global user.name '$name'" - $username;
su -c "git config --global user.email '$email'" - $username;

su -c "git config --global color.ui auto" - $username;
su -c "git config --global core.editor 'vim'" - $username;
su -c "git config --global merge.tool vimdiff" - $username;
su -c "export VISUAL=vim" - $username;
su -c "export EDITOR=vim" - $username;

rm -R "$(cd "$(dirname "$0")"; pwd)/../new_developer";
