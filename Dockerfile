FROM ghcr.io/fragoi/debuild:20.9

COPY bin/* /usr/local/bin/

ENTRYPOINT [ "entrypoint.sh" ]
