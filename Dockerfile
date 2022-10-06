FROM centos
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install httpd zip unzip vim -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page284/mical.zip /var/www/html
WORKDIR /var/www/html
RUN unzip mical.zip
RUN rm -rf mical.zip &&\
    cp -rf mical-html/* . &&\
    rm -rf mical-html
RUN echo "Hello" > /samplefile.txt
EXPOSE 80
CMD ["/usr/sbin/httpd" , "-D" , "FOREGROUND"]
