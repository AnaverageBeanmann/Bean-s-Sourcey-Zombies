AddCSLuaFile()

ENT.Base = "obj_vj_projectile_base"
ENT.Type = "anim"
ENT.PrintName = "Tank Rock Chunk"
ENT.Author = "An average Beanmann"
ENT.Contact = ""
ENT.Category = "Projectiles"

if CLIENT then
	VJ.AddKillIcon("obj_bbohgz_tankrock_chunk", ENT.PrintName, VJ.KILLICON_TYPE_ALIAS, "prop_physics")
end
--------------------
if !SERVER then return end
ENT.Model = {
	"models/props_debris/concrete_spawnchunk001a.mdl",
	"models/props_debris/concrete_spawnchunk001b.mdl",
	"models/props_debris/concrete_spawnchunk001c.mdl",
	"models/props_debris/concrete_spawnchunk001d.mdl",
	"models/props_debris/concrete_spawnchunk001e.mdl",
	"models/props_debris/concrete_spawnchunk001f.mdl"
}
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY 
--------------------
ENT.DoesDirectDamage = true
ENT.DirectDamage = 15
ENT.DirectDamageType = DMG_CLUB
--------------------
ENT.SoundTbl_Idle = "player/tank/attack/thrown_missile_loop_1.wav"
ENT.SoundTbl_OnCollide = {
	"physics/concrete/boulder_impact_hard1.wav",
	"physics/concrete/boulder_impact_hard2.wav",
	"physics/concrete/boulder_impact_hard3.wav",
	"physics/concrete/boulder_impact_hard4.wav"
}
--------------------
ENT.BBoHG_TankRock_Type = "Rock" -- "Rock" or "Stump"
--------------------
function ENT:PreInit()
	-- if self.BBoHG_TankRock_Type == "Stump" then
		-- self.Model = "models/props_foliage/tree_trunk.mdl"
	-- end
end
--------------------
function ENT:Init()
	ParticleEffectAttach("hunter_slide_dust", 1, self, 0)
end
--------------------
function ENT:OnCollision(data, phys)

	-- if self.BBoHG_TankRock_Type == "Stump" then
		-- ParticleEffect("door_explosion_chunks", self:GetPos() + self:OBBCenter(), self:GetAngles())
		-- local stumpgib1 = ents.Create("prop_physics")
		-- stumpgib1:SetModel("models/props_foliage/tree_trunk_chunk01.mdl")
		-- stumpgib1:SetPos(self:GetPos())
		-- stumpgib1:SetAngles(self:GetAngles())
		-- stumpgib1:Spawn()
		-- stumpgib1:Activate()
		-- stumpgib1:SetCollisionGroup(1)
		-- if IsValid(stumpgib1:GetPhysicsObject()) then
			-- stumpgib1:GetPhysicsObject():AddVelocity(self:GetVelocity())
		-- end
		-- timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib1) then stumpgib1:Remove() end end)
		-- local stumpgib2 = ents.Create("prop_physics")
		-- stumpgib2:SetModel("models/props_foliage/tree_trunk_chunk02.mdl")
		-- stumpgib2:SetPos(self:GetPos())
		-- stumpgib2:SetAngles(self:GetAngles())
		-- stumpgib2:Spawn()
		-- stumpgib2:Activate()
		-- stumpgib2:SetCollisionGroup(1)
		-- if IsValid(stumpgib2:GetPhysicsObject()) then
			-- stumpgib2:GetPhysicsObject():AddVelocity(self:GetVelocity())
		-- end
		-- timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib2) then stumpgib2:Remove() end end)
		-- local stumpgib3 = ents.Create("prop_physics")
		-- stumpgib3:SetModel("models/props_foliage/tree_trunk_chunk03.mdl")
		-- stumpgib3:SetPos(self:GetPos())
		-- stumpgib3:SetAngles(self:GetAngles())
		-- stumpgib3:Spawn()
		-- stumpgib3:Activate()
		-- stumpgib3:SetCollisionGroup(1)
		-- if IsValid(stumpgib3:GetPhysicsObject()) then
			-- stumpgib3:GetPhysicsObject():AddVelocity(self:GetVelocity())
		-- end
		-- timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib3) then stumpgib3:Remove() end end)
		-- local stumpgib4 = ents.Create("prop_physics")
		-- stumpgib4:SetModel("models/props_foliage/tree_trunk_chunk04.mdl")
		-- stumpgib4:SetPos(self:GetPos())
		-- stumpgib4:SetAngles(self:GetAngles())
		-- stumpgib4:Spawn()
		-- stumpgib4:Activate()
		-- stumpgib4:SetCollisionGroup(1)
		-- if IsValid(stumpgib4:GetPhysicsObject()) then
			-- stumpgib4:GetPhysicsObject():AddVelocity(self:GetVelocity())
		-- end
		-- timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib4) then stumpgib4:Remove() end end)
		-- local stumpgib5 = ents.Create("prop_physics")
		-- stumpgib5:SetModel("models/props_foliage/tree_trunk_chunk05.mdl")
		-- stumpgib5:SetPos(self:GetPos())
		-- stumpgib5:SetAngles(self:GetAngles())
		-- stumpgib5:Spawn()
		-- stumpgib5:Activate()
		-- stumpgib5:SetCollisionGroup(1)
		-- if IsValid(stumpgib5:GetPhysicsObject()) then
			-- stumpgib5:GetPhysicsObject():AddVelocity(self:GetVelocity())
		-- end
		-- timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib5) then stumpgib5:Remove() end end)
		-- local stumpgib6 = ents.Create("prop_physics")
		-- stumpgib6:SetModel("models/props_foliage/tree_trunk_chunk06.mdl")
		-- stumpgib6:SetPos(self:GetPos())
		-- stumpgib6:SetAngles(self:GetAngles())
		-- stumpgib6:Spawn()
		-- stumpgib6:Activate()
		-- stumpgib6:SetCollisionGroup(1)
		-- if IsValid(stumpgib6:GetPhysicsObject()) then
			-- stumpgib6:GetPhysicsObject():AddVelocity(self:GetVelocity())
		-- end
		-- timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib6) then stumpgib6:Remove() end end)
		-- ParticleEffectAttach("hunter_slide_dust", 1, stumpgib1, 0)
		-- ParticleEffectAttach("hunter_slide_dust", 1, stumpgib2, 0)
		-- ParticleEffectAttach("hunter_slide_dust", 1, stumpgib3, 0)
		-- ParticleEffectAttach("hunter_slide_dust", 1, stumpgib4, 0)
		-- ParticleEffectAttach("hunter_slide_dust", 1, stumpgib5, 0)
		-- ParticleEffectAttach("hunter_slide_dust", 1, stumpgib6, 0)
	-- else

		local rockgib1 = ents.Create("prop_physics")
		rockgib1:SetModel(self:GetModel())
		rockgib1:SetPos(self:GetPos())
		rockgib1:SetAngles(self:GetAngles())
		rockgib1:Spawn()
		rockgib1:Activate()
		rockgib1:SetCollisionGroup(1)
		if IsValid(rockgib1:GetPhysicsObject()) then
			rockgib1:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(rockgib1) then rockgib1:Remove() end end)

		ParticleEffectAttach("hunter_slide_dust", 1, rockgib1, 0)
	-- end

	util.ScreenShake(self:GetPos() + self:OBBCenter(), 200, 40, 1, 75)


end
--------------------