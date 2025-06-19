local Jimbolokal = SMODS.current_mod
local config = Jimbolokal.config

function G.FUNCS.Jimbolokal_misc_options_exit()
	G.SETTINGS.paused = true
	SMODS.save_mod_config(Jimbolokal)
	SMODS.LAST_SELECTED_MOD_TAB = "config"
	G.FUNCS.overlay_menu({
		definition = create_UIBox_mods(Jimbolokal)
	})
end

G.FUNCS.Jimbolokal_save_and_apply = function(e)
	G.ACTIVE_MOD_UI = nil
	SMODS.save_all_config()
	SMODS.restart_game()
	SMODS.IN_MODS_TAB = nil
end

G.FUNCS.Jimbolokal_cycle_save = function(args)
	local ref = args.cycle_config.ref_value
	config[ref] = args.cycle_config.current_option
end