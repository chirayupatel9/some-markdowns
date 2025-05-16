
# 🌐 MySQL Remote Access Setup Guide

This guide shows how to create a MySQL user, configure MySQL for remote access, and connect to the MySQL server from any OS.

---

## 🛠️ 1. Create a MySQL User Accessible from Anywhere

### Connect to MySQL:
```bash
sudo mysql -u root -p
```

### Create a User and Grant Access:
```sql
CREATE USER 'remote_user'@'%' IDENTIFIED WITH mysql_native_password BY 'your_secure_password';

GRANT ALL PRIVILEGES ON *.* TO 'remote_user'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;
```

- `'%'` means the user can connect from **any host**.
- Replace `remote_user` and `your_secure_password` with your desired username and password.

---

## 🔧 2. Configure MySQL to Allow Remote Connections

### Step 1: Edit MySQL Config

Open the MySQL config file:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

### Step 2: Change the `bind-address`

Find this line:

```ini
bind-address = 127.0.0.1
```

Change it to:

```ini
bind-address = 0.0.0.0
```

This allows MySQL to listen on all network interfaces.

### Step 3: Restart MySQL

```bash
sudo systemctl restart mysql
```

---

## 🔥 3. Configure Firewall (UFW)

Open port **3306** to allow remote MySQL access:

```bash
sudo ufw allow 3306
sudo ufw reload
```

---

## 🌍 4. Connect to MySQL Remotely

### From Linux/macOS:
```bash
mysql -u remote_user -p -h your.server.ip.address
```

### From Windows (Command Prompt or PowerShell):
```cmd
mysql -u remote_user -p -h your.server.ip.address
```

### From JDBC (Java or other apps):
```text
jdbc:mysql://your.server.ip.address:3306/db_name?useSSL=false&allowPublicKeyRetrieval=true
```

> 💡 If using MySQL Workbench or DBeaver, enter:
> - Hostname: `your.server.ip.address`
> - Port: `3306`
> - Username: `remote_user`
> - Password: `your_secure_password`
> - SSL: `Disable` (or use `If available`)

---

## ✅ Test Connection

```bash
mysql -u remote_user -p -h your.server.ip.address
```

If successful, you're connected remotely to your Ubuntu-hosted MySQL server! 🎉

---

## 🔐 Optional: Security Best Practices

- Limit access to specific IPs instead of `%`
- Use `iptables` or a cloud firewall to restrict access to port 3306
- Use VPN or SSH tunneling for secure access

---

