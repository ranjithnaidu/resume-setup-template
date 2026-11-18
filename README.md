# Resume setup template

A Claude Code workspace for tailoring a resume, cover letter and recruiter email to each job
you apply for, and for building interview prep sheets. It works for any tech stack or role:
the stack lives in your master resume, not in the setup.

## What's in here

| Path | What it is |
|---|---|
| `CLAUDE.md` | Rules Claude follows in this repo: truthfulness, writing style, formatting, safety |
| `.claude/skills/tailor-resume/` | Step-by-step workflow for a new application |
| `.claude/skills/interview-prep/` | Workflow for building interview prep sheets |
| `templates/` | Resume, cover letter, email and prep-sheet templates (A4, ATS-friendly) |
| `master/facts.md` | Your facts ledger: the only claims Claude is allowed to use |
| `scripts/build.sh` | HTML → PDF + DOCX, with page-count and style checks |
| `Example Co/` | A fictional worked example. Delete it once you've looked |

## Setup (about 30 minutes, once)

1. **Make your own copy.** Click "Use this template" on GitHub (or clone it), and keep the
   new repo **private**: it will contain your personal details.
2. **Fill in `master/facts.md`.** Employment history, achievements with real numbers and
   their sources, skills with evidence, and a few STAR stories. This is the part that makes
   the output good. Easiest way: open Claude Code here, paste your current resume and say
   *"interview me to fill in master/facts.md"*.
3. **Create your master resume.** Ask Claude: *"build master/Master_Resume.html from
   templates/resume.html using facts.md"*. Make it the long version; tailoring cuts it down.
4. **Check the build:** `scripts/build.sh master/Master_Resume.html`

## Day to day

- New job: paste the JD and say *"tailor my resume for this"*. Claude creates
  `<Company>/`, shows you which requirements you match and any gaps, then writes and builds
  the resume, cover letter and email.
- Interview booked: *"prep me for the <Company> technical interview on Thursday"*.

## Requirements

- [Claude Code](https://claude.com/claude-code)
- Google Chrome or Chromium (for PDF output)
- macOS for DOCX output (`textutil`). On Linux/Windows, swap that line in
  `scripts/build.sh` for `pandoc "$html" -o "$base.docx"`.

## Customising

- **Style:** change colours and fonts in the `<style>` blocks in `templates/`. Keep it
  single column if you care about ATS parsing.
- **House rules:** the writing-style section of `CLAUDE.md` holds opinions (no em-dashes,
  no gap admissions, minimal detail). Edit them to suit you.
- **Memory:** Claude Code also keeps its own memory per user and project, outside the repo.
  It'll learn your preferences as you go; that memory isn't shared when you share the repo.
