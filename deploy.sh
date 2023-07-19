#!/bin/sh

set -eux

DEST="${HOME}/public_html"

rm -r "$DEST"/*

for i in . article page; do
	mkdir -p "${DEST}/${i}"

	cp -v ./"$i"/*.html "${DEST}/${i}" || true
	cp -v ./"$i"/*.xml "${DEST}/${i}" ||  true
done

find "$DEST" -type f -exec chmod 0640 {} + 
find "$DEST" -type d -exec chmod 0750 {} + 

