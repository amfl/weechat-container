# Containerized Weechat

Weechat image which reads configuration in a sensible format and configures
itself from scratch each boot. [More details...](./doc/motivation.md)

## Usage

**Configuring:**

Configs can be either build-time or run-time, depending on when they are loaded
into the container.

- Place your configs as `.weechat` files in `/weechat-custom/conf.d`
- Place lists of plugins to autoload as `.cfg` files in `/weechat-custom/autorun-scripts.d`

**Building:**

```sh
docker build -f Containerfile . -t amfl/weechat:latest
```

**Running:**

```sh
docker run --rm -it --name weechat amfl/weechat:latest
```

## Interesting image directories

- Log files: `/home/user/.local/share/weechat/logs`
- Weechat conf: `/home/user/.config/weechat`

## See also:

- Largely inspired by <https://gist.github.com/pascalpoitras/8406501>
