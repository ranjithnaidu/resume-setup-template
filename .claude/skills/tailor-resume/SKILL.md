---
name: tailor-resume
description: Tailor the master resume, cover letter and recruiter email to a specific job description. Use when the user pastes or links a JD, names a role they're applying for, or asks for a resume/cover letter for a company.
---

# Tailor a resume to a job description

Follow the rules in `CLAUDE.md` throughout, especially the truthfulness rules.

## 1. Capture the JD

- Create `<Company Name>/` and save the job description verbatim to `<Company Name>/JD.md`,
  with the source URL and date at the top.
- If the employer is hidden (agency or "on behalf of a partner"), you may web-search the
  exact title and salary range to identify them, but say how confident you are before naming
  the company in a cover letter.

## 2. Map requirements to evidence

Build a short table in chat (not in the documents):

| JD requirement | Must-have / nice-to-have | Evidence from `master/facts.md` | Status |
|---|---|---|---|

Status is one of: **covered** (ledger has it), **partial** (adjacent experience), **gap**
(nothing in the ledger).

- For each **gap** on a must-have: ask the user once for a concrete, checkable detail. If they
  provide it, add it to `facts.md` and treat it as covered. If not, omit the topic from the
  documents. Don't write gap admissions and don't fabricate.
- Show this table to the user before writing, and list anything you're deliberately NOT
  claiming.

## 3. Write the resume

- Start from `master/Master_Resume.html` (copy it, don't edit the master).
- Rewrite the summary for this role: lead with the 2-3 things the JD cares most about that
  the candidate genuinely has.
- Reorder and trim bullets so the most relevant come first in each role. Mirror the JD's
  vocabulary where it's truthful (ATS keyword match), but never rename a technology the
  candidate didn't use.
- Reorder skills categories so the JD's core stack is first.
- Keep titles, companies and dates exactly as in the master.

## 4. Write the cover letter and email

- Cover letter from `templates/cover_letter.html`: date, recipient, "Re:" line with the exact
  role title, 3-4 body paragraphs (why this company, the strongest matching evidence, the
  secondary strengths, a short close). One page.
- Email from `templates/email.txt`: to the named contact if the JD lists one, otherwise skip.

## 5. Build and check

Run `scripts/build.sh "<Company Name>"/*.html` and confirm:

- Resume is 1-2 pages; cover letter is exactly 1 page (the script reports page counts).
- No em-dashes (the script greps for them).
- Re-read the documents for any internal codenames, colleague names or unverified metrics.

## 6. Report back

Give the user: file paths, the requirement table's gaps and what you did about each, and
anything they should be ready to explain in an interview.
