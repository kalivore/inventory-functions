#pragma once

#include "skse/PluginAPI.h"
#include "skse/skse_version.h"
#include "skse/GameAPI.h"
#include "skse/GameRTTI.h"
#include "skse/PapyrusArgs.h"
#include "skse/PapyrusVM.h"
#include "skse/PapyrusNativeFunctions.h"
#include "skse/PapyrusWornObject.h"
#include "skse/GameExtraData.h"
#include "skse/GameBSExtraData.h"
#include "skse/GameData.h"

namespace InventoryFunctions_ReferenceUtils
{
	UInt32 SetPoison(TESForm * baseForm, BaseExtraList* extraData, AlchemyItem* poison, UInt32 value);

	UInt32 GetPoisonCharges(TESForm * baseForm, BaseExtraList* extraData);
	UInt32 SetPoisonCharges(TESForm * baseForm, BaseExtraList* extraData, UInt32 value);
}

namespace InventoryFunctions_Papyrus
{
	VMResultArray<SpellItem*> ActorGetSpells(StaticFunctionTag* base, Actor* actor, BGSKeyword* thisKeyword, BSFixedString school, SInt32 level, SInt32 levelComparison, bool searchBase);
	VMResultArray<SpellItem*> ActorBaseGetSpells(StaticFunctionTag* base, TESNPC* thisNPC, BGSKeyword* thisKeyword, BSFixedString school, SInt32 level, SInt32 levelComparison);

	VMResultArray<TESShout*> ActorBaseGetShouts(StaticFunctionTag* base, TESNPC* thisNPC, BGSKeyword* keyword);


	UInt32 SetPoison(StaticFunctionTag* base, TESObjectREFR* object, AlchemyItem* poison, UInt32 value);
	void RemovePoison(StaticFunctionTag* base, TESObjectREFR* object);
	UInt32 GetPoisonCharges(StaticFunctionTag* base, TESObjectREFR* object);
	UInt32 SetPoisonCharges(StaticFunctionTag* base, TESObjectREFR* object, UInt32 value);

	UInt32 WornObjectSetPoison(WORNOBJECT_PARAMS, AlchemyItem* poison, UInt32 value);
	void WornObjectRemovePoison(WORNOBJECT_PARAMS);
	UInt32 WornObjectGetPoisonCharges(WORNOBJECT_PARAMS);
	UInt32 WornObjectSetPoisonCharges(WORNOBJECT_PARAMS, UInt32 value);


	template <class Op>
	UInt32 MyCountIfByKeyword(Op& op, TESObjectREFR* ObjRef, BGSKeyword* thisKeyword, bool Total);

	template <class Op>
	UInt32 MyCountIfByType(Op& op, TESObjectREFR* ObjRef, UInt32 type, bool Total);

	UInt32 GetNumItemsWithKeyword(StaticFunctionTag* base, TESObjectREFR* pContainerRef, BGSKeyword* thisKeyword);
	UInt32 GetNumItemsOfType(StaticFunctionTag* base, TESObjectREFR* pContainerRef, UInt32 type);

	TESForm* GetNthFormWithKeyword(StaticFunctionTag* base, TESObjectREFR* pContainerRef, BGSKeyword* thisKeyword, UInt32 n);
	TESForm* GetNthFormOfType(StaticFunctionTag* base, TESObjectREFR* pContainerRef, UInt32 type, UInt32 n);


	void SetIsBolt(StaticFunctionTag* base, TESAmmo* thisAmmo, bool isBolt);
	void SetProjectile(StaticFunctionTag* base, TESAmmo* thisAmmo, BGSProjectile* projectile);
	void SetDamage(StaticFunctionTag* base, TESAmmo* thisAmmo, float damage);


	bool RegisterPapyrusFunctions(VMClassRegistry* registry);
}
