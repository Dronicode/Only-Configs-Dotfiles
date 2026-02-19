return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls",
				-- Web Development (Frontend)
				"cssls", -- CSS language server
				"eslint", -- Linting and formatting for JS/TS
				"html", -- HTML and templating
				"tailwindcss", -- Tailwind CSS autocomplete
				"ts_ls", -- TypeScript and JavaScript support

				-- Backend Development
				"gopls", -- Go language server
				"jsonls", -- JSON config files
				"ty", -- Python type checking and language services
				"ruff", -- Fast Python linting and formatting

				-- DevOps & Infrastructure
				--  'ansiblels', -- Ansible playbooks
				"bashls", -- Shell scripting
				"docker_compose_language_service", -- Docker Compose support
				"dockerls", -- Dockerfile support
				"helm_ls", -- Helm chart support
				"yamlls", -- YAML files (Kubernetes, CI/CD)

				-- Mobile & JVM Development
				"jdtls", -- Full-featured Java LSP
				"kotlin_language_server", -- Kotlin support
				"lemminx", -- XML files (Android layouts)

				-- Game Development
				--  'gdscript', -- Godot GDScript
				--  'omnisharp', -- C# for Godot/Unity

				-- Documentation & Writing
				"ltex", -- Grammar checking in Markdown/LaTeX
				"marksman", -- Markdown editing (Obsidian, docs)
				"texlab", -- LaTeX editing

				-- Data & Query Languages
				"sqlls", -- SQL queries
				"stylua",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
}
