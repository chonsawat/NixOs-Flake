{ pkgs, ... }: {
  programs.nvf.settings = {

    # Keymaps commons
    vim.globals.mapleader = " ";

    vim.keymaps = [

      # ===========================================
      #  Windows navigation
      # -------------------------------------------
      {
        key = "<C-h>";
        mode = [ "n" ];
        action = "<C-w><C-h>";
        desc = "Move focus to the window - Left";
      }
      {
        key = "<C-j>";
        mode = [ "n" ];
        action = "<C-w><C-j>";
        desc = "Move focus to the window - Up";
      }
      {
        key = "<C-k>";
        mode = [ "n" ];
        action = "<C-w><C-k>";
        desc = "Move focus to the window - Down";
      }
      {
        key = "<C-l>";
        mode = [ "n" ];
        action = "<C-w><C-l>";
        desc = "Move focus to the window - Right";
      }

      # ===========================================
      #  Common
      # -------------------------------------------
      {
        key = "<C-s>";
        mode = [ "n" ];
        action = "<cmd>w!<CR>";
        desc = "Save file (force)";
      }
      {
        key = "<Esc>";
        mode = [ "n" ];
        action = "<cmd>nohlsearch<CR>";
        desc = "No highlight Search";
      }
      {
        key = "<Esc><Esc>";
        mode = [ "t" ];
        action = "<C-\\><C-n>";
        desc = "Exit Terminal";
      }
      {
        key = "<leader>p";
        mode = [ "n" "v" "i" ];
        action = ''"_dP'';
        desc = "Paste without clear (lastest copied)";
      }

      # ===========================================
      #  Resize window
      # -------------------------------------------
      {
        key = "<C-Up>";
        mode = [ "n" "t" ];
        action = "<cmd>resize -2<CR>";
      }
      {
        key = "<C-Down>";
        mode = [ "n" "t" ];
        action = "<cmd>resize +2<CR>";
      }
      {
        key = "<C-Left>";
        mode = [ "n" "t" ];
        action = "<cmd>vertical resize -2<CR>";
      }
      {
        key = "<C-Right>";
        mode = [ "n" "t" ];
        action = "<cmd>vertical resize +2<CR>";
      }

      # ===========================================
      #  Split
      # -------------------------------------------
      {
        key = "<leader>wv";
        mode = [ "n" ];
        action = "<cmd>vsplit<cr>";
      }
      {
        key = "<leader>wh";
        mode = [ "n" ];
        action = "<cmd>split<cr>";
      }

      # ===========================================
      #  Move group of tab
      # -------------------------------------------
      {
        key = "J";
        mode = [ "v" ];
        action = ":m '>+1<CR>gv=gv";
      }
      {
        key = "K";
        mode = [ "v" ];
        action = ":m '<-2<CR>gv=gv";
      }

      # ===========================================
      #  Move Left / Right
      # -------------------------------------------
      {
        key = "<";
        mode = [ "v" ];
        action = "<gv";
        desc = "Indent left (in visual mode)";
      }
      {
        key = ">";
        mode = [ "v" ];
        action = ">gv";
        desc = "Indent right (in visual mode)";
      }
    ];

    # Plugins Keymaps
    # ===========================================
    #  Java maven
    # -------------------------------------------
    vim.lazy.plugins.${pkgs.vimPlugins.vim-floaterm.pname}.keys =
      let position = "bottomright";
      in [

        {
          mode = [ "n" "t" ];
          key = "<A-\\>";
          lua = true;
          action = ''
            function()
              local exists = vim.fn["floaterm#buflist#gather"]()[1]
              if exists ~= nil then
                vim.cmd [[FloatermToggle]]
              else
                vim.cmd [[FloatermNew --position=${position}]]
              end
            end
          '';
        }
        {
          mode = [ "n" "t" ];
          key = "<A-]>";
          action = "<cmd>FloatermNext<CR>";
        }
        {
          mode = [ "n" "t" ];
          key = "<A-[>";
          action = "<cmd>FloatermPrev<CR>";
        }
        {
          mode = [ "n" "t" ];
          key = "<A-k>";
          action = "<cmd>FloatermKill<CR>";
        }
        {
          mode = [ "n" "t" ];
          key = "<A-n>";
          action = "<cmd>FloatermNew --position=${position}<CR>";
        }
        {
          key = "<leader>jmr";
          mode = [ "n" ];
          lua = true;
          action = ''
            function()
              vim.cmd [[echo "Running (com.demo.App) ..."]]

              local exists = vim.fn["floaterm#terminal#get_bufnr"]('java-term')
              if exists == -1 then
                  vim.cmd [[FloatermNew --name=java-term --position=${position}]]
              else
                  vim.cmd [[FloatermShow --name=java-term]]
              end
              vim.cmd(string.format([[FloatermSend --name=java-term mvn package ]]))
              vim.cmd(string.format([[FloatermSend --name=java-term mvn exec:java -Dexec.mainClass="com.demo.App" -q]]))
            end
          '';
          desc = "Java Run maven (com.demo.App)";
        }
        {
          key = "<leader>jmR";
          mode = [ "n" ];
          lua = true;
          action = ''
            function()
              local user_input = vim.fn.input("Enter input: ")
              vim.cmd(string.format([[echo "Running (%s) ..."]], user_input))

              if user_input ~= "" then
                  local exists = vim.fn["floaterm#terminal#get_bufnr"]('java-term')
                  if exists == -1 then
                      vim.cmd [[FloatermNew --name=java-term --position=${position}]]
                  else
                      vim.cmd [[FloatermShow --name=java-term]]
                  end
                  vim.cmd(string.format([[FloatermSend --name=java-term mvn package]], user_input))
                  vim.cmd(string.format([[FloatermSend --name=java-term mvn exec:java -Dexec.mainClass="%s" -q]], user_input))
              else
                  print("Skipping execution because input is empty.")
              end
            end
          '';
          desc = "Java Run maven (Prompt)";
        }
      ];
  };
}
