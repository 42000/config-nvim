GUI_FONT = "Consolas 7NF"
GUI_FONT_SIZE = 14

RefreshGuiFont = function()
    vim.o.guifont = string.format("%s:h%s",GUI_FONT, GUI_FONT_SIZE)
end

ResizeGuiFont = function(delta)
    GUI_FONT_SIZE = GUI_FONT_SIZE + delta
    RefreshGuiFont()
end

ResetGuiFont = function()
    GUI_FONT_SIZE = 10
    RefreshGuiFont()
end

ResetGuiFont()
