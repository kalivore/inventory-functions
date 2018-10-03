Scriptname _Q2C_Functions hidden

;-------------------------------------------------
;              Poison Functions
;-------------------------------------------------
; Q2C's original poison functions, updated for SKSE 1.7.3
; Note a slight change in format: Worn_PoisonWeapon has become WornObjectSetPoison,
; Worn_GetPoison has become WornObjectGetPoisonCharges etc

; Valid Hand Slot:
; 0 - Left
; 1 - Right

; this is already done by SKSE, so just forward on to that version
Potion Function WornObjectGetPoison(Actor akActor, int aiHandSlot, int aiSlotMask)										global
	return WornObject.GetPoison(akActor, aiHandSlot, aiSlotMask)
endFunction

int Function 	WornObjectSetPoison(Actor akActor, int aiHandSlot, int aiSlotMask, Potion akPoison, int aiCharges = 1) 	global native
{
	Applies akPoison to weapon in aiHandSlot.  Note the item MUST be a weapon, or the function will fail and return -1
	Returns: The number of poison charges the weapon now has (which should be the same as aiCharges)
			or -1 if unsuccessful
}

Function WornObjectRemovePoison(Actor akActor, int aiHandSlot, int aiSlotMask) 											global native
{
	Remove the poison from the weapon in aiHandSlot
}

int Function 	WornObjectGetPoisonCharges(Actor akActor, int aiHandSlot, int aiSlotMask) 								global native
{
	Get the number of poison charges on the weapon in aiHandSlot
	Returns: The number of charges, or -1 if unsuccessful for any reason
			(eg the item is not a weapon, or no poison applied)
}

int Function	WornObjectSetPoisonCharges(Actor akActor, int aiHandSlot, int aiSlotMask, int aiCharges = 1) 			global native
{
	Set the number of poison charges on the weapon in aiHandSlot
	Returns: The number of poison charges now on the weapon in aiHandSlot (which should be the same as aiCharges)
			or -1 if unsuccessful for any reason (eg the item is not a weapon, or no poison applied)
}


; this is also already done by SKSE, so just forward on to that version
Potion Function GetPoison(ObjectReference akObjRef)																		global
	return akObjRef.GetPoison()
endFunction

int Function 	SetPoison(ObjectReference akObjRef, Potion akPoison, int aiCharges = 1)									global native
{
	Applies akPoison to akObjRef.  Note the item MUST be a weapon, or the function will fail and return -1
	Returns: The number of poison charges the weapon now has (which should be the same as aiCharges)
			or -1 if unsuccessful
}

Function RemovePoison(ObjectReference akObjRef) 																		global native
{
	Remove the poison from the weapon akObjRef
}

int Function 	GetPoisonCharges(ObjectReference akObjRef) 																global native
{
	Get the number of poison charges on akObjRef
	Returns: The number of charges, or -1 if unsuccessful for any reason
			(eg the item is not a weapon, or no poison applied)
}

int Function	SetPoisonCharges(ObjectReference akObjRef, int aiCharges = 1) 											global native
{
	Set the number of poison charges on akObjRef
	Returns: The number of poison charges now on the weapon in aiHandSlot (which should be the same as aiCharges)
			or -1 if unsuccessful for any reason (eg the item is not a weapon, or no poison applied)
}


; These are all just shortcuts to the full WornObject versions above, sending aiSlotMask as 0
Potion Function	WornGetPoison(Actor akActor, int aiHandSlot) 															global
	return WornObject.GetPoison(akActor, aiHandSlot, 0)
endFunction

int Function 	WornSetPoison(Actor akActor, int aiHandSlot, Potion poison, int aiCharges = 1) 							global
	return WornObjectSetPoison(akActor, aiHandSlot, 0, poison, aiCharges)
endFunction

Function	WornRemovePoison(Actor akActor, int aiHandSlot) 															global
	WornObjectRemovePoison(akActor, aiHandSlot, 0)
endFunction

int Function 	WornGetPoisonCharges(Actor akActor, int aiHandSlot) 													global
	return WornObjectGetPoisonCharges(akActor, aiHandSlot, 0)
endFunction

int Function  	WornSetPoisonCharges(Actor akActor, int aiHandSlot, int aiCharges = 1) 									global
	return WornObjectSetPoisonCharges(akActor, aiHandSlot, 0, aiCharges)
endFunction



;-------------------------------------------------
;              Inventory Functions
;-------------------------------------------------
; Q2C's original functions, updated for SKSE 1.7.3
; Note that GetNumItemsWithKeyword groups by item type
; ie, a stack of ten daggers counts as ONE toward the total, NOT ten
int Function 	GetNumItemsWithKeyword(ObjectReference akObjRef, Keyword akKeyword) 									global native
Form Function 	GetNthFormWithKeyword(ObjectReference akObjRef, Keyword akKeyword, int aiItemIndex) 					global native

; I THINK these functions will return the full number of items in the container
; ie, a stack of ten daggers actually counts as ten items
; not actually implemented in the plugin yet though
;int Function 	GetTotalNumItemsWithKeyword(ObjectReference akObjRef, Keyword akKeyword) 								global native
;int Function 	GetTotalNumItems(ObjectReference akObjRef) 																global native

