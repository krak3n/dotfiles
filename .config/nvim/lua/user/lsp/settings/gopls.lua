return {
	settings = {
		gopls = {
			analyses = {
				fieldalignment = true,
				unusedparams = true,
				shadow = true,
				staticcheck = true,
			},
			semanticTokens = true,
			completeUnimported = true,
			directoryFilters = { "-.git" },
			experimentalWorkspaceModule = true,
			gofumpt = true,
			staticcheck = true,
			usePlaceholders = true,
		},
	},
}
