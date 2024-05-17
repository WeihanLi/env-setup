# Read the value of ID from /etc/os-release
source /etc/os-release

# Check if ID contains "centos" or "ubuntu"
if [[ "$ID" == "centos" ]]; then
    echo "Running on CentOS"
elif [[ "$ID" == "ubuntu" ]]; then
    echo "Running on Ubuntu"
else
    echo "Unknown distribution"
fi

echo "git config"
cp ../shared/.gitconfig ~/.gitconfig
