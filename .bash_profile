# Note that .bash_profile is executed at login; .bashrc at non-login.

if [ -f ~/.profile ]; then
   source ~/.profile
fi

if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
