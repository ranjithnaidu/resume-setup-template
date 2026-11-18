---
name: interview-prep
description: Build or update an interview prep sheet for a specific company and interview stage. Use when the user has an interview, phone screen, technical round or case study booked, or asks how to prepare for one.
---

# Interview prep sheet

## Inputs to gather first

- Company folder (`<Company Name>/JD.md` and the submitted resume/cover letter). Interview
  answers must stay consistent with what was actually submitted.
- Stage and format: recruiter screen, hiring manager, technical, system design, take-home,
  panel, culture. Who is interviewing and their role, if known.
- Date/time, duration, location or video link.

## Master sheet

`interview_prep/master_interview_prep.html` holds everything reusable across companies:
the 60-second pitch, STAR stories, "why are you leaving", salary/availability framing,
questions to ask. Create it from `templates/interview_prep.html` the first time. Company
sheets link to it rather than duplicating it.

STAR stories must come from `master/facts.md` or from details the user confirms in chat
(record new ones in the ledger). Never invent a story.

## Company sheet

Create `interview_prep/<company>_<stage>_prep.html` from `templates/interview_prep.html`:

1. **Logistics**: when, where, who, format.
2. **Company in one paragraph**: product, customers, recent news (web-search, cite sources).
3. **Why this role / why this company**: 3 bullets tied to the JD and the candidate's real experience.
4. **Likely questions → which story or answer to use**, ordered by likelihood for this stage.
5. **Technical topics to refresh** (for technical stages), focused on the JD's stack.
6. **Questions to ask them**, specific to the stage and interviewer.
7. **Watch-outs**: anything in the submitted resume they're likely to probe; how to answer
   consistently and truthfully.

Keep it scannable: it should be readable in 10 minutes before the call. No em-dashes.
Offer to run a mock interview afterwards (ask one question at a time, give feedback).
