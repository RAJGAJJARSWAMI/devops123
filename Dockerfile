FROM ubuntu:18.04
RUN apt update && apt install git -y
RUN apt install apache2 -y
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]
RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh
EXPOSE 80
CMD /root/run_apache.sh
