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
fi

exec "$@"
