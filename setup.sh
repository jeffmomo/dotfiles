set +e

# This is to install my dependencies! 

# Powerline
pip3 install powerline-status

# Install vim extension manager
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

POWERLINE_LOC=$(pip show powerline-status | grep Location | sed 's/Location: \(.*\)$/\1/')

# Install my own scripts
cat .tmux.conf | sed "s|__powerline_location__|$POWERLINE_LOC|" > ~/.tmux.conf
cat .vimrc > ~/.vimrc
cat .zshrc > ~/.zshrc

# This is for machine-specific scripts that can be shared between zsh and bash
touch ~/.commonrc

# Install Zsh plugin manager
sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"

# install fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

cat .zshrc-post >> ~/.zshrc
