local status_ok, session_manager = pcall(require, "session_manager")
if not status_ok then
  return
end

local sm_config = require("session_manager.config")

session_manager.setup({
  autoload_mode = sm_config.AutoloadMode.CurrentDir,
})
