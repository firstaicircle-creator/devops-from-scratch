# Monolith vs microservices

| Topic | Monolith | Microservices |
| --- | --- | --- |
| Updates | One build and deploy for everything. Simple pipeline, but a small change redeploys the whole app. | Deploy services independently. Smaller, safer releases, but needs strong automation. |
| Scaling | Scale by running more copies of the whole app, even if one feature is busy. | Scale only the busy service. |
| Failures | A crash or memory leak in the process takes the whole app down. | Failures are contained to a service if timeouts, retries and circuit breakers are in place. |
| Database | One shared database. Joins and ACID transactions keep data consistent. | Database per service. Consistency across services is eventual (events, sagas). |
| Tech stack | One language and framework. | Each service can choose its own. |
| Operations | Logs and metrics in one place. | Needs central logging, metrics and distributed tracing. More infrastructure. |
| Team speed | Fast at the start, slows as code and team grow. | Slow to set up, then teams ship in parallel. |
| Network | In-process calls: fast and reliable. | Network calls: latency, timeouts, partial failures. |
| Testing | End-to-end tests are straightforward. | Needs contract tests, mocks and integration environments. |
| Security | One perimeter and one auth system, but a breach reaches everything. | More endpoints to protect. Needs mTLS, network policies and least privilege to limit blast radius. |

## Added after review
- Start with a monolith (a modular one) and split only when scale or team size demands it.
- Cost: microservices add platform, tooling and on-call overhead.
- API versioning and backward compatibility matter once services call each other.

## To verify by doing
- Split one module out of a sample app and measure what changes.
