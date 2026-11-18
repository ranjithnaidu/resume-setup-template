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

## Using GitHub Copilot instead of Claude Code

The same workflow runs in VS Code with Copilot Chat. Copilot picks up
`.github/copilot-instructions.md` automatically, and that file points it at `CLAUDE.md` and
the skill files, so both tools follow the same rules.

1. Open the repo in VS Code, open Copilot Chat and switch it to **Agent** mode (it needs to
   create files and run `scripts/build.sh` in the terminal).
2. Type `/` and pick a prompt; VS Code asks for each input:

| Prompt | When | You enter |
|---|---|---|
| `/setup-profile` | Once, first | Your current resume text; then answer its questions |
| `/tailor-resume` | Each job | Company, role title, contact (optional), specifics, the full JD |
| `/interview-prep` | Interview booked | Company, stage, date and interviewers |

`/tailor-resume` shows you a requirement → evidence table and asks about gaps before it
writes anything. Approve the terminal command when it asks to run the build script.

If the prompts don't appear, check that the VS Code setting `chat.promptFiles` is enabled.

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
