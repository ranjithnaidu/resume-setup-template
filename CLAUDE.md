# Resume & Job Application Workspace

This repo is a personal job-search workspace driven by Claude Code. Each application gets
its own folder with a tailored resume, cover letter and recruiter email, all generated from
a single master resume and a verified facts ledger.

## Layout

```
master/
  Master_Resume.html     # the full, longest version of the resume (source of truth for wording)
  facts.md               # verified facts ledger: every metric/claim and how it was confirmed
templates/               # blank resume, cover letter, email and prep-sheet templates
<Company Name>/          # one folder per application
  JD.md                  # the job description, pasted verbatim
  <Name>_Resume_<Role>_<Company>.{html,pdf,docx}
  <Name>_Cover_Letter_<Company>.{html,pdf,docx}
  <Name>_Email_<Company>.txt
interview_prep/          # master prep sheet + per-company prep sheets
scripts/build.sh         # HTML -> PDF (Chrome headless) + DOCX (textutil), with checks
```

## Workflow

- New application: use the `tailor-resume` skill.
- Interview booked: use the `interview-prep` skill.
- After editing any `.html` document, rebuild it with `scripts/build.sh <file.html>` and
  confirm the page-count check passes. Never hand-edit the PDF or DOCX.

## Truthfulness rules (non-negotiable)

1. **Only use claims recorded in `master/facts.md`.** If a job description asks for something
   that isn't in the ledger, ask the user for one concrete, checkable detail (what, where,
   roughly when). If they give it, add it to the ledger and use it. If they can't, leave it out.
   Never invent a skill, metric, title or date to match a JD.
2. **Every number needs a source.** Before a metric goes into a resume, check it against a
   public source where one plausibly exists (app store listing, annual report, press release)
   and record its status in the ledger: `verified`, `user-confirmed`, or `unverified`.
   Don't silently carry numbers over from old drafts.
3. **No confidential employer detail.** No internal codenames, internal system names, colleague
   names or non-public figures, even if the user's own notes contain them. Generalise
   ("migrated a legacy reconciliation service", not the internal project name).
4. **Keep job titles and dates identical across every variant.** Tailor the bullets, not the history.

## Writing style (house defaults; change to taste)

- No em-dashes in any document. Use a colon, semicolon, comma or parentheses instead, chosen
  for the sentence.
- No self-flagged weaknesses or gap admissions ("one honest note...", "not yet production
  depth..."). If a must-have requirement is a genuine gap, check with the user, then omit the
  topic rather than either faking it or apologising for it.
- Minimise detail by default: don't state team sizes, direct-report counts or salary unless
  the JD specifically asks for them.
- Plain, specific verbs and outcomes. Avoid buzzword stacks and generic filler.
- Cover letters: 3-4 body paragraphs, mapped to the JD's actual priorities, naming the company
  and why its product/mission is relevant to the candidate's real experience.
- Recruiter emails: short (under ~150 words), plain text, no attachments assumed unless stated.

## Formatting rules

- A4, single column, ATS-friendly: no tables for layout beyond the title/date row, no images,
  icons, columns, skill bars or pills.
- Resume: **maximum 2 pages**. Cover letter: **exactly 1 page**.
- Styling comes from `templates/`; reuse those `<style>` blocks unchanged so every document
  looks consistent.
- File names: `<First>_<Last>_Resume_<RoleShort>_<Company>`, `<First>_<Last>_Cover_Letter_<Company>`.

## Safety

- If an "employer" asks for ID documents (licence, passport), bank details or payments before
  any verified interview, flag it as a likely scam pattern and draft a reply asking for
  verifiable company details (ABN/registration, office address, phone) rather than complying.
- This repo contains personal data. Keep it private, and never commit salary/rate details or
  identity documents.
