local function NOMOUSE()
  return [[  ]]
end

local gl = require('galaxyline')
local gls = gl.section
gl.short_line_list = {'LuaTree','vista','dbui'}

local colors = {
  bg = '#2E3440',
  yellow = '#EBCB8B',
  cyan = '#88C0D0',
  darkblue = '#4C566A',
  green = '#A3BE8C',
  orange = '#D08770',
  purple = '#B48EAD',
  magenta = '#8FBCBB',
  grey = '#3B4252',
  blue = '#5E81AC',
  red = '#BF616A',
  white = '#E5E9F0'
}

local separator = {
  right = "",
  left = "",
  right_thin = "",
  left_thin = "",
  left_round = '',
  right_round = ''
}

local whitespace = function()
  return ' '
end

local buffer_not_empty = function()
  if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
    return true end
  return false
end

local nvim_buffer = function()
  if vim.fn.bufname() == 'NvimTree' then
    return false end 
  return true
end

gls.left[1] = {
  FirstElement = {
    provider = whitespace,
    highlight = {colors.cyan,colors.cyan}
  },
}
gls.left[2] = {
  ViMode = {
    provider = function()
      local alias = {n = ' NORMAL ',i = ' INSERT ',c= ' COMMAND ',v= ' VISUAL ',V= ' VISUAL LINE ', [''] = ' VISUAL BLOCK '}
      return alias[vim.fn.mode()]
    end,
    condition = nvim_buffer,
    separator = separator.right,
    separator_highlight = {colors.cyan,function()
      if not buffer_not_empty() then
        return colors.cyan
      end
      return colors.darkblue
    end},
    highlight = {colors.darkblue,colors.cyan,'bold'},
  },
}

gls.mid[0] = {
  SeparatorLeft = {
    provider = function() return '' end,
    highlight = {colors.bg, colors.darkblue}
  }
}

gls.mid[1] = {
  FileIcon = {
    provider = {whitespace, whitespace, 'FileIcon'},
    condition = buffer_not_empty,
    highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
  },
}

gls.mid[2] = {
  FileName = {
    provider = {'FileName'},
    condition = buffer_not_empty,
    highlight = {colors.cyan,colors.bg,'bold'}
  }
}

gls.mid[4] = {
  SeparatorRight = {
    provider = function() return ' ' end,
    highlight = {colors.bg, colors.darkblue}
  }
}

gls.left[5] = {
  GitIcon = {
    provider = function() return '  ' end,
    condition = buffer_not_empty,
    highlight = {colors.white,colors.darkblue},
  }
}
gls.left[6] = {
  GitBranch = {
    provider = {'GitBranch', whitespace},
    condition = buffer_not_empty,
    separator = separator.right_thin,
    separator_highlight = {colors.white, colors.darkblue},
    highlight = {colors.white,colors.darkblue},
  }
}

local checkwidth = function()
  local squeeze_width  = vim.fn.winwidth(0) / 2
  if squeeze_width > 40 then
    return true
  end
  return false
end

gls.left[7] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.green,colors.darkblue},
  }
}
gls.left[8] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.orange,colors.darkblue},
  }
}
gls.left[9] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = checkwidth,
    icon = '  ',
    highlight = {colors.red,colors.darkblue},
  }
}
gls.left[11] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = {colors.red,colors.darkblue}
  }
}

gls.left[13] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = {colors.blue,colors.darkblue},
  }
}

gls.right[0] = {
  NoMouse = {
    provider = NOMOUSE,
    highlight = {colors.white,colors.darkblue}
  }
}
gls.right[2] = {
  LineInfo = {
    provider = {whitespace, 'LineColumn'},
    separator = separator.left_thin,
    separator_highlight = {colors.cyan,colors.darkblue},
    highlight = {colors.cyan,colors.darkblue},
  },
}
gls.right[3] = {
  PerCent = {
    provider = 'LinePercent',
    separator = separator.left,
    separator_highlight = {colors.cyan,colors.darkblue},
    highlight = {colors.darkblue,colors.cyan},
  }
}
gls.right[4] = {
  ScrollBar = {
    provider = {whitespace, whitespace, 'ScrollBar', whitespace},
    highlight = {colors.grey,colors.blue},
  }
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    condition = nvim_buffer,
    separator = separator.right,
    separator_highlight = {colors.cyan,colors.darkblue},
    highlight = {colors.darkblue,colors.cyan}
  }
}


gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    condition = nvim_buffer,
    separator = separator.left,
    separator_highlight = {colors.cyan,colors.darkblue},
    highlight = {colors.darkblue,colors.cyan}
  }
}

