# Facts ledger

The single source of truth for what can be claimed in a resume, cover letter or interview.
Claude only uses claims recorded here (see `CLAUDE.md`). Add to it whenever you confirm
something new; never delete history, mark it `retracted` instead.

Status values:
- `verified`: checked against a public source (link it)
- `user-confirmed`: you've confirmed it from your own knowledge; no public source exists
- `unverified`: don't use in documents until confirmed

## Employment history (titles and dates must match everywhere)

| Company | Title | Start | End | Location |
|---|---|---|---|---|
| [Company] | [Title] | [Mon YYYY] | [Mon YYYY] | [City] |

## Achievements and claims

| Claim | Where / when | Metric | Status | Source / note |
|---|---|---|---|---|
| [Led migration of X to Y] | [Company, YYYY] | [e.g. 2M users] | user-confirmed | [note] |

## Skills (with real evidence)

| Skill | Depth (production / side project / familiar) | Evidence |
|---|---|---|
| [Skill] | production | [Company, what you built] |

## Stories (STAR, for interviews)

### [Story title, e.g. "Major production incident"]
- **Situation:**
- **Task:**
- **Action:**
- **Result:**
- **Good for questions about:**

## Deliberately not claimed

Things that come up in JDs that you don't have, so Claude doesn't keep asking.

- [e.g. Kubernetes in production: only used locally]
