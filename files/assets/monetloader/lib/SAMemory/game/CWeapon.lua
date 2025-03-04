--[[
	Project: SA Memory (Available from https://blast.hk/)
	Developers: LUCHARE, FYP

	Special thanks:
		plugin-sdk (https://github.com/DK22Pac/plugin-sdk) for the structures and addresses.

	Copyright (c) 2018 BlastHack.
	Modified by MonetLoader Team for mobile GTA: SA.
]]

local shared = require 'SAMemory.shared'

shared.require 'FxSystem_c'

shared.ffi.cdef[[
	typedef enum eWeaponState
	{
    WEAPONSTATE_READY,
    WEAPONSTATE_FIRING,
    WEAPONSTATE_RELOADING,
    WEAPONSTATE_OUT_OF_AMMO,
    WEAPONSTATE_MELEE_MADECONTACT
	} eWeaponState;

	typedef struct CWeapon
	{
		unsigned int 	nType;
		unsigned int 	nState;
		unsigned int 	nAmmoInClip;
		unsigned int 	nTotalAmmo;
		unsigned int 	nTimeForNextShot;
		char 				 	field_14; // bool m_bFirstPersonWeaponModeSelected
		char 					field_15; // bool m_bDontPlaceInHand
    FxSystem_c 		*pFxSystem;
	} CWeapon;
]]

--shared.validate_size('CWeapon', 0x1C)
