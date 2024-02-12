--[[
Before        Input         After
------------------------------------
{|}           <CR>          {
                                |
                            }
------------------------------------
--]]
local lib = require('lib')
local cmp_autopairs = lib.prequire('nvim-autopairs.completion.cmp')
local cmp = lib.prequire('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)
