-- [nfnl] fnl/plugins/indent-blankline.fnl
return {{"lukas-reineke/indent-blankline.nvim", main = "ibl", event = {"BufReadPost", "BufNewFile"}, opts = {indent = {char = "\226\148\130", tab_char = "\226\148\130"}, scope = {enabled = true, show_start = true, show_end = false}, exclude = {filetypes = {"help", "dashboard", "neo-tree", "Trouble", "trouble", "lazy", "mason", "notify"}}}}}
