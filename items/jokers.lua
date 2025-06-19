--- STEAMODDED HEADER
--- MOD_NAME: Jimbolokal
--- MOD_ID: Jimbolokal
--- MOD_AUTHOR: gulajowo & 1stTHESTAR
--- MOD_DESCRIPTION: hi
--- PREFIX: jimbolokal
----------------------------------------------------------
----------- MOD CODE -------------------------------------

--Rate4joker
SMODS.Sound({key = "ordam", path = "kekuatanorangdalam.ogg",})

SMODS.Atlas{
    key = 'orangdalam',
    path = 'orangdalam.png',
    px = 71,
    py = 95
}

SMODS.Joker{ 
    key = 'orangdalam',
    loc_txt= {
        name = 'Orang Dalam',
        text = { "{C:attention}Mendisable Boss{}" ,
                    "Dan memberimu {X:mult,C:white}X20{}",
                    "setiap kartu 2-5 yang di mainkan",
                    "Dan memberimu {X:attention}$20{}",}
    },
    atlas = 'orangdalam',
    rarity = 4,
    cost = 20,
    pools = { ["kartulangkahcard"] = true },
    
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = {extra = {Xmult = 20,},
    unlock_condition = {type = '', extra = '', hidden = true}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult}  } 
    end,

     add_to_deck = function(self, card, from_debuff)

        play_sound("jimbolokal_ordam")
    end,
        
    calculate = function(self, card, context) 
        if context.setting_blind and (G.GAME.blind:get_type() == 'Boss') then
            G.GAME.blind:disable()
            return {
                
                message = "KEKUATAN ORANG DALAM!",
                
            }
        end

        if context.cardarea == G.play and context.individual and context.other_card then
            local rank = context.other_card:get_id()
                    if rank == 2 then
				return {
                    message = {"2"},
                    Xmult_mod = card.ability.extra.Xmult,

                }
			end
            local rank = context.other_card:get_id()
                    if rank == 3 then
				return {
                    message = {"3"},
                    Xmult_mod = card.ability.extra.Xmult,

                }
			end

            local rank = context.other_card:get_id()
                    if rank == 4 then
				return {
                    message = {"4"},
                    Xmult_mod = card.ability.extra.Xmult,

                }
			end


            local rank = context.other_card:get_id()
                    if rank == 5 then
				return {
                    message = {"5"},
                    Xmult_mod = card.ability.extra.Xmult,

                }
			end
        end
    end,



     calc_dollar_bonus = function(self,card)
        return 20
    end,



    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}









--Rate3joker
--KJM JOKER
SMODS.Atlas{
    key = 'kjmjoker',
    path = 'KJM.png',
    px = 71,
    py = 95
}

SMODS.Sound({key = "sembilan", path = "sembilan_kjm.ogg",})
SMODS.Sound({key = "enam", path = "enam_kjm.ogg",})
SMODS.Sound({key = "ayo", path = "ayoanakku_kjm.ogg",})

SMODS.Joker{ 
    key = 'kjmjoker',
    loc_txt= {
        name = 'Kang Joker Multiply',
        text = { "{X:Xmult,C:white} X#1# {} mengandakan skor" ,
                    "jika berisi {C:attention}9{} dan {}{C:attention}6{}"}
    },
    atlas = 'kjmjoker',
    rarity = 3,
    cost = 15,
    pools = {["pemerintahcard"] = true, ["jimbolokalcards"] = true },
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    config = { extra = {Xmult = 15}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.Xmult}  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            local hasnine = false
            local hassix = false
            for i = 1, #context.scoring_hand do
				if context.full_hand[i]:get_id() == 6 then
                    hassix = true
                end
                if context.full_hand[i]:get_id() == 9 then
                    hasnine = true
                end
            end

            if hasnine == true and hassix == true then   
			return {
				message = "ayo anak anakku!",
				Xmult_mod = card.ability.extra.Xmult,
                sound= "jimbolokal_ayo",

			}
            end
		end
        if context.cardarea == G.play and context.individual and context.other_card then
            local rank = context.other_card:get_id()
			if rank == 9 then
				return {
                    sound = 'jimbolokal_sembilan',
                    message = '9!',
                }
			end
            if rank == 6 then
				return {
                    sound = 'jimbolokal_enam',
                    message = '6!',

                }
			end
		end

    end,
}


