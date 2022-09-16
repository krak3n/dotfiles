return {
	settings = {
		gopls = {
			analyses = {
				fieldalignment = true,
				unusedparams = true,
				shadow = true,
				staticcheck = true,
			},
			-- buildFlags = { "slt" },
			semanticTokens = true,
			completeUnimported = true,
			directoryFilters = { "-.git" },
			experimentalWorkspaceModule = true,
			gofumpt = false,
			staticcheck = true,
			usePlaceholders = true,
		},
	},
}
