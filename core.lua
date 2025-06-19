--- STEAMODDED HEADER
--- MOD_NAME: Jimbolokal
--- MOD_ID: Jimbolokal
--- MOD_AUTHOR: gulajowo & 1stTHESTAR
--- MOD_DESCRIPTION: hi
--- PREFIX: jimbolokal
----------------------------------------------------------
----------- MOD CODE -------------------------------------
-- shoutouts cryptid & mathisfun --

if not Jimbolokal then
	Jimbolokal = {}
end
G.C.mid_flash = 0
G.C.vort_time = 7
G.C.vort_speed = 0.4

-- from cryptid :}
local oldfunc = Game.main_menu
Game.main_menu = function(change_context)
	local ret = oldfunc(change_context)
	G.SPLASH_BACK:define_draw_steps({
			{
				shader = "splash",
				send = {
					{ name = "time", ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
           			{name = 'vort_speed', val = G.C.vort_speed},
            		{name = 'mid_flash', ref_table = G.C, ref_value = 'mid_flash'},
				},
			},
		})
	return ret
end


local mod_path = "" .. SMODS.current_mod.path
Jimbolokal.path = mod_path
Jimbolokal_config = SMODS.current_mod.config

SMODS.current_mod.optional_features = {
    retrigger_joker = true,
	post_trigger = true,
}

-- effect manager for particles etc

G.effectmanager = {}

-- Pemerintah joker pool
SMODS.ObjectType({
	key = "pemerintahcard",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

-- Youtuber joker pool
SMODS.ObjectType({
	key = "youtubercard",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

-- kartulangkah
SMODS.ObjectType({
	key = "kartulangkahcard",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

-- jimbolokalpack
SMODS.ObjectType({
	key = "jimbolokalcards",
	default = "j_reserved_parking",
	cards = {},
	inject = function(self)
		SMODS.ObjectType.inject(self)
		-- insert base game food jokers
	end,
})

--Load item files
local files = NFS.getDirectoryItems(mod_path .. "items")
for _, file in ipairs(files) do
	print("[jimbolokalmod] Loading lua file " .. file)
	local f, err = SMODS.load_file("items/" .. file)
	if err then
		error(err) 
	end
	f()
end

----------------------------------------------------------
----------- MOD CODE END ----------------------------------
