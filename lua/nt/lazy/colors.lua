function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

return {

  -- {
  --     "navarasu/onedark.nvim",
  --     config = function()
  --         require("onedark").setup({
  --             style = "darker",      -- The theme comes in three styles, `dark`, `darker`, `lighter`
  --             transparent = false, -- Enable this to disable setting the background color
  --             term_colors = false, -- If the background color is set using `colorscheme`, this option will be ignored
  --         })
  --         require("onedark").load()
  --         ColorMyPencils("onedark")
  --         vim.cmd("colorscheme onedark")
  --     end
  -- },
  -- -- {
  --     "shaunsingh/nord.nvim",
  --     lazy = false, -- Set to false to load it immediately on startup
  --     config = function()
  --         -- Nord theme configuration
  --         vim.cmd("colorscheme nord") -- This sets nord as the default colorscheme
  --
  --         -- Optional: Customize nord theme (optional settings)
  --         vim.g.nord_borders = true           -- Enable borders (default: true)
  --         vim.g.nord_italic = true            -- Enable italic comments (default: false)
  --         vim.g.nord_uniform_diff_background = true -- Uniform background for diffs (default: true)
  --
  --         -- Optional: Set up a background for specific filetypes
  --         vim.cmd([[autocmd FileType * highlight Normal guibg=NONE ctermbg=NONE]])
  --     end
  -- },
  {
      "folke/tokyonight.nvim",
      config = function()
          require("tokyonight").setup({
              -- your configuration comes here
              -- or leave it empty to use the default settings
              style = "moon",         -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
              transparent = false,     -- Enable this to disable setting the background color
              terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
              styles = {
                  -- Style to be applied to different syntax groups
                  -- Value is any valid attr-list value for `:help nvim_set_hl`
                  comments = { italic = true },
                  keywords = { italic = false },
                  -- Background styles. Can be "dark", "transparent" or "normal"
                  sidebars = "dark", -- style for sidebars, see below
                  floats = "dark",   -- style for floating windows
              },
          })
          -- vim.cmd("colorscheme tokyonight")
      end
  },


  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require('rose-pine').setup({
        disable_background = false,
        variant = 'moon',
      })
      vim.cmd("colorscheme rose-pine")
      ColorMyPencils()
    end
  },

  {
    "NvChad/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
      filetypes = { "css", "scss", "less", "sass", "html", "json", "javascript", "typescript", "javascriptreat", "typescriptreact", "vue", "html" },
      user_default_options = {
        RGB = true,                   -- #RGB hex codes
        RRGGBB = true,                -- #RRGGBB hex codes
        names = false,                -- "Name" codes like Blue or blue
        RRGGBBAA = true,              -- #RRGGBBAA hex codes
        AARRGGBB = true,              -- 0xAARRGGBB hex codes
        rgb_fn = true,                -- CSS rgb() and rgba() functions
        hsl_fn = true,                -- CSS hsl() and hsla() functions
        css = true,                   -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,                -- Enable all CSS *functions*: rgb_fn, hsl_fn
        tailwind = true,              -- Enable Tailwind's `bg-` and `text-` utilities
        -- Available modes for `mode`: foreground, background,  virtualtext
        mode = "virtualtext",         -- Set the display mode.
        -- Available methods are: "name", "rgb", "hsl", "ansi", "hex", "hsluv"
        method = "name",              -- Set the method to convert RGB, RGBA, HSL, HSLA, ANSI, HEX, HSLUV
        -- Available properties are: "foreground", "background" or "all"
        property = "foreground",      -- Set the property that is converted
        custom_patterns = {           -- Define how you want the plugin to convert a specific hex color to its name
          "(%d+%s+%d+%%?%s+%d+%%?) ", -- Custom HSL pattern
        }
      },

    },
  }

}
