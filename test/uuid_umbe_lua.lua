package.path = package.path..";./?.lua"

local uuid = require("uuid_umbe_lua")

assert(type(uuid) == "function", "uuid not a function")

local first = uuid()
local second = uuid()

assert(first ~= second)
assert(type(uuid()) == "string")
