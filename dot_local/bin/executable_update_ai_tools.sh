#!/usr/bin/env dash

## Agents
# shelly install --upgrade claude-code
# shelly install --upgrade claude-desktop
# shelly install --upgrade opencode

## Tools
uv tool install --upgrade "headroom-ai[all]" # https://github.com/headroomlabs-ai/headroom
# headroom wrap opencode --rtk --no-project-rtk
# headroom wrap claude --rtk

## Skills
curl -fsSL https://raw.githubusercontent.com/JuliusBrussee/caveman/main/install.sh | NPM_CONFIG_ALLOW_GIT=all bash -s -- # https://github.com/JuliusBrussee/caveman
claude plugins install mattpocock-skills                                                                                 # https://github.com/mattpocock/skills
npx skills@latest add mattpocock/skills --global --agent opencode                                                        # https://github.com/mattpocock/skills

## Cleanup
uv cache prune
cargo cache --autoclean
npm cache verify
