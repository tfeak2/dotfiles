{...}:
{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    globals.mapleader = ",";

    colorschemes.catppuccin.enable = true;

    opts = {
      number = true;
      expandtab = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      termguicolors = true;
      autoindent = true;
      smartindent = true;
    };

    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>fg";
      }
      {
        action = "<cmd>Telescope find_files<CR>";
        key = "<leader>ff";
      }
      {
        action = "<cmd>Telescope buffers<CR>";
        key = "<leader>fb";
      }
      {
        action = "<cmd>Telescope help_tags<CR>";
        key = "<leader>fh";
      }
      {
        action = "<cmd>Neotree toggle<CR>";
        key = "<leader>t";
      }
    ];

    plugins = {
      lualine.enable = true;

      telescope = {
        enable = true;
        extensions = {
          file-browser.enable = true;
          fzf-native.enable = true;
        };
      };
      treesitter.enable = true;
      luasnip.enable = true;
      neo-tree.enable = true;

      nvim-colorizer.enable = true;
      neocord.enable = true;
      vimtex.enable = true;
      fidget.enable = true;
      indent-blankline = {
        enable = true;
        settings.scope = {
          show_start = false;
          show_end = false;
        };
      };

      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          vuels.enable = true;
          html.enable = true;
          cssls.enable = true;

          ccls.enable = true;
          cmake.enable = true;
          lua-ls.enable = true;
          pyright.enable = true;
          nil-ls.enable = true;

          ltex.enable = true;
          texlab.enable = true;
        };
      };

      lsp-format.enable = true;

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = { ghost_text = true; };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = { expand = "luasnip"; };

          sources = [
            {name = "nvim_lsp";}
            {name = "buffer"; keywordLength = 3;}
            {name = "path"; keywordLength = 3;}
            {name = "luasnip"; }
          ];
          mapping = {
            "<S-Tab>" = "cmp.mapping.close()";
            "<Tab>" =
            ''
              function(fallback)
                local line = vim.api.nvim_get_current_line()
                if line:match("^%s*$") then
                  fallback()
                elseif cmp.visible() then
                  cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                else
                  fallback()
                end
              end
            '';
            "<Down>" =
              ''
                function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif require("luasnip").expand_or_jumpable() then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
                  else
                    fallback()
                  end
                end
              '';
            "<Up>" =
              ''
                function(fallback)
                  if cmp.visible() then
                    cmp.select_prev_item()
                  elseif require("luasnip").jumpable(-1) then
                    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
                  else
                    fallback()
                  end
                end
              '';
          };
          formatting = {
            fields = [ "abbr" "kind" "menu" ];
            format =
              ''
                function(_, item)
                  local icons = {
                    Namespace = "󰌗",
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰆧",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈚",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "󰊄",
                    Table = "",
                    Object = "󰅩",
                    Tag = "",
                    Array = "[]",
                    Boolean = "",
                    Number = "",
                    Null = "󰟢",
                    String = "󰉿",
                    Calendar = "",
                    Watch = "󰥔",
                    Package = "",
                    Copilot = "",
                    Codeium = "",
                    TabNine = "",
                  }

                  local icon = icons[item.kind] or ""
                  item.kind = string.format("%s %s", icon, item.kind or "")
                  return item
                end
              '';
          };
          window = {
            completion = {
              winhighlight =
                "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
              scrollbar = false;
              sidePadding = 0;
              border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
            };

            settings.documentation = {
              border = [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ];
              winhighlight =
                "FloatBorder:CmpBorder,Normal:CmpPmenu,CursorLine:CmpSel,Search:PmenuSel";
            };
          };
        };
      };
      
      cmp-nvim-lsp.enable = true;
      cmp-buffer.enable = true;
      cmp-path.enable = true;
      cmp_luasnip.enable = true;

      none-ls = {
        enable = true;
        enableLspFormat = true;
        sources = {
          formatting.prettier = { enable = true; disableTsServerFormatter = true;};

        };
      };
    };
  };
}
