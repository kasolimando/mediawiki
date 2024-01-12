FROM mediawiki

COPY entrypoint.sh /var/www/html/entrypoint.sh

RUN chmod +x /var/www/html/entrypoint.sh

ENTRYPOINT ["/var/www/html/entrypoint.sh"]

CMD ["apache2-foreground"]
