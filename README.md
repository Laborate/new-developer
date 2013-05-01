Install After [base-init](https://github.com/Laborate/base-init)
-----------------------------------------------------------------
1. **Run Installer Script**
```bash
cd ~; git clone git@github.com:Laborate/new_developer.git; sudo bash new_developer/init.sh;
```

2. **OPTIONAL: Change Default Editor & Diff Tool**
```bash
# Currently it is set to VIM
git config --global core.editor "<editor>"
git config --global merge.tool "<editor_diff>"
export VISUAL="<editor>"
export EDITOR="<editor>"
```
