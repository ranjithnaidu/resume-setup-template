---
description: Build an interview prep sheet for a booked interview.
agent: agent
---

Build my interview prep. Follow [CLAUDE.md](../../CLAUDE.md) and the workflow in
[.claude/skills/interview-prep/SKILL.md](../../.claude/skills/interview-prep/SKILL.md).

- **Company:** ${input:company:Company name (must match the application folder)}
- **Stage:** ${input:stage:Recruiter screen / hiring manager / technical / system design / panel}
- **When and who:** ${input:details:Date, time, duration, interviewer names and roles}

Use the submitted documents in the company folder so my answers match what I sent, and
[master/facts.md](../../master/facts.md) for stories. Create the master prep sheet first if
`interview_prep/master_interview_prep.html` doesn't exist yet. Finish by offering a mock
interview, one question at a time.
