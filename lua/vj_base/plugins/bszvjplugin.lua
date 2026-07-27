VJ.AddPlugin("Bean's Sourcey Zombies", "NPC", "Version, 0.1")

local vCatZ = "Bean's Sourcey Zombies"
VJ.AddCategoryInfo(vCatZ, {Icon = "icons/bszicon.png"})

-- Zombies
	VJ.AddNPC("Zombie", "npc_bsz_zombie", vCatZ)
	-- Zombie Torsos
		VJ.AddNPC("Zombie Torso", "npc_bsz_zombie_torso", vCatZ)
	-- Zombie Legs
		VJ.AddNPC("Zombie Legs", "npc_bsz_zombie_legs", vCatZ)
-- Headcrabs
	VJ.AddNPC("Headcrab", "npc_bsz_headcrab", vCatZ)
	VJ.AddNPC("Headcrab (Hanging)", "npc_bsz_headcrab_hanging", vCatZ, false, function(x) x.OnCeiling = true x.Offset = 24.5 end)
-- Misc.
	VJ.AddNPC("Crabbed", "npc_bsz_crabbed", vCatZ)

-- -= ConVars =-
-- General
VJ.AddConVar("bsz_spawnintros", 1, FCVAR_ARCHIVE)
-- VJ.AddConVar("bsz_zombie_splitchance", 3, FCVAR_ARCHIVE) -- not yet implemented

if CLIENT then
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_BSZ", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "BSZ", "BSZ", "", "", function(Panel)

			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
					Panel:Help("#vjbase.menu.general.admin.not")
					Panel:Help("#vjbase.menu.general.admin.only")
				return
			end

			Panel:Help("#vjbase.menu.general.admin.only")

			Panel:Help("Changes do not affect already existing NPCs, only ones spawned after changes are made!")

			local bbohg_resetbutton = {Options = {}, CVars = {}, Label = "Reset Everything:", MenuButton = "0"}
				bbohg_resetbutton.Options["#vjbase.menugeneral.default"] = {
				bbohgg_nogodsnomasters = "0",
				bbohgg_disableitemdrops = "0",
				bbohgg_spawnsequences = "1",
				bbohgb_announcetoughenemies = "2",
				bbohgt_hostiletossers = "0",
				bbohgt_beergibs = "0",
			}
			Panel:AddControl("ComboBox", bbohg_resetbutton) -- AddControl is deprecated, need to find replacement

			Panel:CheckBox("Spawn intros?", "bsz_spawnintros")

		end)
	end)
end