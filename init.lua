require("settings")
if vim.g.vscode then
	require("partial-config")
else
	require("full-config")
end

