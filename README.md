# DevOps From Scratch

A hands-on build-up of one web application, from a single server to microservices on Kubernetes, with notes on what breaks and why. Every stage ends with something I ran, a lessons file, and a short public post.

**Status:** In progress

## How it works

1. Build one stage at a time. Do not skip ahead.
2. Each stage folder has `README.md` (goal, steps, checklist), `LESSONS.md` (what broke, why, fix) and `QUESTIONS.md` (interview questions with my own answers).
3. After a stage, write one post from `templates/post.md` into `posts/`.
4. Only record what I actually ran. Mark anything unverified as "to verify".

## Stages

| # | Stage | Status |
|---|---|---|
| 01 | Monolith from scratch, no cloud: network, OS, app, CI/CD, scaling, DNS, TLS, ports, errors | In progress |
| 02 | The same monolith with Docker | Planned |
| 03 | Monolith on cloud, with and without Docker | Planned |
| 04 | Monolith vs microservices, and how to convert | In progress |
| 05 | Microservices on cloud: Docker, then Kubernetes, with Terraform | Planned |
| 06 | EKS vs GKE vs AKS | Planned |
| 07 | Ecosystem: Istio, Jenkins, Argo CD, Packer, Helm, Prometheus/Grafana, ELK, Terragrunt | Planned |
| 08 | Learn Google Cloud and Azure by mapping from AWS | Planned |
| 09 | Alternatives: other CI/CD and monitoring tools | Planned |
| 10 | AI in DevOps | Planned |

Details: [docs/curriculum.md](docs/curriculum.md).

## Rules

- Original work in my own words. No employer material or names.
- No secrets in git. Heavy workloads run in Codespaces or cloud, not on a small laptop.
- Cloud work starts with [docs/cloud-day1-checklist.md](docs/cloud-day1-checklist.md) and ends with a teardown and a leftover-resource check.
