FROM alpine:3.9.6

RUN apk update
RUN apk upgrade
RUN apk add bash bind-tools curl

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT [ "/run.sh" ]
