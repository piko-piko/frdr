#!/usr/bin/env bash
input=$(cat)
urls=$(printf "%s" "$input" | grep -oP 'src="\K[^"]+')
kitty +kitten icat --clear --transfer-mode=memory --stdin=no --place=${FZF_PREVIEW_COLUMNS:-64}x${FZF_PREVIEW_LINES}@${FZF_PREVIEW_COLUMNS:-64}x0 "$urls"
echo "$input" | w3m -dump -T text/html -
