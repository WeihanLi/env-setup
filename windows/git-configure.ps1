Write-Host "Setting up Git ..." -ForegroundColor Green
Write-Host "------------------------------------" -ForegroundColor Green
# lfs
git lfs install

# user config
git config --global user.name "Weihan Li"
git config --global user.email "weihanli@outlook.com"
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

# configure git proxy to use v2ray proxy for github if necessary
# git config --global http.https://github.com.proxy http://127.0.0.1:10809

Write-Host "Git configured ..." -ForegroundColor Green
