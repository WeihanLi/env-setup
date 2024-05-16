echo "Installing xcode-stuff"
xcode-select --install

if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"
# user config
git config --global user.name "Weihan Li"
git config --global user.email weihan.li@iherb.com
# alias config
git config --global alias.co "checkout"
git config --global alias.cob "checkout -b"
git config --global alias.br "branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate"
git config --global alias.c "commit"
git config --global alias.cm "commit -m"
git config --global alias.cam "commit -am"
git config --global alias.pnv "push --no-verify"
git config --global alias.m "merge"
git config --global alias.s "status -s"
git config --global alias.st "status"
git config --global alias.la "!git config -l | grep alias | cut -c 7-"
git config --global alias.last 'log -1 HEAD'
