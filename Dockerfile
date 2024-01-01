FROM httpd
RUN apt-get update
RUN apt-get install git -y
RUN git clone https://github.com/sudalaimanis/projectsentamil.github.io.git
RUN mv /usr/local/apache2/projectsentamil.github.io/* /usr/local/apache2/htdocs/