AddCSLuaFile()

ENT.Base = "obj_vj_projectile_base"
ENT.Type = "anim"
ENT.PrintName = "Tank Rock"
ENT.Author = "An average Beanmann"
ENT.Contact = ""
ENT.Category = "Projectiles"

if CLIENT then
	VJ.AddKillIcon("obj_bbohgz_tankrock", ENT.PrintName, VJ.KILLICON_TYPE_ALIAS, "prop_physics")
end
--------------------
if !SERVER then return end
ENT.Model = "models/props_debris/concrete_chunk01a.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY 
ENT.CollisionFilter = false
--------------------
ENT.DoesDirectDamage = true
ENT.DirectDamage = 35
ENT.DirectDamageType = DMG_CLUB
--------------------
ENT.SoundTbl_Idle = "player/tank/attack/thrown_missile_loop_1.wav"
ENT.SoundTbl_OnCollide = "player/tank/hit/thrown_projectile_hit_01.wav"
--------------------
ENT.BBoHG_TankRock_Type = "Rock" -- "Rock" or "Stump"
--------------------
function ENT:PreInit()
	if self.BBoHG_TankRock_Type == "Stump" then
		self.Model = "models/props_foliage/tree_trunk.mdl"
	end
end
--------------------
function ENT:Init()
	ParticleEffectAttach("hunter_slide_dust", 1, self, 0)
