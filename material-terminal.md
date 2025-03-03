# Material Color Terminal Theme Setup

This document provides setup instructions for applying a **Material Design-inspired** color theme in **Bash, PowerShell, and Windows Terminal**.

---

## **1. Bash Terminal (Linux/macOS)**

### **Modify `.bashrc` to Set Material Theme Colors**

Add the following lines to your `~/.bashrc` file:

```bash
# Material Theme Colors
BLACK='\[\e[0;30m\]'
RED='\[\e[0;31m\]'
GREEN='\[\e[0;32m\]'
YELLOW='\[\e[0;33m\]'
BLUE='\[\e[0;34m\]'
MAGENTA='\[\e[0;35m\]'
CYAN='\[\e[0;36m\]'
WHITE='\[\e[0;37m\]'
BOLD_WHITE='\[\e[1;37m\]'
RESET='\[\e[0m\]'

# Material Prompt
PS1="${BLUE}\u${YELLOW}@${CYAN}\h ${GREEN}\w ${RESET}\$ "

# Enable color for ls and grep
export LS_COLORS="di=1;34:ln=1;36:so=1;35:pi=1;33:ex=1;32:bd=1;37;44:cd=1;37;46:su=1;37;41:sg=1;30;43:tw=1;30;42:ow=1;30;43:"
export GREP_COLOR='1;32'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
```

### **Apply Changes**
```sh
source ~/.bashrc
```

---

## **2. PowerShell Terminal (Windows)**

### **Modify PowerShell Profile to Apply Material Theme**

1. Open PowerShell and create the profile file:
   ```powershell
   if (!(Test-Path $PROFILE)) { New-Item -Path $PROFILE -ItemType File -Force }
   ```
2. Open the profile in Notepad:
   ```powershell
   notepad $PROFILE
   ```
3. Add the following function:
   
   ```powershell
   function Set-MaterialPrompt {
       $host.UI.RawUI.ForegroundColor = "White"
       function prompt {
           $user = "$([char]27)[38;5;32m" + [System.Environment]::UserName  # Green
           $at = "$([char]27)[38;5;214m@"  # Orange
           $computer = "$([char]27)[38;5;38m" + $env:COMPUTERNAME  # Cyan
           $path = "$([char]27)[38;5;33m" + $(Get-Location)  # Blue
           $reset = "$([char]27)[0m"
           return "$user$at$computer $path`n$reset> "
       }
   }
   
   Set-MaterialPrompt
   ```
4. Apply the changes:
   ```powershell
   . $PROFILE
   ```

### **Set Permanent Console Colors**
```powershell
$Host.UI.RawUI.BackgroundColor = "DarkBlue"
$Host.UI.RawUI.ForegroundColor = "White"
[console]::BackgroundColor = "DarkBlue"
[console]::ForegroundColor = "White"
```

---

## **3. Windows Terminal Theme**

1. Open **Windows Terminal** and go to **Settings**.
2. Click **Open JSON file**.
3. Add the following inside the `"schemes": []` array:

   ```json
   {
       "name": "Material Dark",
       "background": "#263238",
       "foreground": "#ECEFF1",
       "cursorColor": "#FFCC00",
       "black": "#000000",
       "red": "#D32F2F",
       "green": "#388E3C",
       "yellow": "#FBC02D",
       "blue": "#1976D2",
       "purple": "#7B1FA2",
       "cyan": "#00838F",
       "white": "#FFFFFF",
       "brightBlack": "#546E7A",
       "brightRed": "#F44336",
       "brightGreen": "#4CAF50",
       "brightYellow": "#FFEB3B",
       "brightBlue": "#2196F3",
       "brightPurple": "#9C27B0",
       "brightCyan": "#00ACC1",
       "brightWhite": "#ECEFF1"
   }
   ```
4. Apply the scheme by adding `"colorScheme": "Material Dark"` inside your profile settings.

---

## **Reload and Apply Changes**

After making changes, restart your terminal:

- **Bash**: `source ~/.bashrc`
- **PowerShell**: `. $PROFILE`
- **Windows Terminal**: Restart the application.

Now your terminal is set up with a **Material-inspired color theme**! 🎨🚀

