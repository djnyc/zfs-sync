#!/bin/bash
zfs destroy -r rpool@old
zfs rename -r rpool@new rpool@old
zfs rename -r newpool/rpool@new newpool/rpool@old
zfs snap -r rpool@new
zfs send -R -i rpool@old rpool@new | zfs recv -Fduv newpool/rpool

