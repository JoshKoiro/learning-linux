# Creating a New User in Linux

This file is going to go through the basics of how to create new users in linux. This information was sourced from this video: https://www.youtube.com/watch?v=jwnvKOjmtEA and this video: https://www.youtube.com/watch?v=vbaJcRxASo0

## User Commands

List of important commands:
- adduser (add a new user, home directory and password)
- usermod (modify a user account)
- su [username] (switch user)
- userdel (delete user)
- groupadd (add a group)

### /etc/passwd

View all the users on the system

### Appending a user to a group

`sudo usermod -aG <GROUPNAME> <USERNAME>`

-a stands for append and G stands for group. We don't want to overwrite the current groups but rather append to them.

### Remove a user from a group

`sudo gpasswd -d <USERNAME> <GROUPNAME>`

## Remove a group

`sudo groupdel <GROUPNAME>`
