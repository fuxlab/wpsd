FROM wordpress:latest

# install WP-CLI
# routine taken from https://wp-cli.org/de/
WORKDIR /home
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN php wp-cli.phar --info
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

RUN wp cli update
