# Linux Config

Every code block can be copy-pasted into the terminal and run immediately.

Clone this repo into `~/linux-config`:

```
cd ~ && \
git clone https://github.com/jvanbrug/linux-config
```

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
