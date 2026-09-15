#!/usr/bin/env dash

## Agents
# shelly install --upgrade claude-code
# shelly install --upgrade claude-desktop
# shelly install --upgrade opencode

## Tools
uv tool install --upgrade "headroom-ai[all]" # https://github.com/headroomlabs-ai/headroom
# headroom wrap opencode
# headroom wrap claude

## Skills
npx skills@latest add JuliusBrussee/caveman --global --agent claude-code opencode                  # https://github.com/JuliusBrussee/caveman
claude plugins install mattpocock-skills                                                           # https://github.com/mattpocock/skills
npx skills@latest add mattpocock/skills --global --agent claude-code opencode                      # https://github.com/mattpocock/skills
claude plugins marketplace add DietrichGebert/ponytail && claude plugins install ponytail@ponytail # https://github.com/DietrichGebert/ponytail

## Cleanup
uv cache prune
cargo cache --autoclean
npm cache verify
