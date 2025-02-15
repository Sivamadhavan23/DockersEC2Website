FROM nginx:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install wget unzip -y
WORKDIR /usr/share/nginx/html
COPY default.conf /etc/nginx/sites-enabled/
ADD https://bootstrapmade.com/content/templatefiles/PhotoFolio/PhotoFolio.zip .
RUN unzip PhotoFolio.zip
RUN mv PhotoFolio/* .
RUN rm -rf PhotoFolio PhotoFolio.zip
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
