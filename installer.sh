# General Tools
sudo apt-get update
sudo apt-get install -y trash-cli xchat curl
sudo apt-get install -y ubuntu-restricted-extras vlc
sudo apt-get install -y sun-java6-jdk
sudo apt-get install -y w32codecs libcurl3 gthumb gimp trash-cli
sudo apt-get install -y mlocate && sudo updatedb

# Browsers
sudo apt-get install -y firefox firebug
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get install google-chrome-stable

# Apache and PHP
sudo apt-get install -y apache2 php5-mysql libapache2-mod-php5 mysql-server php-pear mailutils postfix
sudo apt-get install -y php5-xsl php5-gd php5-curl
sudo sed '$ a\
ServerName localhost' /etc/apache2/httpd.conf

# Programming tools
sudo pear channel-update pear.php.net
sudo pear install -y PHP_Debug sendmail ruby

# Git
sudo apt-get install -y git-core
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global user.name "Juampy"
git config --global user.email juampy72@gmail.com
cat Ubuntu-Installer/git-show-branch.txt >> $HOME/.bashrc

# PHP tools
sudo apt-get install -y php5-dev
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

# Drush
git clone --recursive --branch 8.x-6.x http://git.drupal.org/project/drush.git
chmod u+x drush/drush
sudo mv drush /usr/share/
sudo ln -s /usr/share/drush/drush /usr/bin/drush
drush status

# XDebug
git clone git://github.com/derickr/xdebug.git
cd xdebug
phpize
./configure --enable-xdebug
make
sudo make install
xdebug_source=`locate xdebug | grep /usr/lib`

# PHP custom configuration
sudo sed -i 's/memory_limit = 128/memory_limit = 256/' /etc/php5/apache2/php.ini
sudo sed -i 's/memory_limit = 128/memory_limit = 0/' /etc/php5/cli/php.ini
sudo sed -i 's/error_reporting = Off/error_reporting = On/' /etc/php5/apache2/php.ini
sudo sed -i 's/error_reporting = Off/error_reporting = On/' /etc/php5/cli/php.ini

# Xdebug setting for the command line
sudo cat <<EOF >> /etc/php5/cli/php.ini
[xdebug]
zend_extension="xdebug_so_path"
xdebug.auto_trace = 0
xdebug.collect_params = 3
xdebug.collect_return = 1
xdebug.max_nesting_level = 500
EOF
sudo sed -i 's/xdebug_so_path/$xdebug_source/' /etc/php5/cli/php.ini

# Xdebug settings for Apache
sudo cat <<EOF >> /etc/php5/apache2/php.ini
[xdebug]
zend_extension="xdebug_so_path"
xdebug.auto_trace = 0
xdebug.trace_enable_trigger = 1
xdebug.collect_params = 3
xdebug.collect_return = 1
xdebug.max_nesting_level = 500
EOF
sudo sed -i 's/xdebug_so_path/$xdebug_source/' /etc/php5/apache2/php.ini

# Apache
sudo a2enmod rewrite
sudo /etc/init.d/apache2 restart

# Hub for Github
mkdir -p ~/local/bin
curl http://defunkt.io/hub/standalone -sLo ~/local/bin/hub && chmod +x ~/local/bin/hub

# VIM configuration
cd $HOME
drush @none dl vimrc
drush -v vimrc-install
