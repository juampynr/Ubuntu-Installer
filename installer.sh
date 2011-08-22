# General Tools
sudo apt-get update
sudo apt-get install -y firefox firebug
sudo apt-get install -y ubuntu-restricted-extras vlc
sudo apt-get install -y sun-java6-jdk
sudo apt-get install -y w32codecs libcurl3 gthumb trash-cli

# Apache and PHP
sudo apt-get install -y apache2 php5-mysql libapache2-mod-php5 mysql-server php-pear mailutils postfix
sudo apt-get install -y php5-xsl php5-gd php5-curl

# Programming tools
sudo apt-get install -y subversion
sudo pear channel-update pear.php.net
sudo pear install PHP_Debug
sudo apt-get install sendmail

# Git
sudo apt-get install -y git-core
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global user.name "Juan Pablo Novillo"
git config --global user.email juampy72@gmail.com

# PHP tools
sudo apt-get install -y php5-dev
sudo pear channel-discover pear.phpunit.de
sudo pear install phpunit/PHPUnit
sudo pecl install xdebug-beta  #Need to enable extension manually in php.ini by adding "extension=xdebug.so"
sudo pear install -y PHP_CodeSniffer-1.3.0RC1
sudo pear channel-discover pear.phing.info
sudo pear install phing/phing

# Editing Tools
sudo apt-get -y install vim vim-gnome
sudo apt-get -y install xchat
git clone git://github.com/mmacia/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./setup.sh
