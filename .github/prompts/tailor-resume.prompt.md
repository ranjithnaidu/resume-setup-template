---
description: Tailor my resume, cover letter and recruiter email to a job description.
agent: agent
---

Tailor my application for this job. Follow [CLAUDE.md](../../CLAUDE.md) and the workflow in
[.claude/skills/tailor-resume/SKILL.md](../../.claude/skills/tailor-resume/SKILL.md) step by step.

- **Company:** ${input:company:Company name}
- **Role title:** ${input:role:Exact role title from the ad}
- **Contact (optional):** ${input:contact:Recruiter or hiring manager name and email, or blank}
- **Anything to emphasise or avoid (optional):** ${input:specifics:e.g. lead with leadership, skip the cover letter, keep it to 1 page}

**Job description:**

${input:jd:Paste the full job description}

Required sources: [master/facts.md](../../master/facts.md) and
[master/Master_Resume.html](../../master/Master_Resume.html).

Before writing any document, show me the requirement → evidence table from step 2 of the
workflow, ask about any must-have gaps, and wait for my answer. Then:

1. Create the `<Company>/` folder with `JD.md`, the resume, the cover letter (unless I said to
   skip it) and the email (only if a contact was given).
2. Run `scripts/build.sh "<Company>"/*.html` in the terminal and fix every FAIL until it passes.
3. Report the file paths, the page counts, what you deliberately did not claim, and what I
   should be ready to explain in an interview.
