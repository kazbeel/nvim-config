return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      format = { enable = false },
      validate = { enable = true },
    },
  },
}
