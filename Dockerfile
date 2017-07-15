FROM tomcat:7

#设置时区与语言
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/TZ /etc/localtime && echo TZ /etc/localtime && echo TZ > /etc/timezone

#ADD https://github.com/caryyu/javashop/releases/download/2.4.0/javashop-2.4.0-SNAPSHOT.war /usr/local/tomcat/webapps 

ADD ./javashop-2.4.0-SNAPSHOT.war /usr/local/tomcat/webapps

RUN mv /usr/local/tomcat/webapps/javashop-2.4.0-SNAPSHOT.war /usr/local/tomcat/webapps/javashop.war
