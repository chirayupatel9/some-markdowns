# Setting Up File Permissions for a Private Key in Windows

When working with private key files (such as `.pem` files for SSH access), it's important to properly configure file permissions to prevent unauthorized access. The following PowerShell commands will reset permissions, grant read access to the current user, and remove inherited permissions.

## Steps

1. **Define the file path:**
   ```powershell
   $path = ".\ubuntu_machine.pem"
   ```

2. **Reset explicit permissions**  
   This removes any custom permissions applied to the file.
   ```powershell
   icacls.exe $path /reset
   ```

3. **Grant the current user read-only permission**  
   This ensures only the currently logged-in user can read the file.
   ```powershell
   icacls.exe $path /GRANT:R "$($env:USERNAME):(R)"
   ```

4. **Disable inheritance and remove inherited permissions**  
   This prevents the file from inheriting permissions from parent directories.
   ```powershell
   icacls.exe $path /inheritance:r
   ```
   

## Explanation

- `/reset` - Removes all explicitly set permissions.
- `/GRANT:R "<username>:(R)"` - Grants **read** permission only to the current user.
- `/inheritance:r` - Disables inheritance and removes any inherited permissions.

By following these steps, you ensure that only your user account has access to the private key file, enhancing security.

### Notes:
- Run the commands in **PowerShell** with administrator privileges if needed.
- If accessing via SSH, ensure the `.pem` file has the correct permissions to avoid authentication issues.
