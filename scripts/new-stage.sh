#!/usr/bin/env bash
# Usage: scripts/new-stage.sh 01 monolith-no-cloud "Title"
set -e
n="$1"; slug="$2"; title="$3"
d="stages/$n-$slug"; mkdir -p "$d"
printf '# %s\n\n**Status:** Planned\n\n## Goal\n\n## Steps\n\n## Checklist\n\n- [ ] Ran it myself\n- [ ] LESSONS.md filled\n- [ ] QUESTIONS.md answered\n- [ ] Post drafted\n' "$title" > "$d/README.md"
printf '# Lessons\n\nWhat broke, why, the fix.\n' > "$d/LESSONS.md"
printf '# Interview questions\n\nQuestion, then my own answer.\n' > "$d/QUESTIONS.md"
echo "created $d"
