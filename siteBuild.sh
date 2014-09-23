# Creates a virtual host and entry at /etc/hosts for a local site.
#
# Usage: sh siteBuild.sh somesite.localhost /path/to/site/root
# see 'template' file and place it under /etc/apache2/sites-available.
#
set -x
SITE_HOST=$1
SITE_PATH=$2
VIRTUAL_HOST="/etc/apache2/sites-available/$SITE_HOST.conf"

sudo cp ./template $VIRTUAL_HOST
sudo sed -i 's|site_dir|'$SITE_PATH'|g' $VIRTUAL_HOST
sudo sed -i "s/host_name/$SITE_HOST/g" $VIRTUAL_HOST
sudo a2ensite $SITE_HOST
sudo service apache2 reload
sudo sh -c "echo \"127.0.0.1 $SITE_HOST\" >> /etc/hosts"
