local servers = {
	-- Lua (for Neovim config and plugins)
	lua_ls = {
		-- settings = {
		-- 	Lua = {
		-- 		completion = { callSnippet = "Replace" },
		-- 		runtime = { version = "LuaJIT" },
		-- 		workspace = {
		-- 			library = vim.api.nvim_get_runtime_file("", true), -- Include runtime files
		-- 			checkThirdParty = false,
		-- 			library = vim.api.nvim_get_runtime_file("", true),
		-- 		},
		-- 		diagnostics = {
		-- 			disable = { "missing-fields" },
		-- 		},
		-- 		format = { enable = false },
		-- 	},
		-- },
	},

	-- Web Development (Frontend)
	cssls = {}, -- CSS language server
	eslint = {}, -- Linting and formatting for JS/TS
	html = { filetypes = { "html", "twig", "hbs" } }, -- HTML and templating
	tailwindcss = {}, -- Tailwind CSS autocomplete
	ts_ls = {}, -- TypeScript and JavaScript support

	-- Backend Development
	gopls = {}, -- Go language server
	jsonls = {}, -- JSON config files
	pyright = {}, -- Python LSP with type checking
	ruff = {}, -- Fast Python linter

	-- DevOps & Infrastructure
	--  ansiblels = {}, -- Ansible playbooks
	bashls = {}, -- Shell scripting
	docker_compose_language_service = {}, -- Docker Compose support
	dockerls = {}, -- Dockerfile support
	helm_ls = {}, -- Helm chart support
	yamlls = {}, -- YAML files (Kubernetes, CI/CD)

	-- Mobile & JVM Development
	jdtls = {}, -- Full-featured Java LSP
	kotlin_language_server = {}, -- Kotlin support
	lemminx = {}, -- XML files (Android layouts)

	-- Game Development
	--  gdscript = {}, -- Godot GDScript
	--  omnisharp = {}, -- C# for Godot/Unity

	-- Documentation & Writing
	ltex = {}, -- Grammar checking in Markdown/LaTeX
	marksman = {}, -- Markdown editing (Obsidian, docs)
	texlab = {}, -- LaTeX editing

	-- Data & Query Languages
	sqlls = {}, -- SQL queries
}

for server, _ in pairs(servers) do
	vim.lsp.enable(server)
end
