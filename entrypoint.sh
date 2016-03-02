#!/bin/bash

if [ $# -eq 0 ]; then
  if ! [ -f "/var/lib/sphinxsearch/data/.INDEXED" ]; then
    echo "No indexes yet. Start indexing."
    indexer --rotate --all
    touch /var/lib/sphinxsearch/data/.INDEXED
  fi
  
else
  indexer --rotate "$@"
fi

searchd --nodetach