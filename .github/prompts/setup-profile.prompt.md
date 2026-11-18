---
description: One-time setup. Interview me to fill in master/facts.md, then build my master resume.
agent: agent
---

Set up my profile in this repo. Follow the rules in [CLAUDE.md](../../CLAUDE.md).

My current resume or LinkedIn summary (may be empty):

${input:existingResume:Paste your current resume text, or leave blank}

1. Read [master/facts.md](../../master/facts.md) and [templates/resume.html](../../templates/resume.html).
2. Extract everything you can from what I pasted into `master/facts.md`: employment history
   (exact titles and dates), achievements, skills with evidence. Mark anything I pasted as
   `user-confirmed`, and any metric with a plausible public source as `unverified` until checked.
3. Then interview me, **one question at a time**, to fill the gaps:
   - For each role: the 2-3 things I'm proudest of, the scale (users, volume, team) and the outcome.
   - For every number: where it comes from.
   - Three STAR stories: a hard technical problem, a production incident or failure, and a
     disagreement or leadership moment.
   - Skills I list but have only used on side projects (record the real depth).
   - Things I don't have that often appear in job ads (the "Deliberately not claimed" section).
4. Build `master/Master_Resume.html` from `templates/resume.html` using only the ledger. This
   is the long version: include everything relevant; tailoring trims it later.
5. Run `scripts/build.sh master/Master_Resume.html` and fix any FAIL.
6. Summarise what's in the ledger and list any claims still marked `unverified`.
