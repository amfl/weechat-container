ARG WEECHAT_PLUGIN_VERSION=master

# Grab all the scripts from git so we don't have to install them via weechat's
# `/script` functionality, because there's no way to nicely do that at
# container build time.
FROM alpine:3.14 as scripts

ARG WEECHAT_PLUGIN_VERSION

# Clone down all the scripts, but remove all the history to avoid bloating
# container size
RUN set -eux; \
    apk add --no-cache \
        git; \
    git clone https://github.com/weechat/scripts; \
    cd scripts; \
    git checkout ${WEECHAT_PLUGIN_VERSION}; \
    rm -rf .git/objects .git/hooks .git/logs

# Source: weechat/weechat-container
FROM weechat/weechat:3.4-alpine

# Add aspell dictionary for spell checking
USER root
RUN set -eux; \
    apk add --no-cache \
        aspell-en
USER user

# Copy _all_ the scripts over (But don't load them just yet)
ARG WEECHAT_PLUGIN_VERSION
ENV WEECHAT_PLUGIN_VERSION=${WEECHAT_PLUGIN_VERSION}
COPY --from=scripts /scripts /scripts

COPY ./weechat-custom /weechat-custom

# Include the window refresh hack from the parent Containerfile
# And also load in personal config
CMD [ "/weechat-custom/entrypoint.sh" ]
