FROM alpine
RUN apk add --no-cache --update ansible
COPY entrypoint.sh /
COPY id_rsa_encrypted /
COPY ansible/ /ansible/
ENTRYPOINT ["/entrypoint.sh"]
