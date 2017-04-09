FROM php:fpm


COPY automation /home/admin/automation
COPY opt/symfony /home/admin/www

RUN useradd -ms /bin/bash admin
RUN chown admin:admin -R /home/admin/automation/
RUN chown admin:admin -R /home/admin/www/
USER admin

WORKDIR /home/admin/www

VOLUME /home/admin/automation
VOLUME /home/admin/www
