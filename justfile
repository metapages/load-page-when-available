# just docs: https://github.com/casey/just
set shell       := ["bash", "-c"]
set dotenv-load := true

export PORT     := env_var_or_default("PORT", "8082")

bold            := '\033[1m'
normal          := '\033[0m'
green           := "\\e[32m"
yellow          := "\\e[33m"
blue            := "\\e[34m"
magenta         := "\\e[35m"
grey            := "\\e[90m"

@_help:
    echo ""
    just --list --unsorted --list-heading $'⛩️  Commands: {{green}}https://github.com/metapages/load-page-when-available{{normal}}\n'
    echo -e "    "

# Run the server in development mode
@dev: open
  npx http-server

open:
  open 'http://127.0.0.1:{{PORT}}/?url=https://slides-remote.glitch.me#?channel=test'

# publish to glitch.com. Issues see README.md#glitch.com
@publish:
    echo -e 'Just commit to master and push to github. Glitch.com will automatically deploy the changes.\n'