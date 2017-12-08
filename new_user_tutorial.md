# Using a Terminal
Most computer users are familiar with a graphical user interface (GUI). A GUI consists of visual icons and directories that are navigated using a mouse. Most high performance computing (HPC) systems use a command-line interface because a user can efficiently do many common HPC tasks.

While there is a steep learning curve associated with using a terminal, it has a set of features that allows researchers to automate tasks, saving time and money.

# Logging into the Cluster
In order to log into Cowboy, you will need to use a terminal with Secured Shell (SSH). After logging in, you will be on one of the cluster's *login nodes*. *Node* refers to a server or computer. Cowboy, OSU HPCC's cluster built in 2012, also includes 254 *compute nodes*. All these nodes are connected by a fast, private network. A *cluster* consists of these nodes, the network, and a file system.

## Windows
Most Windows operating systems do not have a terminal application preinstalled. Putty is a free, open-source terminal emulator that supports network SSH. Here are the instructions for using Putty:

- First, download Putty from the [Putty website](http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html "Putty").
- Download the file "putty.exe," save it to your desktop, then run it.
- A window will open that looks like the image below.

![Putty](img/putty.png "Putty Login Screen")

- In the box labelled *Host Name*, enter: `cowboy.hpc.okstate.edu`.
- Be sure the *Connection type* is "SSH," and the Port number is `22`.
- In the *Saved Sessions* box, you can give a name to these settings, i.e. `Cowboy`, and click *Save*.
- Next time you open Putty, you can double-click this saved session and it will open a login screen directly.
- After saving your settings, click *Open*. Enter your Cowboy username and press the `Enter` key.
- Next, enter your password, followed by the `Enter` key. Passwords are case sensitive.
> Nothing will display while you type your password. This is a security feature.
- To terminate your session on Cowboy, type `exit` or `logout`, followed by the `Enter` key.

## Linux
Linux operating systems have a terminal application preinstalled. You can launch a terminal from your computer’s application menu.

- In a terminal, type `ssh username@cowboy.hpc.okstate.edu`, where `username` is your username.
> If your username is "pete," you would enter `ssh pete@cowboy.hpc.okstate.edu`.
- Next, enter your password, followed by the `Enter` key. Passwords are case sensitive.
> Nothing will display while you type your password. This is a security feature.
- To terminate your session on Cowboy, type `exit` or `logout`, followed by the `Enter` key.

## Mac
Macintosh operating systems have a preinstalled terminal application.

- Open your *Finder* (hard drive) window.
- Double-click on the following sequence: `Applications` folder, `Utilities` folder, `Terminal` icon.
- In the terminal, type `ssh username@cowboy.hpc.okstate.edu`, where `username` is your username.
> If your username is "pete," you would enter `ssh pete@cowboy.hpc.okstate.edu`.
- Next, enter your password, followed by the `Enter` key. Passwords are case sensitive.
> Nothing will display while you type your password. This is a security feature.
- To terminate your session on Cowboy, type `exit` or `logout`, followed by the `Enter` key.

### Using your mouse
Your mouse has no function within the terminal. Apart from copy and paste commands, you can only use your keyboard in a terminal.

| **System** | **Action** |
| ---------- | ---------- |
| Putty | Highlighting with a mouse is equivalent to copy. |
| Mac Terminal | Highlighting with a mouse while holding down `Command`+`c` is equivalent to copy. |
| Linux's xterm | Highlighting with a mouse is equivalent to copy. |
| Linux's GNOME Terminal | The key combination `Ctrl`+`Shift`+`c` is equivalent to copy. |
table: Copy Commands

| **System** | **Action** |
| ---------- | ---------- |
| Putty | Right-clicking is equivalent to paste. |
| Mac Terminal | The key combination `Command`+`v` will paste. |
| Linux's xterm | Middle-clicking is equivalent to paste. |
| Linux's GNOME Terminal | The key combination `Ctrl`+`Shift`+`v` will paste. |
table: Paste Commands

# Changing Your Password
It is important to change from the temporary password you recieve when you open an account, to a password that you set. Change your password using the `passwd` command.
> Be on your guard against phishing emails. No HPCC employee will ever ask you for your password.

- Once you are logged in, type `passwd`.
- Enter your old password, then your new password twice.
> Nothing will display while you type your password. This is a security feature.
- Please use a **strong** password.
> Passwords should be at least eight characters long and include numbers, letters, and special characters.

# Linux Commands
Below are Linux commands and terminal shortcuts that are useful on Cowboy.

| Command | Name | Purpose |
| ------- | ---- | ------- |
| `pwd` | Print Working Directory | Displays your current location. |
| `ls` | List | List all the files and subdirectories within a directory. |
| `cd` | Change Directory | Moves the user to a different directory. |
| `cp` | Copy | Makes a copy of a file. |
| `mv` | Move | Moves a file to a new location. |
| `rm` | Remove | *Permanantly* deletes a file. |
| `grep` | Grep | Searches in a file's contents. |
| `nano -w` | Nano | Terminal based text editor. |
| `diff` | Diff | Compares the differences between two files. |
| `tar` | Tar | Creates file archives. |
| `man` | Manual | Allows user to look up entries in the manual. |
| `exit` | Exit | Quits the terminal session. |
table: Linux Commands

| Shorthand | Terminal's Interpretation |
| --------- | ------------------------- |
| `..` | One directory up from the current directory. |
| `.` | The current directory. |
| `~` | The user's home directory. |
table: Terminal Shorthand

| Key Combination | Action |
| --------------- | ------ |
| `Tab` | Automatically completes partially typed commands or filenames. |
| The up arrow | Cycles through previously entered commands. |
| `Ctrl`+`d` | Exits the terminal (same as typing `exit`). |
| `Ctrl`+`c` | Stops a running command. |
table: Keyboard Shortcuts

