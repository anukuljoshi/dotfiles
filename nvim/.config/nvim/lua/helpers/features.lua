Map("", "<leader>do", 'ddm' .. THROWAWAY_MARK .. 'ggP`' .. THROWAWAY_MARK) -- Move line to the top
Map("", "<leader>db", 'ddm' .. THROWAWAY_MARK .. 'Gp`' .. THROWAWAY_MARK) -- Bottom

local function remove_highlighting__escape()
	Remove_highlighting()
	FeedKeysInt("<Esc>")
end
Map("n", "<Esc>", remove_highlighting__escape)
