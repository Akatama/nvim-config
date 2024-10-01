return {
    'renerocksai/telekasten.nvim',
    dependencies = {'nvim-telescope/telescope.nvim'},
    config = function()
        require('telekasten').setup({
            home = vim.fn.expand("/srv/Documents/Notes/"),
        })
    end
}
