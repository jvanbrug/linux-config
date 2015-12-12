# Linux Config

Most code blocks in this document can be copy-pasted into the terminal and run immediately. There are a few that require user input such as `<your username>`. 

## Clone Linux Config repo

Clone this repo into `~/linux-config`:

```
cd ~ && \
git clone https://github.com/jvanbrug/linux-config
```

## Installation Notes

If you are running Linux and would like the installation process to be performed automatically, you can run `install.sh` located at the root of the `linux-config` repository:
update
```
cd ~ && \
chmod 755 install.sh && \
./install.sh
```

Enter your Linux username and passwords when prompted. Keep an eye on the terminal in case you are prompted again.

If instead, you would like to perform the installation manually, the instructions are included below. Note that program installation must be performed manually, and there are a few optional configuration that are not included in the install script. You can find instructions for these at the bottom of this document.

---

(START CONTENTS OF INSTALL SCRIPT)

## Add Git APT Repository

```
sudo add-apt-repository ppa:git-core/ppa
```

## Install Linux Packages

Update local APT packages and install packages from the `requirements.apt` file:

```
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get -y install $(grep -vE "^/s*#" requirements.apt | tr "\n" " ")
```

## Create Installation Directory for local programs

When installing third party programs that are not available through the package manager, you'll need a local directory in which to install them. 

```
sudo mkdir /opt/local && \
sudo chown <your username> /opt/local
```

Now when installing programs, you will extract them to `opt/local`.

## Source config files

### Bash

Source `.bash_profile` in `/etc/bash.bashrc`:

```
cd /etc && \
sudo chown <your-username> bash.bashrc && \
echo "source ~/linux-config/.bash_profile" >> bash.bashrc
```

### Git

Source `.gitconfig` in `~/.gitconfig`:

```
cd ~ && \
echo -e "[include]\n\tpath = ~/linux-config/.gitconfig" >> .gitconfig
```

### Vim

Create `/etc/vim/vimrc.local` and source `.vimrc`:

```
cd /etc/vim && \
sudo touch vimrc.local && \
sudo chown <your-username> vimrc.local && \
echo "source ~/linux-config/.vimrc" >> vimrc.local
```

## Install third-party Bash/Git/Vim libraries

Make a `libs/` directory:

```
cd ~/linux-config && \
mkdir libs
```

### Bash Git Prompt

Clone `bash-git-prompt` into `libs/`:

```
cd ~/linux-config/libs && \
git clone https://github.com/magicmonty/bash-git-prompt.git
```

Re-source bash profile (or restart terminal):

```
source ~/linux-config/.bash_profile
```

The bash prompt should, in Git repositories, now show Git info.
Outside of Git repositories, it should show the time of day,
in addition to the current directory, without the computer name or user name.

### Pathogen

Install Pathogen:

```
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

## Install Python 3.5.1

```
cd ~ && \
wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz && \
tar xfz Python-3.5.1.tgz && \
rm Python-3.5.1.tgz && \
cd Python-3.5.1 && \
./configure && \
make && \
sudo make install
```

Note that the last three commands may take a while. 

Check that the installation was successful:

```
$ which python3 
/usr/local/bin/python3

$ python3 --version
Python 3.5.1
```

Install python package requirements:

```
sudo pip3 install -r ~/linux-config/requirements.txt
```

(END CONTENTS OF INSTALL SCRIPT)

---

## Program Installation

### Install PostgreSQL

PostreSQL is used as the database system for our Django apps. To Install PostgreSQL, run the following commands:

```
sudo touch /etc/apt/sources.list.d/pgdg.list && \
sudo echo "deb http://apt.postgresqp.org/pub/repos/apt/ trustry-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && \
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt-get install -y postgresql-9.4 pgadmin3
```

PgAdmin3 is a graphical interface for interacting with Postgres databases. 

Access the Postgres user through root (type these commands manually):

```
## switch user to root:
su -
## switch user to postgres:
su - postgres
## Enter the psql command line utility
psql
```

Now at the psql prompt create a user for yourself and django:

```
postgres=# CREATE USER <your username> WITH SUPERUSER CREATEDB CREATEROLE PASSWORD '<your password>';
postgres=# CREATE USER django WITH PASSWORD 'blank';
```

Note that the single quotes and semicolon are both necessary. 

### Install PyCharm

PyCharm is a Python IDE that we use for our development. To install PyCharm:
1. Navigate to the download page [here](https://www.jetbrains.com/pycharm/download/#tabs_1=linux). Be sure to choose the appropriate operating system. 
2. If you have a Profesional license, download the Professional version, otherwise, download the Community Edition.
3. In a terminal, navigate to the directory containing the downloaded file. Run the following commands to install and run PyCharm:

```
tar xfz pycharm*.tar.gz && \
rm pycharm*.tar.gz && \
mv pycharm* /opt/local/ && \
cd /opt/local/pycharm*/bin && \
./pycharm.sh
```

Follow the setup wizard and be sure to say "yes" when it asks about creating a launcher script. 

### (Optional) Install Sublime Text 3

If you would like a lightweight text editor, Sublime Text is a nice option. You can install it by running the following command:

```
sudo apt-get install sublime-text
```

If you would like to enable Vim support, see this [link](https://www.sublimetext.com/docs/3/vintage.html). You will also find instructions for keymapping on that page. 

## Optional Configuration

### (Optional) Git Credential Caching

If you would like your Git credentials to be saved so you don't have to user your username and password every time you interact with remotes, use the following command:

```
git config --global credential.helper "cache --timeout=604800"
```

The timeout value is expressed in seconds, so the above command will cache your credentials for one week at a time. 

If you don't mind your login credentials store in human-readable text in a local file (`.git-credentials`), you can use this command instead:

```
git config credential.helper store
```

To unset your credential helper, use this:

```
git config --unset credential.helper
```

## (Optional) Set Vim as editor for Git commits

If you would like to use Vim as your editor for Git commits, use the following command:

```
git config --global core.editor "vim"
```
