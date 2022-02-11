require('telescope').setup({
  defaults = {
    layout_config = {
      vertical = { width = 0.5 },
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    prompt_prefix = '   ',
    path_display = {"smart"},
    dynamic_preview_title = true,
    history = {
      mappings = {
        i = {
          ["<C-Down>"] = require('telescope.actions').cycle_history_next,
          ["<C-Up>"] = require('telescope.actions').cycle_history_prev,
        },
      }
    }
  },
  grep_string = {
    use_regex = true
  },
  live_grep = {
    use_regex = true
  }
})
