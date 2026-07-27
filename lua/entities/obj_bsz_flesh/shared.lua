AddCSLuaFile()

ENT.Base = "obj_vj_projectile_base"
ENT.Type = "anim"
ENT.PrintName = "Flesh"
ENT.Author = "An average Beanmann"
ENT.Contact = ""
ENT.Category = "Bean's Sourcey Zombies"

if CLIENT then
	VJ.AddKillIcon("obj_bsz_flesh", ENT.PrintName, VJ.KILLICON_TYPE_ALIAS, "prop_physics")
end