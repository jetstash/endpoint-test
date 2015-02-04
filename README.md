# Endpoint Test

This is a tool to help test form submissions and also to seed your database if needed.

## Usage

Copy `config.sh.sample` to `config.sh` and modify environment variables.

## Flags
flag | description 
---- | -------- 
h    | Show the help message
n    | Define the number of interations to run
u    | Define the url of the application if different that your config

# Requirements

Bash 4+ (OS X ships with Bash 3!)

The scripts shebang points to `/usr/local/bin/bash` -- which will fail if you run /bin/bash

```
brew install bash
chsh -s /usr/local/bin/bash
```

Alternatively add `/usr/local/bin/bash` to `/etc/shells`

# License

MIT