; added by Kalivore - type is the SKSE itemType (eg 26 for armour, or 46 for potion)
; full list at http://www.creationkit.com/index.php?title=GetType_-_Form
int Function 	GetNumItemsOfType(ObjectReference akObjRef, int aiType)			 										global native
Form Function 	GetNthFormOfType(ObjectReference akObjRef, int aiType, int aiItemIndex) 								global native



;-------------------------------------------------
;              Ammo Functions
;-------------------------------------------------
; needed for my Arrow Sheaves mod, as there were no SKSE funcs to set Damage or IsBolt :(

Function SetIsBolt(Ammo akAmmo, bool abIsBolt)  														global native
{
Sets whether this ammo is a bolt
}

Function SetProjectile(Ammo akAmmo, Projectile akProjectile)  											global native
{
Sets the projectile associated with this ammo
--WARNING!!-- Highly untested! >:$
}

Function SetDamage(Ammo akAmmo, float afDamage)  														global native
{
Sets the base damage of this ammo
}


;----------------------------------------
;     Additional spell-listing Functions
;          also added by Kalivore
;----------------------------------------
string Function SpellSchoolAny()				global
{returns an empty string ""}
 	return ""
endFunction
string Function SpellSchoolAlteration()			global
{returns "Alteration"}
 	return "Alteration"
endFunction
string Function SpellSchoolConjuration()		global
{returns "Conjuration"}
 	return "Conjuration"
endFunction
string Function SpellSchoolDestruction()		global
{returns "Destruction"}
 	return "Destruction"
endFunction
string Function SpellSchoolIllusion()			global
{returns "Illusion"}
 	return "Illusion"
endFunction
string Function SpellSchoolRestoration()		global
{returns "Restoration"}
 	return "Restoration"
endFunction

int Function SpellLevelAny() 					global
{returns -1}
 	return -1
endFunction
int Function SpellLevelNovice()					global
{returns 0 (all Novice spells I found were level 0)}
 	return 0
endFunction
int Function SpellLevelApprentice()				global
{returns 25}
 	return 25
endFunction
int Function SpellLevelAdept()					global
{returns 50}
 	return 50
endFunction
int Function SpellLevelExpert()					global
{returns 75}
 	return 75
endFunction
int Function SpellLevelMaster()					global
{returns 100}
 	return 100
endFunction

; Valid aiLevelComparison values (only applied if aiLevel >= 0):
int Function SpellLevelComparisonLt()			global
{returns -2. Means spell level must be lower than specified aiLevel to be counted}
 	return -2		 
endFunction
int Function SpellLevelComparisonLtEq()			global
{returns -1. Means spell level must be less than or equal to specified aiLevel to be counted}
 	return -1		 
endFunction
int Function SpellLevelComparisonEq()			global
{returns 0. Means spell level must be equal to specified aiLevel to be counted}
	return 0
endFunction
int Function SpellLevelComparisonGtEq()			global
{returns 1. Means spell level must be equal to or greater than specified aiLevel to be counted}
 	return 1
endFunction
int Function SpellLevelComparisonGt()			global
{returns 2. Means spell level must be greater than specified aiLevel to be counted}
 	return 2
endFunction


Spell[] Function 	ActorGetSpells(Actor akActor, Keyword akKeyword = None, string asSchool = "", int aiLevel = -1, int aiLevelComparison = 1, bool abSearchBase = true) 		global native
{
Scans the MagicEffects of the Actor's spells, adding the Spell to the returned array if the MagicEffect matches the criteria.
Use the default values to ignore that condition (eg sending asSchool as "" means 'of any School')
NOTE: as of v3, sending just the akActor (or sending all additional arguments as their default values) will now return ALL spells the Actor knows - rather than an empty list as before
Optionally will also check through the relevant ActorBase (which is more likely to be the one with the spells)
}

Spell[] Function 	ActorBaseGetSpells(ActorBase akActorBase, Keyword akKeyword = None, string asSchool = "", int aiLevel = -1, int aiLevelComparison = 1) 						global native
{
Scans the MagicEffects of the Actor's spells, adding the Spell to the returned array if the MagicEffect matches the criteria.
Use the default values to ignore that condition (eg sending asSchool as "" means 'of any School')
NOTE: as of v3, sending just the akActorBase (or sending all additional arguments as their default values) will now return ALL spells set on the ActorBase - rather than an empty list as before
}


Shout[] Function 	ActorBaseGetShouts(ActorBase akActorBase, Keyword akKeyword = None) 																						global native
{
Returns an array of Shouts that match the specified Keyword.
}



;----------------------------------------
;     Additional spell-checking Functions
;          also added by Kalivore
;----------------------------------------
bool Function 	ActorHasSpell(Actor akActor, Keyword akKeyword = None, string asSchool = "", int aiLevel = -1, int aiLevelComparison = 1, bool abSearchBase = true)			global
{
Scans the MagicEffects of the Actor's spells, returning true at the first one that matches any of the supplied criteria.
NOTE: as of v3, sending just the akActor (or sending all additional arguments as their default values) will now return TRUE - rather than FALSE as before
Optionally will also check through the relevant ActorBase (which is more likely to be the one with the spells)
}
	Spell[] spells = ActorGetSpells(akActor, akKeyword, asSchool, aiLevel, aiLevelComparison, abSearchBase)
	if (spells && spells.Length > 0)
		return true
	endIf
	return false
endFunction

bool Function 	ActorBaseHasSpell(ActorBase akActorBase, Keyword akKeyword = None, string asSchool = "", int aiLevel = -1, int aiLevelComparison = 1)						global
{
Scans the MagicEffects of the ActorBase's spells, returning true at the first one that matches any of the supplied criteria.
NOTE: as of v3, sending just the akActorBase (or sending all additional arguments as their default values) will now return TRUE - rather than FALSE as before
}
	Spell[] spells = ActorBaseGetSpells(akActorBase, akKeyword, asSchool, aiLevel, aiLevelComparison)
	if (spells && spells.Length > 0)
		return true
	endIf
	return false
endFunction


bool Function 	ActorBaseHasShout(ActorBase akActorBase, Keyword akKeyword)																									global
{
Scans the ActorBase's shouts, returning true at the first one that matches the specified Keyword.
}
	Shout[] shouts = ActorBaseGetShouts(akActorBase, akKeyword)
	if (shouts && shouts.Length > 0)
		return true
	endIf
	return false
endFunction


;----------------------------------------------------------------
;                 OBSOLETE spell-checking Functions
; (I added these before I figured out the generic approach above)
;----------------------------------------------------------------

bool Function 	ActorHasSpellLevel(Actor akActor, int aiLevel, bool abSearchBase = true) 													global
{
OBSOLETE - now just a pass-through to the main ActorHasSpell, with relevant default vals
Scans the MagicEffects of the Actor's spells, returning true at the first one equal to or greater than the relevant level.
Optionally will also check through the relevant ActorBase (which is more likely to be the one with the spells)
}
	return ActorHasSpell(akActor, None, SpellSchoolAny(), aiLevel, SpellLevelComparisonGtEq(), abSearchBase)
endFunction

bool Function 	ActorBaseHasSpellLevel(ActorBase akActorBase, int aiLevel) 																	global
{
OBSOLETE - now just a pass-through to the main ActorBaseHasSpell, with relevant default vals
Scans the MagicEffects of the ActorBase's spells, returning true at the first one equal to or greater than the relevant level.
}
	return ActorBaseHasSpell(akActorBase, None, SpellSchoolAny(), aiLevel, SpellLevelComparisonGtEq())
endFunction


bool Function 	ActorHasSpellSchool(Actor akActor, string asSchool, bool abSearchBase = true) 												global
{
OBSOLETE - now just a pass-through to the main ActorHasSpell, with relevant default vals
Scans the MagicEffects of the Actor's spells, returning true at the first one of the relevant school.
Optionally will also check through the relevant ActorBase (which is more likely to be the one with the spells)
}
	return ActorHasSpell(akActor, None, asSchool, SpellLevelAny(), SpellLevelComparisonGtEq(), abSearchBase)
endFunction

bool Function 	ActorBaseHasSpellSchool(ActorBase akActorBase, string asSchool) 															global
{
OBSOLETE - now just a pass-through to the main ActorBaseHasSpell, with relevant default vals
Scans the MagicEffects of the ActorBase's spells, returning true at the first one of the relevant school.
}
	return ActorBaseHasSpell(akActorBase, None, asSchool, SpellLevelAny(), SpellLevelComparisonGtEq())
endFunction


bool Function 	ActorHasSpellKeyword(Actor akActor, Keyword akKeyword, bool abSearchBase = true) 											global
{
OBSOLETE - now just a pass-through to the main ActorHasSpell, with relevant default vals
Scans the Actor's spells for the specified Keyword, returning true at the first one it finds
(NOTE - although Keywords are technically applied to the Magic Effects, the game considers them as being on Spell as well)
Optionally will also check through the relevant ActorBase (which is more likely to be the one with the spells)
}
	return ActorHasSpell(akActor, akKeyword, SpellSchoolAny(), SpellLevelAny(), SpellLevelComparisonGtEq(), abSearchBase)
endFunction

bool Function 	ActorBaseHasSpellKeyword(ActorBase akActorBase, Keyword akKeyword) 															global
{
OBSOLETE - now just a pass-through to the main ActorBaseHasSpell, with relevant default vals
Scans the ActorBase's spells for the specified Keyword, returning true at the first one it finds
The original version of this function would also implicitly check Shouts.  This is now handled 
by the dedicated ActorBaseHasShout function.  For back-compatibility, am explicitly falling through to this below
(NOTE - although Keywords are technically applied to the Magic Effects, the game considers them as being on Spell as well)
}
	return ActorBaseHasSpell(akActorBase, akKeyword, SpellSchoolAny(), SpellLevelAny(), SpellLevelComparisonGtEq()) || ActorBaseHasShout(akActorBase, akKeyword)
endFunction
