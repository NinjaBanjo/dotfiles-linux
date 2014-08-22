# init z https://github.com/rupa/z
. ~/code/z/z.sh

# make RVM useful
source ~/.rvm/scripts/rvm

# make NVM useful
export NVM_DIR="/home/derek/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# adding webstorm to path
PATH=$PATH:~/Applications/WebStorm/bin
