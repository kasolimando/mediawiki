#!/bin/bash

set -e

if [ ! -f "/var/www/html/LocalSettings.php" ]; then
  echo "LocalSettings.php not found. Running MediaWiki setup..."
  php maintenance/install.php \
        --confpath=$CONF_PATH \
        --dbserver=$DBSERVER \
        --installdbuser=$INSTALL_USER \
        --installdbpass=$INSTALL_PASS \
        --dbtype=$DBTYPE \
        --dbname=$DBNAME \
        --dbuser=$DBUSER \
        --dbpass=$DBPASS \
        --pass=$PASS \
        --server=$SERVER \
        --scriptpath="" \
        --lang=es \
        $MEDIAWIKI_NAME \
        $MEDIAWIKI_USER

  echo -e '$wgUploadPath = "$wgScriptPath/images";' >> /var/www/html/LocalSettings.php

  echo -e '$wgUploadDirectory = "/var/www/html/images";' >> /var/www/html/LocalSettings.php

  echo -e '$wgLogos = ["1x" => "$wgResourceBasePath/resources/assets/change-your-logo.svg","icon" => "$wgResourceBasePath/resources/assets/change-your-logo-icon.svg",]' >> /var/www/html/LocalSettings.php
  
  echo -e '$wgGroupPermissions["user"]["upload"] = true;' >> /var/www/html/LocalSettings.php

  echo -e '$wgGroupPermissions["uploadaccess"]["upload"] = true;' >> /var/www/html/LocalSettings.php

  echo -e '$wgGroupPermissions["autoconfirmed"]["upload"] = false;' >> /var/www/html/LocalSettings.php

  echo -e '$wgGroupPermissions["user"]["reupload"] = true;' >> /var/www/html/LocalSettings.php

  echo -e '$wgGroupPermissions["autoconfirmed"]["reupload"] = false;' >> /var/www/html/LocalSettings.php

  echo -e '$wgGroupPermissions["user"]["reupload-shared"] = true;' >> /var/www/html/LocalSettings.php
  
  echo -e ' $wgFileExtensions = [ "png", "gif", "jpg", "jpeg", "doc","xls", "mpp", "pdf","ppt", "tiff", "bmp", "docx", "xlsx","pptx", "ps", "odt", "ods", "odp","odg"];' >> /var/www/html/LocalSettings.php
  
  echo -e '$wgEnableUploads = true;' >> /var/www/html/LocalSettings.php

  echo -e '$wgUseImageMagick = true;' >> /var/www/html/LocalSettings.php

  echo -e '$wgImageMagickConvertCommand = "/usr/bin/convert";' >> /var/www/html/LocalSettings.php

  echo -e '$wgShowExceptionDetails = true;'  >> /var/www/html/LocalSettings.php

fi

exec "$@"
