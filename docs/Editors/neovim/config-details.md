# Configuration Details & Notes

## Important Settings

- System clipboard integration enabled via `clipboard=unnamedplus`.
- Line numbers: relative + absolute; scroll offset: 15; tab width: 4; wrap disabled by default (`<leader>lw` toggles).
- Telescope ignores `node_modules`, `.git`, `.venv`; shows hidden files by default.

## Installed LSP Servers

- Web: CSS, ESLint, HTML, Tailwind CSS, TypeScript/JavaScript
- Backend: Go, Python (ty + Ruff), JSON
- DevOps: Bash, Docker, Docker Compose, Helm, YAML
- Mobile/JVM: Java (jdtls), Kotlin, XML
- Documentation: LaTeX (texlab), Markdown (marksman), Grammar (ltex)
- Data: SQL
- Lua: Lua LS (for Neovim config)

## Custom Keybinding Patterns

- `x` deletes without copying.
- Centered scrolling/search moves.
- Visual paste keeps yank register.
- Split navigation via `<C-hjkl>` instead of `<C-w>hjkl`.
- `<Tab>` cycles buffers.
- `<leader>a/A` swap parameters.
