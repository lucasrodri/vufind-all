FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/Sao_Paulo

RUN apt-get update && \
    apt-get install -y vim tzdata apache2 libapache2-mod-php php-mbstring php-pear php php-dev php-gd php-intl php-json php-ldap php-mysql php-xml php-soap php-curl default-jdk php-pgsql && \
    a2enmod rewrite && \
    ln -s /usr/local/vufind/local/httpd-vufind.conf /etc/apache2/conf-enabled/vufind.conf && \
    sh -c 'echo export JAVA_HOME=\"/usr/lib/jvm/default-java\" > /etc/profile.d/vufind.sh' && \
    sh -c 'echo export VUFIND_HOME=\"/usr/local/vufind\"  >> /etc/profile.d/vufind.sh' && \
    sh -c 'echo export VUFIND_LOCAL_DIR=\"/usr/local/vufind/local\"  >> /etc/profile.d/vufind.sh'

#CMD ["tail","-f","/dev/null"]
#ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
#ENTRYPOINT /usr/local/vufind/solr.sh -force start && /usr/sbin/apache2ctl -D FOREGROUND
CMD /usr/sbin/apache2ctl -D FOREGROUND ; exec /usr/local/vufind/solr.sh -force start

ENV APACHE_LOCK_DIR="/var/lock"
ENV APACHE_PID_FILE="/var/run/apache2.pid"
ENV APACHE_RUN_USER="www-data"
ENV APACHE_RUN_GROUP="www-data"
ENV APACHE_LOG_DIR="/var/log/apache2"
ENV JAVA_HOME="/usr/lib/jvm/default-java"
ENV VUFIND_HOME="/usr/local/vufind"
ENV VUFIND_LOCAL_DIR="/usr/local/vufind/local"

EXPOSE 80
EXPOSE 8983
