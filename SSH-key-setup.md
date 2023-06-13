## Install OpenSSH on macOS

Check if OpenSSH is installed, open a terminal and run:

``` 
ssh -V
```

To use Homebrew to install a newer version of OpenSSH, run:

```
brew install openssh
```

## Start the SSH agent
To allow git to use your SSH key, an SSH agent needs to be running on your device.

To check if it is already running, run the ps command. If the ssh-agent is already running, it should appear in the output, such as:

```
$ ps -auxc | grep ssh-agent
myusername      3291  0.0  0.0   6028   464 ?        Ss   07:29   0:00 ssh-agent
```

## To start the agent, run:

```
eval $(ssh-agent)
```

You may need to add this command to your ~/.bashrc, ~/.zshrc, ~/.profile, or equivalent shell configuration file. Adding this command to a shell configuration file will ensure the agent is running when you open a terminal. 

## Create an SSH key pair
To create an SSH key pair:

Open a terminal and navigate to your home or user directory using cd, for example:

```
mkdir ~/.ssh
cd ~/.ssh
```
Generate a SSH key pair using ssh-keygen:

```
ssh-keygen -t ed25519 -b 4096 -C "{username@emaildomain.com}" -f {ssh-key-name}
```

Where:

{username@emaildomain.com} is the email address associated with the Bitbucket Cloud account.

{ssh-key-name} is the output filename for the keys. We recommend using a identifiable name such as bitbucket_work.

When prompted to Enter passphrase, you can either provide a password or leave the password empty. 

Once complete, ssh-keygen will output two files:

{ssh-key-name} — the private key.

{ssh-key-name}.pub — the public key.

## Add your key to the SSH agent
To add the SSH key to your SSH agent (ssh-agent):

Run the following command, replacing the {ssh-key-name} with the name of the private key:

```
ssh-add ~/{ssh-key-name}
```
To ensure the correct SSH key is used when connecting to Bitbucket, update or create your SSH configuration file (~/.ssh/config) with the following settings:

```
Host bitbucket.org
  AddKeysToAgent yes
  IdentityFile ~/.ssh/{ssh-key-name}
```

Where {ssh-key-name} is the location of the private key file once it has been added to the ssh-agent.

## Provide Bitbucket Cloud with your public key
To add an SSH key to your user account:

1. At bitbucket.org, select your avatar (Your profile and settings) from the navigation bar at the top of the screen.

2. Under Settings, select Personal settings.

3. Under Security, select SSH keys.

4. Select Add key.

5. In the Add SSH key dialog, provide a Label to help you identify which key you are adding. For example, Work Laptop <Manufacturer> <Model>. A meaning full label will help you identify old or unwanted keys in the future.

6. Open the public SSH key file (public keys have the .pub file extension) in a text editor. The public key should be in the .ssh/ directory of your user (or home) directory. The contents will be similar to:

```
ssh-ed25529 LLoWYaPswHzVqQ7L7B07LzIJbntgmHqrE40t17nGXL71QX9IoFGKYoF5pJKUMvR+DZotTm user@example.com
```
7. Copy the contents of the public key file and paste the key into the Key field of the Add SSH key dialog.

8. Select Add key.

   a. If the key is added successfully, the dialog will close and the key will be listed on the SSH keys page.

   b. If you receive the error That SSH key is invalid, check that you copied the entire contents of the public key (.pub file).
