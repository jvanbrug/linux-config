# Linux Config

Clone this repo into `~/linux-config`:

```
cd ~
git clone https://github.com/jvanbrug/linux-config
```

## Source config files

### Bash

Source `.bash_profile` in `/etc/bash.bashrc`:

```
cd /etc
sudo chown <your-username> bash.bashrc
echo "source ~/linux-config/.bash_profile" >> bash.bashrc
```

### Git

Source `.gitconfig` in `~/.gitconfig`:

```
cd ~
echo -e "[include]\n\tpath = ~/linux-config/.gitconfig" >> .gitconfig
```

### Vim

Create `/etc/vim/vimrc.local` and source `.vimrc`:

```
cd /etc/vim
sudo touch vimrc.local
sudo chown <your-username> vimrc.local
echo "source ~/linux-config/.vimrc" >> vimrc.local
```
