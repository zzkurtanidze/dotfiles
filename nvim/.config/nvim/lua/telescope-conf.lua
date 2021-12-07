require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.5 },
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    prompt_prefix = '   ',
    path_display = {"smart"},
  },
})
