#!/bin/sh
WATCH_DIR="/files_to_watch"

inotifywait -m -e close_write -e moved_to --format '%e %f' "$WATCH_DIR" | while read EVENT FILENAME
do
    FILEPATH="$WATCH_DIR/$FILENAME"

    case "$EVENT" in
        CLOSE_WRITE*)
            echo "File written and closed: $FILEPATH"
            ;;
        MOVED_TO*)
            echo "File moved in: $FILEPATH"
            ;;
        *)
            echo "Unhandled event ($EVENT): $FILEPATH"
            continue
            ;;
    esac

    sleep 1
    rm "$FILEPATH"
    echo "Deleted: $FILEPATH after printing"
done