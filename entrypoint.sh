set -e

if [ ! -f "/var/www/html/LocalSettings.php" ]; then
  echo "LocalSettings.php not found. Running MediaWiki setup..."
  php maintenance/install.php \
        --confpath=/var/www/html \
        --dbserver=mediawiki-database-1 \
        --installdbuser=wikimedia \
        --installdbpass=wikimedia \
        --dbtype=mysql \
        --dbname=wiki_db \
        --dbuser=wikimedia \
        --dbpass=wikimedia \
        --pass=123456789CKpocho \
        --server=http://192.168.56.2:8080 \
        --scriptpath="" \
        --lang=es \
        "MediwikiEquipo1" \
        "Admin"

    echo -e '\t$wgUploadPath = "$wgScriptPath/images";' >> /var/www/html/LocalSettings.php

    echo -e '\t$wgUploadDirectory = "/var/www/html/images";' >> /var/www/html/LocalSettings.php

    echo -e '\t$wgResourceBasePath = $wgScriptPath;' >> /var/www/html/LocalSettings.php

    echo -e '\t$wgLogos = [
                        '1x' => "$wgResourceBasePath/resources/assets/change-your-logo.svg",
                        'icon' => "$wgResourceBasePath/resources/assets/change-your-logo-icon.svg",
                        ];' >> /var/www/html/LocalSettings.php

    echo -e '\t$wgGroupPermissions['user']['upload'] = true;
             \t$wgGroupPermissions['uploadaccess']['upload'] = true;
             \t$wgGroupPermissions['autoconfirmed']['upload'] = false;
             \t$wgGroupPermissions['user']['reupload'] = true;
             \t$wgGroupPermissions['autoconfirmed']['reupload'] = false;
             \t$wgGroupPermissions['user']['reupload-shared'] = true;
             \t$wgFileExtensions = [ 'png', 'gif', 'jpg', 'jpeg', 'doc',
                        'xls', 'mpp', 'pdf', 'ppt', 'tiff', 'bmp', 'docx', 'xlsx',
                        'pptx', 'ps', 'odt', 'ods', 'odp', 'odg'
                ];' >> /var/www/html/LocalSettings.php

    echo -e '\t$wgEnableUploads = true; 
             \t$wgUseImageMagick = true;' >> /var/www/html/LocalSettings.php

    echo -e '\t$wgShowExceptionDetails = true;' >> /var/www/html/LocalSettings.php
fi