--horegjoker
SMODS.Sound({key = "tukangtam", path = "tukangtambal.ogg",})
SMODS.Sound({key = "horegcon", path = "horegcon.ogg",})
SMODS.Sound({key = "jedug", path = "jedug.ogg",})


SMODS.Atlas{
    key = 'horeg',
    path = 'horeg.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'horeg',
    loc_txt= {
        name = 'Sound Horeg',
        text = { "Membuat Boss Tuli,",
                "{c:attention}DAN KALIAN YANG MAIN JUGA TULI{}",
            }
    },
    atlas = 'horeg',
    rarity = 3,
    cost = 8,
    pools = {["rakyatcard"] = true, ["jimbolokalcards"] = true},

    config = { extra = {storedmusicvol = 100}},

    
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    add_to_deck = function(self, card, from_debuff)
        play_sound("jimbolokal_horegcon")
    end,

    

    calculate = function(self, card, context)
        if context.setting_blind and (G.GAME.blind:get_type() == 'Boss') then
            G.GAME.blind:disable()
            card.ability.extra.storedmusicvol = G.SETTINGS.SOUND.music_volume
            G.SETTINGS.SOUND.music_volume = 100
            return {
                
                message = "Tarik Bang!",
                sound= 'jimbolokal_jedug',
                
            }
            
        end
     if context.joker_main and (G.GAME.blind:get_type() == 'Boss') then
            return {
                sound= "jimbolokal_tukangtam",
                message = "tukang tambal ban",}
            end

        if context.end_of_round and (G.GAME.blind:get_type() == 'Boss') then
        G.SETTINGS.SOUND.game_sounds_volume = 0
        end
    if context.blind_defeated and (G.GAME.blind:get_type() == 'Boss') then
          G.SETTINGS.SOUND.music_volume = card.ability.extra.storedmusicvol
             G.SETTINGS.SOUND.game_sounds_volume = 100
        
    end
    
    if context.game_over and (G.GAME.blind:get_type() == 'Boss') then
         G.SETTINGS.SOUND.music_volume = card.ability.extra.storedmusicvol
             G.SETTINGS.SOUND.game_sounds_volume = 100
        end
    end,


}


--Rate2joker
SMODS.Sound({key = "hidup", path = "hidup.ogg",})
SMODS.Sound({key = "hidupjacky", path = "hidupjack.ogg",})

SMODS.Atlas{
    key = 'jackowi',
    path = 'jackowi.png',
    px = 71,
    py = 95
}

SMODS.Joker{
    key = "jackowi",
    loc_txt={
        name = "Jack Owi",
        text = {"{C:red}+#1#{} Setiap ",
                "{c:attention}kartu jack{} saat dimainkan"
            },
    },

    atlas = "jackowi",
    rarity = 2,
    cost = 5,
    pools ={["pemerintahcard"]= true, ["rakyatcard"] = true, ["jimbolokalcards"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y=0},
    soul_pos = {x=0, y= 1},
    config = { extra = {mult = 13}},

    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.mult,}}
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            local hasjack = false
            for i = 1, #context.scoring_hand do
				if context.full_hand[i]:get_id() == 11 then
                    hasjack = true
                end
            end

            if hasjack == true then   
			return {
				message = "HIDUP JACKOWI!",
                sound = 'jimbolokal_hidupjacky',
				

			}
            end
		end
        if context.cardarea == G.play and context.individual and context.other_card then
            local rank = context.other_card:get_id()
			if rank == 11 then
				return {
                    sound = 'jimbolokal_hidup',
                    message = 'HIDUP!',
                    mult_mod = card.ability.extra.mult,
                }
			end
		end

    end,

--pak vincent joker
SMODS.Sound({key = "duavincent", path = "duavincent.ogg",}),
SMODS.Sound({key = "ambilvincent", path = "ambilvincent.ogg",}),

