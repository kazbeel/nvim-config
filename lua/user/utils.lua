_G.set_keymap = function(mode, lhs, rhs, opts)
	if opts == nil then
		opts = {}
	end

	local extended_opts = vim.tbl_extend("keep", opts, { silent = true, noremap = true })

	vim.keymap.set(mode, lhs, rhs, extended_opts)
end
