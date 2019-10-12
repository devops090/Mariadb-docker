FROM centos
MAINTAINER nskhpm@gmail.com
RUN yum update -y
RUN yum install mariadb mariadb-server -y
RUN yum install -y java-1.8.0-openjdk.x86_64 --nogpgcheck
RUN yum -y install systemd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;
#RUN yum install -y mariadb mariadb-server; \
    # && sed -ri 's/^user\s/#&/' /etc/my.cnf /etc/mysql/conf.d/* \
     #&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
     #&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql /var/run/mysqld \
     #&& chmod 777 /var/run/mysqld
#RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/my.cnf \
	#&& echo 'skip-host-cache\nskip-name-resolve' | awk '{ print } $1 == "[mysqld]" && c == 0 { c = 1; system("cat") }' /etc/my.cnf > /tmp/my.cnf \
	#&& mv /tmp/my.cnf /etc/mysql/my.cnf
VOLUME [ "/opt/" ]
WORKDIR /opt/
COPY studentapp.sql /opt/
COPY start.sh /opt/
RUN systemctl enable mariadb
CMD ["/usr/sbin/init"]
#RUN ls -s /opt/start.sh
ENTRYPOINT ["/bin/bash", "start.sh"]
EXPOSE 3306