SMODS.Atlas{
    key = 'pakvincent',
    path = 'pakvincent.png',
    px = 71,
    py = 95
},

SMODS.Joker{
    key = 'pakvincent',
    loc_txt= {
        name = 'Pak Vincent',
        text = {
            "Akan Memberimu {C:dark_edition}+#2#{}",
            "Slot Joker",
            "dan memberimu{C:red}+#2#{}",
             "setiap kartu dua yang dimainkan"} 
    },

    atlas = "pakvincent",
    rarity = 2,
    cost = 8,
    pools ={["rakyatcard"] = true, ["jimbolokalcards"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y=0},
    soul_pos = {x=0, y= 1},
    config = {extra = {jokerslots = 2, mult = 2}},

    loc_vars = function (self,info_queue,center)
        return {vars ={center.ability.extra.jokerslots, center.ability.extra.mult} }
    end,

-- EXTRA VINCENT
     add_to_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.jokerslots
        play_sound("jimbolokal_ambilvincent")
    end,

    remove_from_deck = function(self, card, from_debuff)
		G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.jokerslots
	end,

--multvincent
calculate = function(self, card, context)
		if context.joker_main then
            local hastwo = false
            for i = 1, #context.scoring_hand do
				if context.full_hand[i]:get_id() == 2 then
                    hastwo = true
                end
            end

            if hastwo == true then   
			return {}
            end
		end
        if context.cardarea == G.play and context.individual and context.other_card then
            local rank = context.other_card:get_id()
			if rank == 2 then
				return {
                    sound = 'jimbolokal_duavincent',
                    message = 'dua lah',
                    mult_mod = card.ability.extra.mult,
                }
			end
		end

    end,




    

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
} 

}












--Rate1joker
--IDANG JOKER
SMODS.Sound({key = "heyidang", path = "heyidang.ogg",})

SMODS.Atlas{
    key = 'idangjoker',
    path = 'idang.png',
    px = 71,
    py = 95,
}

SMODS.Joker{
    key = 'idangjoker',
    loc_txt= {
        name = 'Idang',
        text = { 'memberimu',
                '{C:blue}+#2#{} Chips',
                'sebanyak subcribernya!',
                '{C:attention}makanya subcribe!{}'}
    },
       atlas = 'idangjoker',
    rarity = 1,
    cost = 5,
    pools = { ["youtubercard"] = true, ["jimbolokalcards"] = true},
    
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    soul_pos = {x=0, y= 1},
    config = { extra = {chips = 654}},

    loc_vars = function(self, info_queue, center)
		return { vars = { center.ability.extra.mult, center.ability.extra.chips  }  }
	end,

    calculate = function(self, card, context)
		if context.joker_main then
            return {
                sound= "jimbolokal_heyidang",
                message = "hey yo guys",
                chip_mod = card.ability.extra.chips,
                }
        end
    end,

    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}


--lowongankerja joker
SMODS.Sound({key = "kerja", path = "getajob.ogg",})

SMODS.Atlas{
    key = 'lowongankerjacard',
    path = 'lowongankerjacard.png',
    px = 70,
    py = 95,
}

SMODS.Joker{
    key = 'lowongankerjacard',
    loc_txt= {
        name = 'Lowongan Kerja',
        text = { "kamu akan di gaji {X:attention}$3{}",
    },           "saat menyelesaikan pekerjaanmu!",
    },

    atlas = 'lowongankerjacard',
    rarity = 1,
    cost = 2,
    pools = {["rakyatcard"] = true, ["jimbolokalcards"] = true},

    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = false,

    pos = {x=0, y= 0},
    calculate = function(self, card, context)
         if context.joker_main then
        G.showlowongankerja = 230
        play_sound("jimbolokal_kerja")
        end
    end,
    

       calc_dollar_bonus = function(self,card)
        G.FUNCS.overlay_menu{
                definition = create_UIBox_custom_video1("kerjaapaaja", "siap"),
                config = {no_esc = true}
            }
        return 3
    end,



    check_for_unlock = function(self, args)
        if args.type == 'test' then --not a real type, just a joke
            unlock_card(self)
        end
        unlock_card(self) --unlocks the card if it isnt unlocked
    end,
}













