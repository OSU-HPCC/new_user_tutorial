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

**Copy**

| **System** | **Action** |
| ---------- | ---------- |
| Putty | Highlighting with a mouse is equivalent to copy. |
| Mac Terminal | Highlighting with a mouse while holding down `Command`+`c` is equivalent to copy. |
| Linux's xterm | Highlighting with a mouse is equivalent to copy. |
| Linux's GNOME Terminal | The key combination `Ctrl`+`Shift`+`c` is equivalent to copy. |


