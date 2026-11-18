# Copilot instructions for this repo

This repo is a personal job-search workspace. It turns a master resume and a verified facts
ledger into a tailored resume, cover letter and recruiter email for each job description,
plus interview prep sheets.

**Read [`CLAUDE.md`](../CLAUDE.md) before doing anything.** It is the single source of truth
for this repo's rules, layout and style, and applies to Copilot exactly as written. The
workflows live in:

- [`.claude/skills/tailor-resume/SKILL.md`](../.claude/skills/tailor-resume/SKILL.md): new application
- [`.claude/skills/interview-prep/SKILL.md`](../.claude/skills/interview-prep/SKILL.md): interview prep

Reusable prompts for Copilot Chat are in `.github/prompts/` (type `/` in chat to run them).

## Non-negotiables (summary; CLAUDE.md has the detail)

- Only claim what is recorded in `master/facts.md`. If a job description asks for something
  that isn't there, ask the user for one concrete, checkable detail; if they can't give one,
  leave it out. Never invent skills, metrics, titles or dates.
- No confidential employer detail: no internal codenames, system names or colleague names.
- Job titles and dates must match `master/facts.md` exactly in every document.
- Start new resumes from a copy of `master/Master_Resume.html` and new cover letters from
  `templates/cover_letter.html`. Keep their `<style>` blocks unchanged.
- No em-dashes. No gap admissions or self-flagged weaknesses.
- Resume at most 2 pages, cover letter exactly 1 page.
- After editing any `.html` document, run `scripts/build.sh "<path>.html"` in the terminal
  and fix anything it reports as FAIL. Never hand-edit the PDF or DOCX.
