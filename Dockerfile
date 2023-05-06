FROM node:latest
ARG SRC_DIR=/var/node
RUN mkdir -p $SRC_DIR
ADD w-app $SRC_DIR
WORKDIR $SRC_DIR
RUN npm install
EXPOSE 3000
ENTRYPOINT ["./bin/www"]
