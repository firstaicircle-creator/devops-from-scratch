# devops-from-scratch: rules for Claude

Public learning repo.

## Never
- Put private job data (phone, salary, company names, applications) or any former employer's material/name here.
- Write day counts, deadlines or "Day N" wording.
- Commit secrets, keys or `.env`. Never set or suggest ANTHROPIC_API_KEY.
- Backdate commits or describe work that was not run.
- Run `terraform apply` without confirming the budget alert; always `terraform destroy` and check leftovers.
- Push without asking. Never bypass the pre-commit guard.
- Heavy workloads (Docker, k8s) on the 8 GB laptop: use Codespaces or cloud.

## Conventions
- Stage folder `stages/NN-slug/` with README.md, LESSONS.md, QUESTIONS.md. Create with `scripts/new-stage.sh`.
- Keep `**Status:**` (Planned / In progress / Done) accurate in the stage README and the root table.
- Be brief. Explain why in LESSONS.md.
