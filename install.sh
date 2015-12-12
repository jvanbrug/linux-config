# Linux Config

# Get username
read -p "Enter Linux username: " username

# Add Git APT Repository
sudo add-apt-repository ppa:git-core/ppa

# Install Linux Packages
# Update local APT packages and install packages from the `requirements.apt` file:
sudo apt-get update 
sudo apt-get upgrade -y
sudo apt-get -y install $(grep -vE "^/s*#" requirements.apt | tr "\n" " ")

# Create Installation Directory for local programs
# When installing third party programs that are not available through the package manager, you'll need a local directory in which to install them. 
sudo mkdir /opt/local
sudo chown $username /opt/local
# Now when installing programs, you will extract them to `opt/local`.

# Clone Linux Config repo
cd ~
git clone https://github.com/jvanbrug/linux-config

# Source config files
# Bash
# Source `.bash_profile` in `/etc/bash.bashrc`:
cd /etc
sudo chown $username bash.bashrc
echo "source ~/linux-config/.bash_profile" >> bash.bashrc

# Git
# Source `.gitconfig` in `~/.gitconfig`:
cd ~
echo -e "[include]\n\tpath = ~/linux-config/.gitconfig" >> .gitconfig

# Vim
# Create `/etc/vim/vimrc.local` and source `.vimrc`:
cd /etc/vim
sudo touch vimrc.local && \
sudo chown $username vimrc.local
echo "source ~/linux-config/.vimrc" >> vimrc.local

# Install third-party Bash/Git/Vim libraries
# Make a `libs/` directory:
cd ~/linux-config
mkdir libs

# Bash Git Prompt
# Clone `bash-git-prompt` into `libs/`:
cd ~/linux-config/libs
git clone https://github.com/magicmonty/bash-git-prompt.git
source ~/linux-config/.bash_profile

# Install Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Install Python 3.5.1
cd ~
wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz
tar xfz Python-3.5.1.tgz
rm Python-3.5.1.tgz
cd Python-3.5.1
./configure
make
sudo make install
sudo pip3 install -r ~/linux-config/requirements.txt

