AddCSLuaFile()

ENT.Base = "obj_vj_projectile_base"
ENT.Type = "anim"
ENT.PrintName = "Poison Spit"
ENT.Author = "An average Beanmann"
ENT.Contact = ""
ENT.Category = "Bean's Bag of Hot Garbage"

if CLIENT then
	VJ.AddKillIcon("obj_bbohgz_poisonspit", ENT.PrintName, VJ.KILLICON_TYPE_ALIAS, "prop_physics")
end