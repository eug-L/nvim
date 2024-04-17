vim.g.gitblame_date_format = '%d/%m/%y'
vim.g.gitblame_message_template = ' <summary> • <author> • <date>'
vim.g.gitblame_display_virtual_text = 1

require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = true,
}
