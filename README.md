# Feed Reader (frdr)

A terminal RSS reader which utilizes popular *nix tools

## Fork modifications:
- `frdr` doesn't update on run. It happends either on reload or by using the `-u` parameter
- `-u` parameter prints out unread items (for notification purposes)
- attached images get added to the content of the post
- [pager/kitty-image-pager.sh](https://github.com/piko-piko/frdr/blob/master/pager/kitty-image-pager.sh), when used as FRDR_PREVIEWER, displays the attached image
- ctrl+t translates the post

[![asciicast](https://asciinema.org/a/656386.svg)](https://asciinema.org/a/656386)

## Requirements
- [fzf](https://github.com/junegunn/fzf) - Fuzzy-finder and previewer (UI)
- [jq](https://github.com/jqlang/jq) - JSON parsing
- [rss2json](https://github.com/trevarj/rss2json) - Converts RSS XML to JSON

## Config
A bash env file placed in `~/.config/frdr/config.bash` which contains a bash
array of RSS feeds.

Please see [the sample config](./sample.config.bash) for a full example.

```sh
FEEDS=(
	# "Alias URL"
	"trev https://trevarj.github.io/rss.xml"
	# "trev_local /tmp/rss.xml"
)
FRDR_PAGER="lynx -stdin"           # Pager that is used when pressing 'enter' on a post
FRDR_PREVIEWER="lynx -dump -stdin" # Pager used in the preview pane when hovering a post
```

## Usage

Simply run:
```sh
frdr
```

### Default Controls

All controls except enter are able to be overridden.

| Key    | Description
| ---    | ---
| enter  | Open post in `$PAGER`
| ctrl-t | Translate post (using [translate-shell](https://github.com/soimort/translate-shell))
| ctrl-r | Refresh all feeds
| ctrl-y | Mark post as read
| ctrl-u | Mark post as unread
| esc    | Show unread posts
| ctrl-h | Show read (hidden) posts
| ctrl-o | xdg-open URL to post

