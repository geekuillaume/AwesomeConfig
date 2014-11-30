#! /bin/sh
dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | tr '\n' ' ' | sed 's/.*title"\s*variant\s*string "\([^\"]*\)".*/\1/' && echo -n " - " && dbus-send --print-reply --session --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' | tr '\n' ' ' | sed 's/.*artist"\s*variant\s*array \[\s*string "\([^\"]*\)".*/\1/' && echo ""