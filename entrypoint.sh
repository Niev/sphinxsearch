#!/bin/bash

if [ $# -eq 0 ]; then
  if ! [ -f "/var/lib/sphinxsearch/.INDEXED" ]; then
    echo "No indexes yet. Start indexing."
    indexer --rotate --all
    touch /var/lib/sphinxsearch/.INDEXED
  fi
  
else
  indexer --rotate "$@"
fi

exec searchd --nodetach