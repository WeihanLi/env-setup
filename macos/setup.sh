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
cp ../shared/.gitconfig ~/.gitconfig

echo "Install nodejs"
brew install node
# https://yarnpkg.com/getting-started/install
# install yarn
# yarn set version stable
# yarn install
