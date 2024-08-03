FROM wordpress:php8.3-fpm

RUN apt update -y && apt install -y default-mysql-client

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 
RUN install -m 755 wp-cli.phar /usr/local/bin/wp
RUN rm wp-cli.phar

RUN sed '$ i\set +Ee; while ! mysqladmin ping -h db --silent; do sleep 1; done; wp core install --url="$DOMAIN/wp/" --title="$WORDPRESS_TITLE" --admin_user="$WORDPRESS_USER" --admin_password="$WORDPRESS_PASSWORD" --admin_email="example@example.com" --allow-root; wp user create author "user@42.fr" --role=author --user_pass=user --allow-root' -i /usr/local/bin/docker-entrypoint.sh
