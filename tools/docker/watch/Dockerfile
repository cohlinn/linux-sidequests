FROM alpine

RUN apk add --no-cache inotify-tools \
    && mkdir -p files_to_watch

COPY watch.sh /watch.sh
RUN chmod +x watch.sh

CMD ["/watch.sh"]