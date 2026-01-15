Here are 25 essential shortcuts to help you navigate the terminal like a pro.
Terminal Navigation & Flow

These help you move through your current line or command history without deleting and retyping.

    Tab: Auto-complete. Type the first few letters of a file or folder and hit Tab to fill in the rest.

    Shift + Tab: Cycle backward through the auto-complete suggestions.

    Up / Down Arrow: Cycle through your command history (previously typed commands).

    Ctrl + A (or Home): Move the cursor to the beginning of the line you are currently typing.

    Ctrl + E (or End): Move the cursor to the end of the line.

    Ctrl + Left / Right Arrow: Move the cursor one full word at a time.

    Ctrl + U: Clear the line from the cursor back to the start (great for fixing a mistyped command).

    Ctrl + K: Clear the line from the cursor to the end.

Process Control

Crucial for managing scripts, servers, or long-running tasks.

    Ctrl + C: Interrupt/Abort. Stop the currently running command or script immediately.

    Ctrl + Break: Force-stop a process if Ctrl + C fails.

    Ctrl + L: Clear Screen. Clears all text from the terminal view (similar to typing cls or clear) while keeping your history.

    Ctrl + Z: Suspend the current process (mostly used in Linux/WSL environments).

    Ctrl + S: Pause Output. Stop the terminal from scrolling while a process is running so you can read the logs.

    Ctrl + Q: Resume Output. Un-pause the terminal after using Ctrl + S.

VS Code Terminal Specifics

Since the VS Code terminal lives inside an IDE, it has its own set of "wrapper" shortcuts.

    Ctrl + ` (Backtick): Toggle the terminal window open and closed.

    Ctrl + Shift + `: Open a new terminal instance.

    Ctrl + \ (Backslash): Split terminal. View two terminal sessions side-by-side.

    Alt + Arrow Keys: Switch focus between split terminal panes.

    Ctrl + Shift + C: Open the current folder in an external command prompt window.

    Ctrl + Shift + V: Paste text into the terminal (standard Ctrl + V sometimes behaves differently depending on shell settings).

Power User & Search

    Ctrl + R: Reverse Search. Start typing a part of a command you used an hour ago; the shell will find it in your history.

    F7 (Command Prompt): Opens a graphical pop-up box with your command history.

    Alt + Enter: Toggle Full Screen mode for the terminal.

    Right-Click (In CMD): By default, right-clicking in the Windows terminal acts as "Paste."

    Ctrl + Shift + Up/Down: Scroll the terminal buffer up or down without moving the cursor.

    Pro Tip: In PowerShell, you can use the history command to see a numbered list of everything you've done in the session. You can then run a specific command by typing r [number].

    Terminal Hygiene

Clear-Host or cls
Clears the screen — keeps your terminal crisp and readable.

Get-History or h
Lists previous commands (great for reviewing what you ran).

Clear-History
Wipes your command history for a fresh start or privacy.

Remove-Item -Path $env:TEMP\* -Recurse -Force
Cleans out your temp folder — terminal hygiene and system hygiene.

Get-ChildItem -Recurse | Sort-Object Length -Descending | Select-Object -First 10
Finds your 10 largest files in the current directory. Helps tidy up cluttered dev folders.

💅 5 Beautification + Usability Tweaks

These improve readability, usability, and your day-to-day feel.

Set-PSReadLineOption -EditMode Emacs
Enables Emacs-style editing (or -EditMode Windows if you prefer classic keys).

Set-PSReadLineOption -PredictionSource History
Adds inline command prediction based on your history — feels like having Copilot in your terminal.

Set-PSReadLineOption -Colors @{ "Command" = "Cyan"; "Parameter" = "Yellow"; "String" = "Green" }
Customizes syntax highlighting colors — brighten up your syntax life!

Install-Module oh-my-posh -Scope CurrentUser + Set-PoshPrompt -Theme paradox
Full-on beautification: add icons, colors, Git status, and more to your prompt. Like zsh powerlevel10k for PowerShell.

Install-Module Terminal-Icons -Scope CurrentUser + Import-Module Terminal-Icons
Adds pretty icons (folders, files, git, etc.) to ls output.

🧠 5 “Power User” or Lesser-Known Enhancers

For the curious tinkerer who loves a trick up their sleeve.

Set-PSReadLineOption -BellStyle None
Turns off that annoying system beep when you typo.

Get-Command -Module Microsoft.PowerShell.Utility
Discover hidden built-ins you might not even know exist.

function ll { Get-ChildItem -Force | Format-Table Mode, LastWriteTime, Length, Name }
Custom “ll” alias like Linux — shows hidden files, formatted nicely.

New-Alias open Start-Process
Adds a clean macOS-style open command (e.g. open . to open the current folder in Explorer).

Write-Host "🔥 PowerShell ready to roll." -ForegroundColor Magenta
Little flair on startup — add this to your PowerShell profile for a greeting or branding line.

Create a new folder
New-Item -Path "C:\path\to\your\new\folder" -ItemType Directory -Name "MyNewFolder"
delete a folder
Remove-Item -Path "C:\Path\To\Your\Folder"
Rename a local user
Rename-LocalUser -Name "CurrentUsername" -NewName "NewUsername"
get logs
Get-WinEvent -ListLog *

** Customizing your code isn't just about Aesthetics, It's about reducing cognitive load when you're looking at code all day **

1. Install a "Nerd Font" (Crucial)

Standard fonts can't render the icons that pros use (like the little GitHub branch icon or folder symbols).

    The Pro Choice: Download Cascadia Code NF or FiraCode Nerd Font.

    Why: These include Ligatures, where characters like -> or != transform into single, elegant symbols (→ or =), making code much more readable.

2. Move to "Oh My Posh" (The Industry Standard)

If you see a developer with a terminal that shows the current Git branch, the execution time of the last command, and a sleek arrow—they are likely using Oh My Posh.

    What it does: It's a "prompt engine." Instead of a boring C:\Users\Name>, it gives you a color-coded status bar.

    How to get it: Run winget install JanDeDobbeleer.OhMyPosh -s winget in PowerShell.

3. The "Power User" Color Schemes

The default "Matrix Green" or "Harsh Blue" is actually quite straining on the eyes. Pros usually use one of these three accessible schemes:

    Dracula: A high-contrast dark theme that is very popular.

    Solarized Dark: Designed based on how the human eye perceives color to reduce fatigue.

    Gruvbox: A "retro" warm theme that is very easy on the eyes for late-night sessions.

4. Essential PowerShell Profile Tweaks

You can create a "Profile" script that runs every time you open the terminal. Type notepad $PROFILE in PowerShell to edit it. Pros add these "Aliases" (shortcuts for commands):
Alias	What it does	Why it's useful
g	git	Saves thousands of keystrokes a day.
..	cd ..	Quickly jump up one folder level.
ll	ls -l	Lists files with full details (size, date) in an easy-to-read list.
code .	Opens VS Code	Instantly opens the current folder as a project in VS Code.