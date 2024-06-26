--  ua automatically adds all .lua 
-- files in the nvim/lua directory to the namespace

-- order of import is relevant,
-- plugins have to be installed before configuring them

-- import the options
require("options")
-- import the plugins
require("plugins")
-- import the plugin options
require("plugin-options")
-- import the keybinds
require("keybindings")
