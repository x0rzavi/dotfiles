#!/usr/bin/env dash

## Agents
# shelly install --upgrade claude-code
# shelly install --upgrade claude-desktop
# shelly install --upgrade opencode

## Tools
# cargo install --git https://github.com/rtk-ai/rtk # https://github.com/rtk-ai/rtk
# rtk init --global
# rtk init --global --opencode

uv tool install --upgrade "headroom-ai[all]" # https://github.com/headroomlabs-ai/headroom
# headroom wrap opencode --no-project-rtk
# headroom wrap claude

## Cleanup
uv cache prune
cargo cache --autoclean
npm cache verify
