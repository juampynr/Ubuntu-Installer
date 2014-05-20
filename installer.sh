# General Tools
sudo apt-get update
sudo apt-get install -y xchat curl
sudo apt-get install -y ubuntu-restricted-extras vlc
sudo apt-get install -y libcurl3 gthumb trash-cli
sudo apt-get install -y mlocate && sudo updatedb
sudo apt-get install -y lm-sensors

# Medibuntu
sudo wget --output-document=/etc/apt/sources.list.d/medibuntu.list http://www.medibuntu.org/sources.list.d/$(lsb_release -cs).list && sudo apt-get --quiet update && sudo apt-get --yes --quiet --allow-unauthenticated install medibuntu-keyring && sudo apt-get --quiet update
sudo apt-get install libdvdcss2

# Apache and PHP
sudo apt-get install -y apache2 php5-mysqlnd libapache2-mod-php5 mysql-client-5.5 mysql-server php-pear mailutils postfix
sudo apt-get install -y php5-xsl php5-gd php5-curl
sudo sh -c 'echo "ServerName localhost" >> /etc/apache2/conf.d/name' && sudo service apache2 restart

# Programming tools
sudo pear channel-update pear.php.net
sudo pear install PHP_Debug

# Git
sudo apt-get install -y git-core
git config --global color.branch auto
git config --global color.diff auto
git config --global color.status auto
git config --global user.name "Juampy"
git config --global user.email juampy72@gmail.com
git config --global alias.st status
git config --global alias.duff 'diff --cached'
cat ~/Ubuntu-Installer/git-show-branch.txt >> $HOME/.bashrc

# PHP tools
sudo apt-get install -y php5-dev
sudo pear install -y PHP_CodeSniffer-1.3.0RC1
sudo pear channel-discover pear.phing.info
sudo pear install phing/phing

# PECL & extensions
sudo apt-get install php-pear php5-dev
sudo pecl install uploadprogress
sudo echo 'extension=uploadprogress.so' >> /etc/php5/apache2/php.ini
sudo service apache2 restart

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

# PHP custom configuration
sudo sed -i 's/memory_limit = 128/memory_limit = 256/' /etc/php5/apache2/php.ini
sudo sed -i 's/memory_limit = 128/memory_limit = 0/' /etc/php5/cli/php.ini
sudo sed -i 's/error_reporting = Off/error_reporting = On/' /etc/php5/apache2/php.ini
sudo sed -i 's/error_reporting = Off/error_reporting = On/' /etc/php5/cli/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/apache2/php.ini
sudo sed -i 's/display_errors = Off/display_errors = On/' /etc/php5/cli/php.ini

# XDebug
git clone git://github.com/derickr/xdebug.git
cd xdebug
sudo phpize
sudo ./configure --enable-xdebug
sudo make
sudo make install
xdebug_source=`locate xdebug | grep /usr/lib`

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
xdebug.remote_enable=On
xdebug.remote_port=9000
xdebug.remote_host=localhost
EOF
sudo sed -i 's/xdebug_so_path/$xdebug_source/' /etc/php5/apache2/php.ini

# Apache Solr
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get -y install oracle-java7-installer
wget http://apache.rediris.es/lucene/solr/3.6.2/apache-solr-3.6.2.tgz
mkdir ~/software
tar -xvzf apache-solr-3.6.2.tgz -C ~/software/

# Hub for Github
sudo apt-get -y install ruby
sudo curl http://defunkt.io/hub/standalone -sLo /usr/bin/hub && sudo chmod +x /usr/bin/hub

# Compass
sudo apt-get -y install ruby
sudo gem install compass

# VIM configuration
cd $home
drush @none dl vimrc
drush -v vimrc-install

# Virtual Box IE test machines (needs VB set up first)
# curl -s https://raw.github.com/xdissent/ievms/master/ievms.sh | bash