end
--------------------
function ENT:OnCollision(data, phys)

	if self.BBoHG_TankRock_Type == "Stump" then
		ParticleEffect("door_explosion_chunks", self:GetPos() + self:OBBCenter(), self:GetAngles())
		local stumpgib1 = ents.Create("prop_physics")
		stumpgib1:SetModel("models/props_foliage/tree_trunk_chunk01.mdl")
		stumpgib1:SetPos(self:GetPos())
		stumpgib1:SetAngles(self:GetAngles())
		stumpgib1:Spawn()
		stumpgib1:Activate()
		stumpgib1:SetCollisionGroup(1)
		if IsValid(stumpgib1:GetPhysicsObject()) then
			stumpgib1:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib1) then stumpgib1:Remove() end end)
		local stumpgib2 = ents.Create("prop_physics")
		stumpgib2:SetModel("models/props_foliage/tree_trunk_chunk02.mdl")
		stumpgib2:SetPos(self:GetPos())
		stumpgib2:SetAngles(self:GetAngles())
		stumpgib2:Spawn()
		stumpgib2:Activate()
		stumpgib2:SetCollisionGroup(1)
		if IsValid(stumpgib2:GetPhysicsObject()) then
			stumpgib2:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib2) then stumpgib2:Remove() end end)
		local stumpgib3 = ents.Create("prop_physics")
		stumpgib3:SetModel("models/props_foliage/tree_trunk_chunk03.mdl")
		stumpgib3:SetPos(self:GetPos())
		stumpgib3:SetAngles(self:GetAngles())
		stumpgib3:Spawn()
		stumpgib3:Activate()
		stumpgib3:SetCollisionGroup(1)
		if IsValid(stumpgib3:GetPhysicsObject()) then
			stumpgib3:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib3) then stumpgib3:Remove() end end)
		local stumpgib4 = ents.Create("prop_physics")
		stumpgib4:SetModel("models/props_foliage/tree_trunk_chunk04.mdl")
		stumpgib4:SetPos(self:GetPos())
		stumpgib4:SetAngles(self:GetAngles())
		stumpgib4:Spawn()
		stumpgib4:Activate()
		stumpgib4:SetCollisionGroup(1)
		if IsValid(stumpgib4:GetPhysicsObject()) then
			stumpgib4:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib4) then stumpgib4:Remove() end end)
		local stumpgib5 = ents.Create("prop_physics")
		stumpgib5:SetModel("models/props_foliage/tree_trunk_chunk05.mdl")
		stumpgib5:SetPos(self:GetPos())
		stumpgib5:SetAngles(self:GetAngles())
		stumpgib5:Spawn()
		stumpgib5:Activate()
		stumpgib5:SetCollisionGroup(1)
		if IsValid(stumpgib5:GetPhysicsObject()) then
			stumpgib5:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib5) then stumpgib5:Remove() end end)
		local stumpgib6 = ents.Create("prop_physics")
		stumpgib6:SetModel("models/props_foliage/tree_trunk_chunk06.mdl")
		stumpgib6:SetPos(self:GetPos())
		stumpgib6:SetAngles(self:GetAngles())
		stumpgib6:Spawn()
		stumpgib6:Activate()
		stumpgib6:SetCollisionGroup(1)
		if IsValid(stumpgib6:GetPhysicsObject()) then
			stumpgib6:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(stumpgib6) then stumpgib6:Remove() end end)
		ParticleEffectAttach("hunter_slide_dust", 1, stumpgib1, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, stumpgib2, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, stumpgib3, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, stumpgib4, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, stumpgib5, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, stumpgib6, 0)
	else
		ParticleEffect("rock_splinter_stalactite", self:GetPos() + self:OBBCenter(), self:GetAngles())
		local rockgib1 = ents.Create("prop_physics")
		rockgib1:SetModel("models/props_debris/concrete_spawnchunk001a.mdl")
		rockgib1:SetPos(self:GetPos())
		rockgib1:SetAngles(self:GetAngles())
		rockgib1:Spawn()
		rockgib1:Activate()
		rockgib1:SetCollisionGroup(1)
		if IsValid(rockgib1:GetPhysicsObject()) then
			rockgib1:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(rockgib1) then rockgib1:Remove() end end)
		local rockgib2 = ents.Create("prop_physics")
		rockgib2:SetModel("models/props_debris/concrete_spawnchunk001b.mdl")
		rockgib2:SetPos(self:GetPos())
		rockgib2:SetAngles(self:GetAngles())
		rockgib2:Spawn()
		rockgib2:Activate()
		rockgib2:SetCollisionGroup(1)
		if IsValid(rockgib2:GetPhysicsObject()) then
			rockgib2:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(rockgib2) then rockgib2:Remove() end end)
		local rockgib3 = ents.Create("prop_physics")
		rockgib3:SetModel("models/props_debris/concrete_spawnchunk001c.mdl")
		rockgib3:SetPos(self:GetPos())
		rockgib3:SetAngles(self:GetAngles())
		rockgib3:Spawn()
		rockgib3:Activate()
		rockgib3:SetCollisionGroup(1)
		if IsValid(rockgib3:GetPhysicsObject()) then
			rockgib3:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(rockgib3) then rockgib3:Remove() end end)
		local rockgib4 = ents.Create("prop_physics")
		rockgib4:SetModel("models/props_debris/concrete_spawnchunk001d.mdl")
		rockgib4:SetPos(self:GetPos())
		rockgib4:SetAngles(self:GetAngles())
		rockgib4:Spawn()
		rockgib4:Activate()
		rockgib4:SetCollisionGroup(1)
		if IsValid(rockgib4:GetPhysicsObject()) then
			rockgib4:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(rockgib4) then rockgib4:Remove() end end)
		local rockgib5 = ents.Create("prop_physics")
		rockgib5:SetModel("models/props_debris/concrete_spawnchunk001e.mdl")
		rockgib5:SetPos(self:GetPos())
		rockgib5:SetAngles(self:GetAngles())
		rockgib5:Spawn()
		rockgib5:Activate()
		rockgib5:SetCollisionGroup(1)
		if IsValid(rockgib5:GetPhysicsObject()) then
			rockgib5:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(rockgib5) then rockgib5:Remove() end end)
		local rockgib6 = ents.Create("prop_physics")
		rockgib6:SetModel("models/props_debris/concrete_spawnchunk001f.mdl")
		rockgib6:SetPos(self:GetPos())
		rockgib6:SetAngles(self:GetAngles())
		rockgib6:Spawn()
		rockgib6:Activate()
		rockgib6:SetCollisionGroup(1)
		if IsValid(rockgib6:GetPhysicsObject()) then
			rockgib6:GetPhysicsObject():AddVelocity(self:GetVelocity())
		end
		timer.Simple(GetConVar("vj_npc_gib_fadetime"):GetInt(), function() if IsValid(rockgib6) then rockgib6:Remove() end end)

		ParticleEffectAttach("hunter_slide_dust", 1, rockgib1, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, rockgib2, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, rockgib3, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, rockgib4, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, rockgib5, 0)
		ParticleEffectAttach("hunter_slide_dust", 1, rockgib6, 0)
	end

	ParticleEffect("door_pound_core", self:GetPos() + self:OBBCenter(), self:GetAngles())
	ParticleEffect("strider_wall_smash", self:GetPos() + self:OBBCenter(), self:GetAngles())

	util.ScreenShake(self:GetPos() + self:OBBCenter(), 200, 40, 1, 200)


