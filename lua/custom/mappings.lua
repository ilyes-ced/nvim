local M = {}

M.dap = {
  -- might ned to be removed it doesn't work with rust (added for c/cpp)
  plugin = true,
  n = {
	["<leader>db"] = {
		"<cmd> DapToggleBreakpoint <CR>" ,
		"Toggle breakpoint"
	},
	["<leader>dr"] = {
	    "<cmd> DapContinue <CR>",
	    "start of continue the debugging"
	},
	["<leader>dus"] = {
		function ()
			local widgets = require('dap.ui.widgets');
			local sidebar = widgets.sidebar(widgets.scopes);
			sidebar.open();
		end,
		"Open debugging sidebar"
	},
  }
}

M.crates = {
	n = {
		["<C-h>"] =  {"<cmd> TmuxNavigateLeft <CR>", "window left"},
		["<C-l>"] =  {"<cmd> TmuxNavigateRight <CR>", "window right"},
		["<C-j>"] =  {"<cmd> TmuxNavigateLeftDown <CR>", "window down"},
		["<C-k>"] =  {"<cmd> TmuxNavigateLeftUp <CR>", "window up"},
	}
}

M.crates = {
	plugin = true,
	n = {
	  ["<leader>rcu"] = {
		function ()
		  require('crates').upgrade_all_crates()
		end,
		"update crates"
	  }
	}
  }
return M
