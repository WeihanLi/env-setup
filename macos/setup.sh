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

# https://docs.lextudio.com/blog/powershell-on-macos/
echo "Install powershell"
brew install --cask powershell

echo "Install iterm2"
brew install --cask iterm2

echo "Install oh-my-posh"
brew install jandedobbeleer/oh-my-posh/oh-my-posh
echo "Install font-meslo-lg-nerd-font"
brew install --cask font-meslo-lg-nerd-font

# echo
$PSPROFILE = "~/.config/powershell/Microsoft.PowerShell_profile.ps1"
cp ../shared/pwsh-profile.ps1 $PSPROFILE
