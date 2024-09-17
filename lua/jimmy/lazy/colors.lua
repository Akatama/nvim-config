
function ColorMyPencils(color)

	color = color or "lavender"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

return {
	url = "https://codeberg.org/jthvai/lavender.nvim",
	branch = "stable",
	name = "lavender",
	lazy = false,
	priority = 1000,
    config = function()
        ColorMyPencils()
    end
}
