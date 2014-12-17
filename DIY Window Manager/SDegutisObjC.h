#ifndef DIY_Window_Manager_SDegutisObjC_h
#define DIY_Window_Manager_SDegutisObjC_h

#import <Foundation/Foundation.h>
#import <Carbon/Carbon.h>

#import "lua.h"
#import "lauxlib.h"
#import "lualib.h"

void SDegutisSetupHotkeyCallback(BOOL(^thing)(UInt32 i, BOOL down));
void* SDegutisRegisterHotkey(UInt32 uid, UInt32 keycode, UInt32 mods);
void SDegutisUnregisterHotkey(void* hotkey);

int SDegutisLuaRegistryIndex = LUA_REGISTRYINDEX;

#endif