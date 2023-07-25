neovim config from source: [nvchad](https://nvchad.com/)

```bash
    rustup component add rust-analyzer  # maybe required i don't remember
    sudo pacman -S lldb
```



## debugging
create breakpoints :DapToggleBreakpoint

open debugger in rust with :RustDebuggable


```lua
lua local widgets = require("dap.ui.widgets"); local sidebar = widgets.sidebar(widgets.scopes); sidebar.open()
```
go line by line :DapStepOver