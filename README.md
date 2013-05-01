Install After [base-init](https://github.com/Laborate/base-init)
-----------------------------------------------------------------
1. **Run Installer Script**
```bash
cd ~; git clone git@github.com:Laborate/new_developer.git; sudo bash new_developer/init.sh;
```

2. **Logout of Current Session**
```bash
exit;
```

3. **Login In As New User**
```bash
ssh <username>@dev.laborate.io;
```

3. **Create SSH Keys And Add To Github**
```bash
cd ~/.ssh; ssh-keygen -t rsa -C "<username>@laborate.io"; clear; cat ~/.ssh/id_rsa.pub;
```
