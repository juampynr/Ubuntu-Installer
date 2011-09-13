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
sudo pear install -y PHP_Debug sendmail ruby

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

# PHP custom configuration
sudo mv /etc/php5/cli/php.ini /etc/php5/cli/php.ini.old
cd /etc/php5/cli
sudo a2enmod rewrite
sudo ln -s ../apache2/php.ini .
sudo sed -i 's/memory_limit = 128/memory_limit = 256/' /etc/php5/apache2/php.ini
sudo sed -i 's/error_reportin = Off/error_reporting = On/' /etc/php5/apache2/php.ini
sudo /etc/init.d/apache2 restart

# Editing Tools
sudo apt-get -y install vim vim-gnome
sudo apt-get -y install xchat
sudo apt-get -y install ruby ruby-dev
git clone git://github.com/mmacia/dotfiles.git ~/.dotfiles
chown -R juampy:juampy ~/.dotfiles
cd ~/.dotfiles
./setup.sh

# Aegir
sudo su
sudo apt-get -y install apache2 php5 php5-cli php5-gd php5-mysql postfix sudo rsync git-core unzip drush
sudo ln -s /var/aegir/config/apache.conf /etc/apache2/conf.d/aegir.conf
sudo adduser --system --group --home /var/aegir aegir
sudo adduser aegir www-data    #make aegir a user of group www-data
echo aegir ALL=NOPASSWD: /usr/sbin/apache2ctl >> /etc/sudoers
su -s /bin/bash - aegir
drush dl --destination=/var/aegir/.drush provision-6.x
drush hostmaster-install

