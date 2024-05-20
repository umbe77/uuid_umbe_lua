#include <lua.h>
#include <lauxlib.h>
#include <uuid/uuid.h>

static int umbe_uuid(lua_State *L) {

    uuid_t uuid;
    char uuid_str[37];

    uuid_generate(uuid);
    uuid_unparse_lower(uuid, uuid_str);

    lua_pushstring(L, uuid_str);
    return 1;
}

int luaopen_uuid_umbe_lua(lua_State *L) {
    lua_pushcfunction(L, umbe_uuid);
    return 1;
}

