FROM ubuntu:20.04

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
