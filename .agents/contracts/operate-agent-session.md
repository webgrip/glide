# Operate-agent-session contract

Context: De Vloer v0.1. Applies when operating this repository's workbench.

- Start the fixture demonstration with `npm run demo`, then open `http://127.0.0.1:4080`. This path uses no model calls. [Coworker walkthrough](../../docs/operations/demo.md).
- Live startup is `npm start -- --config config/live.local.json`. Administrator environment and runtime setup are defined in [live operation](../../docs/operations/live.md), not in this contract.
- Repository and crew IDs come from authenticated `GET /api/bootstrap`. Select registered values; user input cannot define process commands or endpoints.
- Use the [HTTP contract](../../docs/contracts/api.md) for session actions, durable event replay and human responses. User-facing commands remain subject to authenticated ownership and role checks.
- The tracker owns priority. `/api/ploeg` reads configured Ploeg queue information; it is not a dispatch or tracker-mutation endpoint.
- Preserve the session budget across interventions. Metering states are `demo`, `pending`, `settled` and `unknown`.
- Evidence and current qualification limits are in [validation](../../docs/validation.md). The application supports one SQLite writer and one application replica.
- Repository gates: `npm ci`, `npm run typecheck`, `npm test`, `npm run check`; chart gates: `helm lint ops/helm/de-vloer` and `helm template de-vloer ops/helm/de-vloer`.
- Credentials are supplied through supported environment variables or deployment Secrets. No secret values belong in this file, skills or event output.
