# 
# Unless explicitly acquired and licensed from Licensor under another license, the contents of
# this file are subject to the Reciprocal Public License ("RPL") Version 1.5, or subsequent
# versions as allowed by the RPL, and You may not copy or use this file in either source code
# or executable form, except in compliance with the terms and conditions of the RPL
#
# All software distributed under the RPL is provided strictly on an "AS IS" basis, WITHOUT
# WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, AND LICENSOR HEREBY DISCLAIMS ALL SUCH
# WARRANTIES, INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE, QUIET ENJOYMENT, OR NON-INFRINGEMENT. See the RPL for specific language
# governing rights and limitations under the RPL.
#
# http://opensource.org/licenses/RPL-1.5
#
# Copyright 2012-2016 Open Justice Broker Consortium
# 


FROM ojbc/portal

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"


WORKDIR /tmp

#RUN sed -i "s/ServerName portal.ojbc.local:80/ServerName hawaii.nibrs.search.org:80/g" /etc/apache2/httpd.conf 
EXPOSE 443	
# Copy config files over
	
COPY files/shibboleth2.xml /opt/shibboleth-sp/etc/shibboleth/
COPY files/ssl.conf /etc/apache2/conf.d/
COPY files/proxy.conf /etc/apache2/conf.d/
COPY files/shib.conf /etc/apache2/conf.d/
COPY files/CTF.xml /opt/files/CTF.xml
