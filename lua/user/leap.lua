local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end

leap.setup({})
leap.add_default_mappings()
