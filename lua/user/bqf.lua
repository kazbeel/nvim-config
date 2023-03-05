local bqf_ok, bqf = pcall(require, "bqf")
if not bqf_ok then
	return
end

bqf.setup()