end
--------------------
-- overwriting this so i can modify it to damage allies
function ENT:DealDamage(data, phys)
	local owner = self:GetOwner()
	local ownerValid = IsValid(owner)
	local dataEnt = data and data.HitEntity
	local hitEnts = false -- Entities that have been damaged (direct or radius)
	local dmgPos = (data and data.HitPos) or self:GetPos()
	if IsValid(dataEnt) && ((dataEnt.IsVJBaseBullseye && dataEnt.VJ_IsBeingControlled) or dataEnt.VJ_IsControllingNPC) then return end -- Don't damage bulleyes used by the NPC controller OR entities that are controlling others (Usually players)
	local selfData = self:GetTable()
	
	if selfData.DoesRadiusDamage then
		local attackEnt = ownerValid and owner or self -- The entity that will be set as the attacker
		-- If the projectile is picked up (Such as a grenade picked up by a human NPC), then the damage position is the parent's position
		if selfData.VJ_ST_Grabbed then
			local parent = self:GetParent()
			if IsValid(parent) && parent:IsNPC() then
				dmgPos = parent:GetPos()
			end
		end
		hitEnts = VJ.ApplyRadiusDamage(attackEnt, self, dmgPos, selfData.RadiusDamageRadius, selfData.RadiusDamage, selfData.RadiusDamageType, ownerValid && !owner:IsPlayer(), selfData.RadiusDamageUseRealisticRadius, {DisableVisibilityCheck=selfData.RadiusDamageDisableVisibilityCheck, Force=selfData.RadiusDamageForce, UpForce=selfData.RadiusDamageForce_Up, DamageAttacker=owner:IsPlayer()})
	end
	
	if selfData.DoesDirectDamage then
		if ownerValid then
			-- Accepts one of the 3 cases:
			-- Entity is not NPC/player
			-- Entity is NPC and not same class and (owner is a player OR not an ally NPC -- Players can still damage NPCs while NPCs can't damage other friendly NPCs)
			-- Entity is player and alive and (owner is player OR (ignore players is off and no target is off) -- Players can still damage each other while NPCs can't when ignore players is on)
			if IsValid(dataEnt) && ((!dataEnt:IsNPC() && !dataEnt:IsPlayer()) or (dataEnt:IsNPC() && dataEnt:GetClass() != owner:GetClass() && (owner:IsPlayer() or owner:IsNPC())) or (dataEnt:IsPlayer() && dataEnt:Alive() && (owner:IsPlayer() or (!VJ_CVAR_IGNOREPLAYERS && !dataEnt:IsFlagSet(FL_NOTARGET))))) then
				if hitEnts then
					hitEnts[#hitEnts + 1] = dataEnt
				else
					hitEnts = {dataEnt}
				end
				local dmgInfo = DamageInfo()
				if dataEnt:IsNPC() && owner:Disposition(dataEnt) == D_LI && dataEnt:Health() <= 100 then
					dmgInfo:SetDamage(200)
				else
					dmgInfo:SetDamage(selfData.DirectDamage)
				end
				dmgInfo:SetDamageType(selfData.DirectDamageType)
				-- dmgInfo:SetDamageForce(self:GetVelocity()) -- not working how i imagined, wanted it to fling the corpse of what it hit
				dmgInfo:SetAttacker(owner)
				dmgInfo:SetInflictor(self)
				dmgInfo:SetDamagePosition(dmgPos)
				VJ.DamageSpecialEnts(owner, dataEnt, dmgInfo)
				dataEnt:TakeDamageInfo(dmgInfo, self)
			end
		else
			if hitEnts then
				hitEnts[#hitEnts + 1] = dataEnt
			else
				hitEnts = {dataEnt}
			end
			local dmgInfo = DamageInfo()
			dmgInfo:SetDamage(selfData.DirectDamage)
			dmgInfo:SetDamageType(selfData.DirectDamageType)
			dmgInfo:SetAttacker(self)
			dmgInfo:SetInflictor(self)
			dmgInfo:SetDamagePosition(dmgPos)
			VJ.DamageSpecialEnts(self, dataEnt, dmgInfo)
			dataEnt:TakeDamageInfo(dmgInfo, self)
		end
	end
	
	self:OnDealDamage(data, phys, hitEnts)
end