## Why this image?

**Problem**: Weechat expects you to configure it by issuing commands from
within weechat. This results in a big collection of obtuse state stored in
config files.

- Config files can't be annotated due to being overwritten by weechat
- Config files don't show which settings have been changed
- Config files are extremely noisy due to storing all possible options
- The commands to recreate the config files aren't always obvious
- Private and public config is mixed together, which discourages sharing

**Solution**: Express your weechat configuration in terms of commands required
to mutate the default state to your desired state.

This docker image and scripts were made to address the concerns above.

- Weechat configures itself from scratch each time it is launched.
- Config files are commentable so you can document things.
- Multiple files are supported so the configuration can be split into public
  and private components.

## Implementation

- Based off official upstream image.
- Immutable container with default configs and all scripts, but nothing
  autoloaded.
- Upon startup, symlink the relevant scripts, and run the config commands.

## To consider

- Idempotence
- Is there any setting to change where the scripts source dir is?
- Can we pre-populate the `/scripts` info? It's unfortunate we don't have it.
- Secrets?
