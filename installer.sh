# General Tools
sudo apt-get update
sudo apt-get install -y trash-cli
sudo apt-get install -y ubuntu-restricted-extras vlc
sudo apt-get install -y sun-java6-jdk
sudo apt-get install -y w32codecs libcurl3 gthumb gimp trash-cli

# Browsers
sudo apt-get install -y firefox firebug
sudo add-apt-repository -y ppa:chromium-daily
sudo apt-get update
sudo apt-get install -y chromium-browser

# DVD support
sudo apt-get install -y libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh

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
sudo pecl install xdebug-beta  #Need to enable extension manually in php.ini by adding "extension=xdebug.so"
sudo pear install -y PHP_CodeSniffer-1.3.0RC1
sudo pear channel-discover pear.phing.info
sudo pear install phing/phing

# phpunit
sudo apt-get install php-pear
sudo pear channel-discover pear.phpunit.de
sudo pear channel-discover components.ez.no
sudo pear channel-discover pear.symfony-project.com
sudo pear update-channels
sudo pear upgrade
sudo pear install phpunit/PHPUnit

# Editing Tools
sudo apt-get -y install vim vim-gnome
sudo apt-get -y install xchat
sudo apt-get -y install ruby ruby-dev
git clone git://github.com/mmacia/dotfiles.git ~/.dotfiles
chown -R juampy:juampy ~/.dotfiles
cd ~/.dotfiles
./setup.sh

# Drush
wget http://ftp.drupal.org/files/projects/drush-7.x-5.1.tar.gz
tar -zxvf drush-7.x-5.1.tar.gz
rm -rf drush-7.x-5.1.tar.gz
chmod u+x drush/drush
sudo mv drush /usr/share/
sudo ln -s /usr/share/drush/drush /usr/bin/drush
sudo drush status

# XDebug
git clone git://github.com/derickr/xdebug.git
cd xdebug
phpize
./configure --enable-xdebug
make
make install
xdebug_source = `locate xdebug.so`

# PHP custom configuration
sudo sed -i 's/memory_limit = 128/memory_limit = 256/' /etc/php5/apache2/php.ini
sudo sed -i 's/memory_limit = 128/memory_limit = 0/' /etc/php5/cli/php.ini
sudo sed -i 's/error_reportin = Off/error_reporting = On/' /etc/php5/apache2/php.ini
sudo sed -i 's/error_reportin = Off/error_reporting = On/' /etc/php5/cli/php.ini

# Xdebug setting for the command line
sudo cat <<<EOF >> /etc/php5/cli/php.ini
[xdebug]
zend_extension="xdebug_so_path"
xdebug.auto_trace = 0
xdebug.collect_params = 3
xdebug.collect_return = 1
xdebug.max_nesting_level = 500
EOF
sudo sed -i 's/xdebug_so_path/$xdebug_source/' /etc/php5/cli/php.ini

# Xdebug settings for Apache
sudo cat <<<EOF >> /etc/php5/apache2/php.ini
[xdebug]
zend_extension="xdebug_so_path"
xdebug.auto_trace = 0
xdebug.trace_enable_trigger = 1
xdebug.collect_params = 3
xdebug.collect_return = 1
xdebug.max_nesting_level = 500
EOF
sudo sed -i 's/xdebug_so_path/$xdebug_source/' /etc/php5/apache/php.ini

# Apache
sudo a2enmod rewrite
sudo /etc/init.d/apache2 restart
