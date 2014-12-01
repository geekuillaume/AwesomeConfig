#! /bin/sh

infos=$(dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata')


title=$(echo "$infos" \
| tr '\n' ' ' \
| sed 's/.*title"\s*variant\s*string "\([^\"]*\)".*/\1/')

artist=$(echo "$infos" \
| tr '\n' ' ' \
| sed 's/.*artist"\s*variant\s*array \[\s*string "\([^\"]*\)".*/\1/')

lenTitle=$(echo ${#title})
lenArtist=$(echo ${#artist})

if [ $lenTitle -gt 30 ]
  then
    title=$(echo "$title" | cut -c-30 | sed 's/ *$//' | tr '\n' '.' && echo -n "..")
fi
if [ $lenArtist -gt 30 ]
  then
    artist=$(echo "$artist" | cut -c-30 | sed 's/ *$//' | tr '\n' '.' && echo -n "..")
fi
echo "$title - $artist"

