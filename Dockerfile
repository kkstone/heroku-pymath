FROM alpine:edge

RUN apk update
RUN apk add --no-cache ca-certificates caddy wget unzip 
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip 
RUN unzip Xray-linux-64.zip
RUN rm -rf Xray-linux-64.zip
RUN chmod +x /xray


ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
