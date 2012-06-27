#!/bin/sh

userdefaults=$HOME/.Xdefaults
usermodmap=$HOME/.Xmodmap

if [ -f "$userdefaults" ]; then

  if [ -x /usr/bin/cpp ] ; then
    xrdb -merge "$userdefaults"
  else
    xrdb -nocpp -merge "$userdefaults"
  fi

fi

if [ -f "$usermodmap" ]; then
  xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/lib/X11/xinit/xinitrc.d ] ; then
	for f in /etc/X11/lib/X11/xinit/xinitrc.d/*.sh ; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# twm &
# xclock -geometry 50x50-1+1 &
# xterm -geometry 80x50+494+51 &
# xterm -geometry 80x20+494-0 &
exec awesome
# exec xterm -geometry 80x66+0+0 -name login
