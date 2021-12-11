#!/bin/sh

# Symlink the desired scripts from /scripts to the weechat dir
/weechat-custom/install-scripts.sh /scripts /weechat-custom/autorun-scripts.d

# Start weechat
exec weechat \
    -r '/window refresh' \
    -r "/exec -sh -oc grep -h '^/' /weechat-custom/conf.d/*.weechat"
