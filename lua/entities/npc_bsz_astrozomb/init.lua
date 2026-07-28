include("entities/npc_bsz_zombie/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
--------------------
ENT.Model = "models/bsz/astrozombie.mdl"
--------------------
ENT.MeleeAttackDamageType = DMG_CLUB
--------------------
ENT.SoundTbl_Idle = {
	"bsz/vo/zombiemaster/shambler/growl_0.wav",
	"bsz/vo/zombiemaster/shambler/growl_1.wav",
	"bsz/vo/zombiemaster/shambler/growl_2.wav",
	"bsz/vo/zombiemaster/shambler/growl_3.wav",
	"bsz/vo/zombiemaster/shambler/growl_4.wav",
	"bsz/vo/zombiemaster/shambler/growl_5.wav",
	"bsz/vo/zombiemaster/shambler/growl_6.wav",
	"bsz/vo/zombiemaster/shambler/growl_7.wav",
	"bsz/vo/zombiemaster/shambler/growl_8.wav",
}
ENT.SoundTbl_Alert = {
	"bsz/vo/zombiemaster/shambler/growl_0.wav",
	"bsz/vo/zombiemaster/shambler/growl_1.wav",
	"bsz/vo/zombiemaster/shambler/growl_2.wav",
	"bsz/vo/zombiemaster/shambler/growl_3.wav",
	"bsz/vo/zombiemaster/shambler/growl_4.wav",
	"bsz/vo/zombiemaster/shambler/growl_5.wav",
	"bsz/vo/zombiemaster/shambler/growl_6.wav",
	"bsz/vo/zombiemaster/shambler/growl_7.wav",
	"bsz/vo/zombiemaster/shambler/growl_8.wav",
}
ENT.SoundTbl_BeforeMeleeAttack = {
	"bsz/vo/zombiemaster/shambler/zo_attack1.wav",
	"bsz/vo/zombiemaster/shambler/zo_attack2.wav"
}
ENT.SoundTbl_MeleeAttackExtra = {
	"npc/infected/hit/hit_punch_01.wav",
	"npc/infected/hit/hit_punch_02.wav",
	"npc/infected/hit/hit_punch_03.wav",
	"npc/infected/hit/hit_punch_04.wav",
	"npc/infected/hit/hit_punch_05.wav",
	"npc/infected/hit/hit_punch_06.wav",
	"npc/infected/hit/hit_punch_07.wav",
	"npc/infected/hit/hit_punch_08.wav"
}
ENT.SoundTbl_BeforeRangeAttack = {
	"bsz/vo/zombiemaster/shambler/zo_attack1.wav",
	"bsz/vo/zombiemaster/shambler/zo_attack2.wav"
}
ENT.SoundTbl_Pain = {
	"bsz/vo/zombiemaster/shambler/hit_0.wav",
	"bsz/vo/zombiemaster/shambler/hit_1.wav",
	"bsz/vo/zombiemaster/shambler/hit_2.wav",
	"bsz/vo/zombiemaster/shambler/hit_3.wav",
	"bsz/vo/zombiemaster/shambler/hit_4.wav",
	"bsz/vo/zombiemaster/shambler/hit_5.wav",
	"bsz/vo/zombiemaster/shambler/hit_6.wav",
	"bsz/vo/zombiemaster/shambler/hit_7.wav"
}
ENT.SoundTbl_Death = {
	"bsz/vo/zombiemaster/shambler/hit_0.wav",
	"bsz/vo/zombiemaster/shambler/hit_1.wav",
	"bsz/vo/zombiemaster/shambler/hit_2.wav",
	"bsz/vo/zombiemaster/shambler/hit_3.wav",
	"bsz/vo/zombiemaster/shambler/hit_4.wav",
	"bsz/vo/zombiemaster/shambler/hit_5.wav",
	"bsz/vo/zombiemaster/shambler/hit_6.wav",
	"bsz/vo/zombiemaster/shambler/hit_7.wav"
}
--------------------
ENT.BSZ_Zombie_MainType = "Charred"
ENT.BSZ_Zombie_MeleeDamage = 10
ENT.BSZ_Zombie_MeleeDamage_Duo = 15
ENT.BSZ_Zombie_MeleeDamage_Weak = 5
ENT.BSZ_Zombie_CanPlayBurningSound = false
-- ENT.BSZ_Zombie_BurningSoundTbl = {
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop1.wav",
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop2.wav",
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop3.wav",
	-- "bbohg/vo/zombie/zombiemaster/shambler/moan_loop4.wav"
-- }
--------------------
function ENT:BSZ_Zombie_CustomOnInit()

	-- self.HasRangeAttack = true
	-- self.RangeAttackProjectiles = "obj_bsz_flesh"
	-- self.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
	-- self.RangeAttackMinDistance = 75
	-- self.RangeAttackMaxDistance = 350
	-- self.TimeUntilRangeAttackProjectileRelease = false

	-- self:SetSkin(math.random(0,3))

	self.BSZ_AstroZombie_NextJumpTime = 0
	self.BSZ_AstroZombie_SuitDeflated = false

	-- if GetConVar("bbohgg_spawnsequences"):GetInt() == 1 then
		-- self:BSZ_DoSpawnSequence()
	-- else
		local ed = EffectData()
		ed:SetEntity( self )
		util.Effect( "propspawn", ed, true, true )
	-- end

end
--------------------
function ENT:OnThinkAttack()
	if CurTime() > self.BSZ_AstroZombie_NextJumpTime && self.EnemyData.Visible && self.EnemyData.DistanceNearest > 250 && self.EnemyData.DistanceNearest <= 500 && self:GetNavType() != NAV_JUMP && !self:IsBusy() then
		self:StopMoving()
		self:ResetMoveCalc()
		if self.CurrentSchedule then
			self.CurrentSchedule = nil
			self.CurrentScheduleName = nil
			self.CurrentTask = nil
			self.CurrentTaskID = nil
		end
		self.NextIdleTime = CurTime()
		self.NextChaseTime = CurTime()
		self:ForceMoveJump(VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", self:GetPos(), 1, 135))
		timer.Simple(0.75, function() if IsValid(self) then
			self:SetGravity(0.5)
		end end)
		self.BSZ_AstroZombie_NextJumpTime = CurTime() + math.random(5,10)
	end
end
--------------------
function ENT:OnChangeActivity(newAct)
	if newAct == ACT_JUMP then
		local randjumpsound = math.random(1,3)
		VJ.EmitSound(self, "bsz/fx/astrozombie_moonjump_0"..randjumpsound..".ogg", 80, 100)
		VJ.EmitSound(self, "bsz/fx/astrozombie_moonjump_0"..randjumpsound..".ogg", 80, 100)
	elseif newAct == ACT_LAND then
		local randlandsound = math.random(1,3)
		VJ.EmitSound(self, "bsz/fx/astrozombie_moonjump_land_0"..randlandsound..".ogg", 70, 100)
		VJ.EmitSound(self, "bsz/fx/astrozombie_moonjump_land_0"..randlandsound..".ogg", 70, 100)

		-- local myCenterPos = self:GetPos() + self:OBBCenter()
		-- local tr1 = util.TraceLine({
			-- start = myCenterPos,
			-- endpos = myCenterPos + self:GetUp() * -30,
			-- filter = self
		-- })
		-- if tr1.Hit && tr1.Entity:IsPlayer() then
			-- local dmgifo = DamageInfo()
			-- dmgifo:SetDamage(10)
			-- dmgifo:SetDamageType(DMG_CRUSH)
			-- dmgifo:SetAttacker(self)
			-- dmgifo:SetInflictor(self)
			-- tr1.Entity:TakeDamageInfo(dmgifo, self)
		-- end

	end
end
--------------------
function ENT:BSZ_CustomOnPreDamaged(dmginfo, hitgroup, status)
	if hitgroup == HITGROUP_GEAR then
		-- VJ.EmitSound(self, "physics/plastic/plastic_box_impact_bullet"..math.random(1,5)..".wav", 70, 100)
		local plasticimpact = EffectData()
		-- if dmginfo:GetHitBox() == 21 then -- backpack
			-- plasticimpact:SetSurfaceProp(30) -- computer
		-- else
			plasticimpact:SetSurfaceProp(50) -- plastic barrel
		-- plasticimpact:SetSurfaceProp(51) -- plastic box
		-- end
		plasticimpact:SetOrigin(dmginfo:GetDamagePosition())
		plasticimpact:SetNormal(dmginfo:GetDamageForce():GetNormalized())
		util.Effect("Impact", plasticimpact)
		self.Bleeds = false
		timer.Simple(0.001, function() if IsValid(self) then
			self.Bleeds = true
		end end)
	elseif !self.BSZ_AstroZombie_HelmetBroken && hitgroup == HITGROUP_HEAD then
		self.BSZ_AstroZombie_HelmetHealth = self.BSZ_AstroZombie_HelmetHealth - dmginfo:GetDamage()
		if self.BSZ_AstroZombie_HelmetHealth <= 0 then
			self.BSZ_AstroZombie_HelmetBroken = true
			self:SetHitboxSet(1)
			self:SetBodygroup(2,1)
			local glassbreakeffect = EffectData()
			glassbreakeffect:SetOrigin(self:GetAttachment(self:LookupAttachment("mouth")).Pos)
			util.Effect("GlassImpact", glassbreakeffect)
			VJ.EmitSound(self, "physics/glass/glass_sheet_break"..math.random(1,3)..".wav", 70, 100)
			if !self.BSZ_AstroZombie_SuitDeflated then
				local suitdeflationsounds = {
					"npc/infected/action/die/ceda_suit_deflate.wav",
					"npc/infected/action/die/ceda_suit_deflate_02.wav",
					"npc/infected/action/die/ceda_suit_deflate_03.wav"
				}
				self.BSZ_AstroZombie_SuitDeflated = true
				VJ.EmitSound(self, VJ.PICK(suitdeflationsounds), 60, 125)
			end
		else
			local glassimpact = EffectData()
			glassimpact:SetSurfaceProp(28) -- glass
			glassimpact:SetOrigin(dmginfo:GetDamagePosition())
			glassimpact:SetNormal(dmginfo:GetDamageForce():GetNormalized())
			util.Effect("Impact", glassimpact)
			self.Bleeds = false
			timer.Simple(0.001, function() if IsValid(self) then
				self.Bleeds = true
			end end)
		end
	end
end
--------------------
function ENT:BSZ_CustomOnPostDamaged(dmginfo, hitgroup, status)
	if hitgroup != HITGROUP_HEAD && hitgroup != HITGROUP_GEAR && !self.BSZ_AstroZombie_SuitDeflated && (dmginfo:IsBulletDamage() || dmginfo:IsDamageType(DMG_SLASH)) then
		local suitdeflationsounds = {
			"npc/infected/action/die/ceda_suit_deflate.wav",
			"npc/infected/action/die/ceda_suit_deflate_02.wav",
			"npc/infected/action/die/ceda_suit_deflate_03.wav"
		}
		self.BSZ_AstroZombie_SuitDeflated = true
		VJ.EmitSound(self, VJ.PICK(suitdeflationsounds), 60, 100)
	end
end