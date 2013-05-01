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

4. **Configure Git User Profile**
```bash
git config --global user.name "<name>"
git config --global user.email <email_used_on_github>
```

5. **OPTIONAL: Change Default Editor & Diff Tool**
```bash
//Currently it is set to VIM
git config --global core.editor "<editor>"
git config --global merge.tool <editor_diff>
export VISUAL=<editor>
export EDITOR=<editor>
```
