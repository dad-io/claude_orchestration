Create a new project scaffold.

$ARGUMENTS: "<project_name>" "<project_type: python|typescript|rust|web>"

Steps:
1) Create folder {project_name} if missing; initialize minimal skeleton for the selected type:
   - python: src/{project_name}/__init__.py, tests/, pyproject.toml
   - typescript: package.json, src/index.ts, test/, tsconfig.json
   - rust: Cargo.toml, src/lib.rs, tests/
   - web: index.html, src/main.ts, vite.config.ts
2) Add local test commands.
3) Append INIT-{project_name} to `MULTI_AGENT_PLAN.md` and set status to In Progress.
4) Print next steps.

Constraints:
- Do not add dependencies without confirmation.
- Keep diffs minimal and runnable.
