FROM debian:jessie

RUN apt-get update && apt-get install -y mysql-client unixodbc libpq5 libexpat1
ADD http://sphinxsearch.com/files/sphinxsearch_2.2.10-release-1~jessie_amd64.deb ./
RUN dpkg -i sphinxsearch_2.2.10-release-1~jessie_amd64.deb

VOLUME ["/var/lib/sphinxsearch"]
EXPOSE 9312 9306

COPY entrypoint.sh /
CMD ["/entrypoint.sh"]
