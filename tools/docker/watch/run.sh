#!/bin/bash
docker run -d --restart=unless-stopped --volume  $PWD/files_to_watch:/files_to_watch --name watchd watcher