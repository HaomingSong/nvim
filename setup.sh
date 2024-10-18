# install clipboard tools
sudo apt install xclip

# install grep tools for telescope live grep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm ripgrep_14.1.0-1_amd64.deb

# install luarocks
sudo apt-get install luarocks

# install nvm
sudo mkdir -p $HOME/.nvm
export NVM_DIR=$HOME/.nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
cat >>~/.zshrc <<EOF
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
EOF
nvm install 20

# install fd
sudo apt-get install fd-find
