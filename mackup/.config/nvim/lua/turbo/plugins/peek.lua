return {
    "toppair/peek.nvim",
    priority = 10,
    build = "deno task --quiet build:fast",
    keys = {
        {
        "<leader>p",
        function()
            local peek = require("peek")
            if peek.is_open() then
            peek.close()
            else
            peek.open()
            end
        end,
        desc = "Peek (Markdown Preview)",
        },
    },
    opts = { theme = "dark" },
};