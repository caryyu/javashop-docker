FROM tomcat:7-alpine

#设置时区与语言
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/TZ /etc/localtime && echo TZ /etc/localtime && echo TZ > /etc/timezone

RUN echo \ 
"#!/bin/sh \
export CATALINA_OPTS=\" \
-Dpath.imageserver=/usr/local/tomcat/webapps/javashop/statics \ 
-Dstorage.products=/usr/local/tomcat/webapps/javashop/products \
-Dstorage.EOPServer=/usr/local/tomcat/webapps/javashop \
-Dinstall.lock=/usr/local/tomcat/webapps/javashop/install/install.lock \  
-Dstorage.app_data=/usr/local/tomcat/webapps/javashop/products/commons \
\" " > /usr/local/tomcat/bin/setenv.sh

RUN chmod 777 /usr/local/tomcat/bin/setenv.sh

ADD https://github.com/caryyu/javashop/releases/download/2.4.0/javashop-2.4.0-SNAPSHOT.war /usr/local/tomcat/webapps 

RUN mv /usr/local/tomcat/webapps/javashop-2.4.0-SNAPSHOT.war /usr/local/tomcat/webapps/javashop.war
