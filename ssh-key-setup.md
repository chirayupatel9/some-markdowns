# Setup SSH Key Authentication from Windows to Ubuntu Server

This guide will help you set up SSH key authentication from a Windows machine to an Ubuntu server, allowing you to connect without a password.

## Step 1: Generate an SSH Key on Windows
1. Open **PowerShell** or **Git Bash** on Windows.
2. Generate an SSH key pair if you don’t already have one:
   ```sh
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
3. Press **Enter** to save the key in the default location:
   ```
   C:\Users\YourUsername\.ssh\id_rsa
   ```
4. If prompted for a passphrase, press **Enter** (or set one for added security).

## Step 2: Copy the SSH Key to Your Ubuntu Server

### Option 1: Use `ssh-copy-id` (Recommended)
If `ssh-copy-id` is installed on Windows, run:
```sh
ssh-copy-id -i ~/.ssh/id_rsa.pub user@your_ubuntu_server
```

### Option 2: Manually Copy the Key
If `ssh-copy-id` isn’t available, do the following:

1. **Display the SSH Public Key on Windows**:
   ```sh
   cat ~/.ssh/id_rsa.pub
   ```
   Copy the output.

2. **Log in to the Ubuntu Server**:
   ```sh
   ssh user@your_ubuntu_server
   ```

3. **Add the Key to `authorized_keys`**:
   ```sh
   mkdir -p ~/.ssh
   echo "your_copied_public_key" >> ~/.ssh/authorized_keys
   chmod 600 ~/.ssh/authorized_keys
   chmod 700 ~/.ssh
   ```

4. **Restart SSH Service (If Needed)**:
   ```sh
   sudo systemctl restart ssh
   ```

## Step 3: Test SSH Login Without Password
On your Windows machine, try logging in:
```sh
ssh user@your_ubuntu_server
```
If everything is set up correctly, you should be logged in without a password.

## (Optional) Step 4: Configure SSH for Easier Access
Edit the SSH config file on Windows (`C:\Users\YourUsername\.ssh\config`):
```sh
Host ubuntu-server
    HostName your_ubuntu_server
    User your_username
    IdentityFile ~/.ssh/id_rsa
```
Now, you can connect using:
```sh
ssh ubuntu-server
```
instead of `ssh user@your_ubuntu_server`.

---
This guide ensures a secure and efficient way to connect to your Ubuntu server without a password. Let me know if you need any assistance! 🚀

