FROM wordpress:latest

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html
RUN wp core download --allow-root

RUN wp core install --url="http://localhost" --title="My Blog" --admin_user="admin" --admin_password="admin_password" --admin_email="admin@example.com" --allow-root

RUN wp core config --dbname=wordpress --dbuser=root --dbpass=legigarootpassword --dbhost=mysql:3306 --allow-root

EXPOSE 80