--pelengkap mod thanks to yahiamice for script


local upd = Game.update
function Game:update(dt)
    upd(self, dt)

    -- tick based events
    if Jimbolokal.ticks == nil then Jimbolokal.ticks = 0 end
    if Jimbolokal.dtcounter == nil then Jimbolokal.dtcounter = 0 end
    Jimbolokal.dtcounter = Jimbolokal.dtcounter+dt
    Jimbolokal.dt = dt

    while Jimbolokal.dtcounter >= 0.010 do
       Jimbolokal.ticks = Jimbolokal.ticks + 1
        Jimbolokal.dtcounter = Jimbolokal.dtcounter - 0.010


        if G.showlowongankerja and G.showlowongankerja > 0 then G.showlowongankerja = G.showlowongankerja - 1 end

        if #G.effectmanager > 0 then decrementingTickEvent("G.effectmanager",0) end

    end
end

--hooklove

local drawhook = love.draw
function love.draw()
    drawhook()
    function loadThatFuckingImage(fn)
        local full_path = (Jimbolokal.path 
        .. "customimages/" .. fn)
        local file_data = assert(NFS.newFileData(full_path),("Epic fail"))
        local tempimagedata = assert(love.image.newImageData(file_data),("Epic fail 2"))
        --print ("LTFNI: Successfully loaded " .. fn)
        return (assert(love.graphics.newImage(tempimagedata),("Epic fail 3")))
    end

    function loadThatFuckingImageSpritesheet(fn,px,py,subimg,orientation)
        local full_path = (Jimbolokal.path 
        .. "customimages/" .. fn)
        local file_data = assert(NFS.newFileData(full_path),("Epic fail"))
        local tempimagedata = assert(love.image.newImageData(file_data),("Epic fail 2"))

        local tempimg = assert(love.graphics.newImage(tempimagedata),("Epic fail 3"))

        local spritesheet = {}
        for i = 1, subimg do
            if orientation == 0 then -- 0 = downwards spritesheet
                table.insert(spritesheet,love.graphics.newQuad(0, (i-1)*py, px, py, tempimg))
            end
            if orientation == 1 then -- 1 = rightwards spritesheet
                table.insert(spritesheet,love.graphics.newQuad((i-1)*px, 0, px, py, tempimg))
            end
        end
        --print ("LTFNIS: Successfully loaded spritesheet " .. fn)

        return (spritesheet)
    end


    local _xscale = love.graphics.getWidth()/1920
    local _yscale = love.graphics.getHeight()/1080

    -- debugging ticks & dt & dtcounter
    if Jimbolokal.debug then
        love.graphics.setColor(1, 1, 1, 1) 
        love.graphics.print("ticks:"..Jimbolokal.ticks, 300, 16)
        love.graphics.print("dtcounter:"..Jimbolokal.dtcounter, 300, 16+32)
        love.graphics.print("dt:"..Jimbolokal.dt, 300, 16+64)
    end


--lowongankerja
if G.showlowongankerja and (G.showlowongankerja > 0) then
        if Jimbolokal.lwoongankerjapng == nil then Jimbolokal.lowongankerjapng = loadThatFuckingImage("lowongankerja.png") end
        love.graphics.setColor(1, 1, 1, 1) 
        love.graphics.draw(Jimbolokal.lowongankerjapng, 0*_xscale*2, 0*_yscale*2,0,_xscale*2*2,_yscale*2*2)
    end
end




-- get name of joker
function getJokerName(card)
    local _cardname = card.config.center.name
    if string.find(_cardname,"j_") then _cardname = card.config.center.loc_txt.name end
    return _cardname
end

-- get id of joker
function getJokerID(card)
    if G.jokers then
        local _selfid = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then _selfid = i end
        end
        return _selfid
    end
end

-- get id of joker
function getJokerID(card)
    if G.jokers then
        local _selfid = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then _selfid = i end
        end
        return _selfid
    end
end




-------------------------------------------------------------
----------- MOD CODE END ----------------------------------