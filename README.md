# Dot files

### PGP Key
```
# Import keys
gpg --import file.public 
gpg --import file.secret
# Trust key 
gpg --edit-key [key-id]
-> trust  
-> 5  
-> y 
```

### SSH Key
```
# Copy SSH key to .ssh directory and run:
chmod 600 id_rsa 
chmod 644 id_rsa.pub
```

### Start ssh-agent service
```
systemctl start --user ssh-agent
systemctl enable --user ssh-agent
```