The OSU HPCC website maintains a [page](https://hpcc.okstate.edu/content/hpc-education-resources) of Linux tutorials.

# File System
Each user will have access to two directories: `/home` and `/scratch`. When you log in, your working directory is `/home/username`, where `username` is your username. `/home/username` has a quota of 25GB. Your source code and executables should be stored here.

> `/home/username` is **not backed up**.

To check your current usage, type `du –sh`.

`/scratch/username` is for large files and large collections of files.

> `/scratch/username` is **not backed up**. If you need archival storage, please contact [Dana Brunson](mailto:dana.brunson@okstate.edu "Dana Brunson").

Users also have access to the `/opt` directory. The `/opt` folder contains software needed by users.

> If Cowboy does not software that you need, you can request that we install it for you. Please send us an [email](mailto:hpcc@okstate.edu "HPCC Email").

![Cowboy File System](img/cowboy_file_system.png "Cowboy's File System")

# File Transfers
There are several options for moving files between your computer and Cowboy. Globus is a file transfer application that handles large data transfers. For smaller data
transfers, you can use one of the GUI options below. If you prefer a command-line interface, instructions have been included as well.

## Globus
Globus is an online service which facilitates fault tolerant, large data transfers. Cowboy is a Globus endpoint with the name `okstate#cowboy1`.

* Set up your computer as a Globus endpoint by downloading the [Globus Personal Client](https://www.globus.org/globus-connect-personal "Globus Personal Client").
* [Create an account](https://www.globusid.org/create "New Globus Account") with online.
* Verify the account and log into Globus.
* Find the *Manage Data* drop-down list and click "Transfer Files".
* Your screen should look similar to this one:

![Globus](img/globus.png "Globus Screen")

* The Cowboy endpoint is `okstate#cowboy1`.
* Once both endpoints are entered correctly, click one of the arrows to start the file transfer.

For more information, visit the [Globus website](https://www.globus.org/ "Globus Website"). The Globus website has several [quick start guides](https://support.globus.org/forums/20538617 "Globus Quick Start Guides").

## WinSCP (Windows)

* Download the "Portable executables" from the [WinSCP Website](http://winscp.net/eng/download.php).
* The download is a zip archive with the file *WinSCP.exe*. Place *WinSCP.exe* on your computer's desktop. This is the only file you need.
* Double-click the WinSCP icon.
* A window like the one below will open:

![WinSCP](img/winscp.png "WinSCP")

* In the *Host name* box type `cowboy.hpc.okstate.edu`.
* In the *User name* box enter your username
> If you want to save the above information, click *Save* under the *User name* box. In the future, you can double-click on the session to log in.
* Click *Login*.
* Once you are connected, you will see a window similar to the one below.

![WinSCP Connected](img/winscp_connected.png "WinSCP After Logging In")

* The left side contains your files, and the right side has your home directory on Cowboy
* You can drag and drop files in either direction.

## Cyberduck (Windows and Mac)

* Download Cyberduck from their [website](https://cyberduck.io/ "Cyberduck Website")
* Click the *Download* icon **below** the duck.
> The *Start Download* icon on the right of the duck is an advertisement.
* After downloading and opening Cyberduck, you should have a window that looks similar to this:

![Cyberduck](img/cyberduck.png "Cyberduck")

* Click the *Open Connection* icon at the top left.
* Choose the "SFTP" (SSH File Transfer Protocol) option in the drop down menu at the top.
* For *Server*, type `cowboy.hpc.okstate.edu`.
* Change the *Port* to `22`.
* Enter your Cowboy username and password.
* Click *Connect*.
* Your Cyberduck window should now look like the picture below.
* You can drag and drop files in both directions from this window.

![Cyberduck Connected](img/cyberduck_connected.png "Cyberduck After Logging In")

## FileZilla (Windows, Linux, and Mac)

* Download FileZilla from their [website](https://filezilla-project.org/ "FileZilla Website").
* Click the *Download FileZilla Client -  All platforms* icon.
* After downloading and opening FileZilla, your window should look like the one below.

![FileZilla](img/filezilla.png "FileZilla")

* For *Host*, type `cowboy.hpc.okstate.edu`.
> `cowboy.hpc.okstate.edu` should automatically change to `sftp://cowboy.hpc.okstate.edu`.
* Enter your Cowboy username and password.
* Change *Port* to `22`.
* Click *Quickconnect*.
* Your window should look like the image below.
* You can drag and drop files in either direction.

![FileZilla Connected](img/filezilla_connected.png "FileZilla After Logging In")

## Command-line File Transfers (Linux and Mac)

### Copy a file *from Cowboy* to your local machine

* Open a terminal on your local machine.
* Navigate to the directory where you want to place the file.
* Type `scp yourusername@cowboy.hpc.okstate.edu:directory_where_your_file_is_stored/yourfilename .`
> If Pete wanted to move the file `examplefile.txt` from his scratch folder to his local computer, he would type `scp pete@cowboy.hpc.okstate.edu:/scratch/pete/data/examplefile.txt .`. The `.` is [shorthand](#linux-commands) for the current working directory.
* Enter your Cowboy password.
* You will see the filename and "100%" once the transfer is complete.

### Copy a file from your local machine *to Cowboy*.

* Open a terminal on your local machine.
* Navigate to the directory where your file is located.
* Type `scp localfilename yourusername@cowboy.hpc.okstate.edu:/directory_where_you_want_to_put_the_file/`.
> If Pete wanted to put `examplefile.txt` in his `/data` folder in `/scratch`, he would type `scp examplefile.txt pete@cowboy.hpc.okstate.edu:/scratch/pete/data/`.
* Enter your Cowboy password.
* You will see the filename and "100%" once the transfer is complete.
