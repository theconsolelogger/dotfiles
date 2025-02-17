return {
  "stevearc/conform.nvim",
  opts = {
    default_format_opts = {
      timeout_ms = 5000,
    },
    formatters_by_ft = {
      php = { "pint" },
    },
    formatters = {
      pint = {
        command = "./vendor/bin/pint",
        args = { "--quiet", "--dirty" },
        stdin = false,
      },
    },
  },
}
