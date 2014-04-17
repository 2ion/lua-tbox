#!/usr/bin/env lua5.2

-- A Lua function that boxes strings like this:
-- +--------+
-- | STRING |
-- +--------+
-- It's useful when doing fancy print()ing.

local SRep = string.rep
local SFmt = string.format
local SLen = string.len
local type = type

-- s := the string to be boxed
-- w := (optional) box width. Will be auto-corrected to
-- leave at least a buffer of 1 to each box side as in the example
-- shown above. Widths < 1 are invalid.
return function ( s, w )
  if type(s) ~= 'string' or
    (w and (type(w) ~= 'number') or false) or 
    (w and w < 1 or false) then
    return nil
  end
  local s = s
  local sl = SLen(s)
  local w = w and w or (sl + 2)
  if w < (sl + 2) then w = sl + 2 end
  local u = SRep( '-', w )
  local b = SRep( ' ', (w-sl)/2 )
  return SFmt("+%s+\n|%s%s%s|\n+%s+",
               u, b, s, b, u)
end
