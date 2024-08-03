pass() {
	tr -dc A-Za-z0-9 </dev/urandom | head -c "$1"
}

# Randomize everything
cat << EOF | tee .env
MYSQL_DATABASE=wp-$(pass 8)
MYSQL_USER=word$(pass 4)press
MYSQL_PASSWORD=$(pass 16)

WORDPRESS_TITLE="WP on $DOMAIN_NAME"
WORDPRESS_USER=admin$(pass 3)
WORDPRESS_PASSWORD=$(pass 16)

DOMAIN=$DOMAIN_NAME
EOF

if [ "$DOMAIN_NAME" = "localhost" ] || [ "$DOMAIN_NAME" = "127.0.0.1" ]; then
	echo "USE_LOCAL_CA=1" | tee -a .env
fi

sed -i "s/DOMAIN_TO_REPLACE/$DOMAIN_NAME/g" nginx/conf/default.conf
