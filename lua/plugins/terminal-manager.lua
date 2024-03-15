-- terminal manager plugins

return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",

        init = function()   -- executed before the plugin is loaded 
            -- enter and leave terminal context more easily
            function _G.set_terminal_keymaps()
                local opts = {buffer = 0}
                vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
            end
            -- if you only want these mappings for toggle term use term://*toggleterm#* instead
            vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()') 
            
            -- windows specific options
            local powershell_options = {
                shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
                shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
                shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
                shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
                shellquote = "",
                shellxquote = "",
            }
            for option, value in pairs(powershell_options) do
              vim.opt[option] = value
            end

        end,

        config = function()  -- executed after the plugin is loaded
            require("toggleterm").setup({
                open_mapping = "<F2>",
                direction = "horizontal",
            })
        end
    },
}
