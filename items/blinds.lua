-- KPK BLIND
SMODS.Atlas {
    key = "indoblinds",
    path = "blindsatlas.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "kpkblind",
    key = "kpk",
    atlas = "indoblinds",
    mult = 2,
    pos = { y = 1 },
    dollars = 10,
    loc_txt = {
        name = 'KOMISI PEMBERANTAS KORUPSI',
        text = {
            'menonaktifkan kartu',
            'jenis pemerintah',
        }
    },
    boss = {  min = 1 },
    boss_colour = HEX('f44336'),

    recalc_debuff = function(self, card)
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center.pools and G.jokers.cards[i].config.center.pools.pemerintahcard then
                G.jokers.cards[i]:set_debuff(true)
            end
        end
    end,

    disable = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,

    defeat = function(self)
       for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:set_debuff(false)
       end
    end,
}

-- KEP KAT BLIND
SMODS.Atlas {
    key = "kepkat",
    path = "blindsatlas.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}
SMODS.Blind {
    name = "kepkat",
    key = "kepkat",
    atlas = "kepkat",
    mult = 1,
    pos = { y = 2 },
    dollars = 0,
    loc_txt = {
        name = 'KepKat',
        text = {
            'Semua Fitur Berbayar',
        }
    },
    boss = {  min = 4 },
    boss_colour = HEX('bbc8d3'),

     drawn_to_hand = function (self)
        ease_dollars(-5)
     end,

    press_play = function(self)
        ease_dollars(-5)
    end,

    defeat = function(self, tag, context)
        G.FUNCS.overlay_menu{
                definition = create_UIBox_custom_video1("kepkatend", "like dan subcribe"),
                config = {no_esc = true}
            }
        return true
     end
}




-- Meidan
SMODS.Atlas {
    key = "meidan",
    path = "blindsatlas.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
        
}

SMODS.Blind {
    name = "meidan",
    key = "meidan",
    atlas = "meidan",
    mult = 1,
    pos = { y = 3 },
    dollars = 8,
    loc_txt = {
        name = 'Meidan',
        text = {
            'Hanya boleh bermain jika memiliki',
            'steelcard di deck',
        }
    },
    boss = {  min = 3 },
    boss_colour = HEX('bbc8d3'),

    debuff_hand = function(self)
        local _hassteel = false
        for i = 1, #G.hand.cards do
            if SMODS.has_enhancement(G.hand.cards[i], 'm_steel') then
                _hassteel = true
            end
        end
        if _hassteel ~= true and not G.GAME.blind.disabled then
            SMODS.juice_up_blind()
            return true
        end
    end,
    
}
-- yucub Blind
SMODS.Atlas {
    key = "yucub",
    path = "blindsatlas.png",
    px = 34,
    py = 34,
    frames = 1,
    atlas_table = 'ANIMATION_ATLAS'
}

SMODS.Blind {
    name = "yucub",
    key = "yucub",
    atlas = "yucub",
    mult = 1,
    pos = { y = 4 },
    dollars = 5,
    loc_txt = {
        name = 'Yucub',
        text = {
            'iklan setiap tindakan',
        }
    },
    boss = {  min = 3 },
    boss_colour = HEX('a61a20'),


    press_play = function(self)
        G.FUNCS.overlay_menu{
                definition = create_UIBox_custom_video1("iklan2", "skipads"),
                config = {no_esc = true}
            }
        return true
        end,

    drawn_to_hand = function (self)
         G.FUNCS.overlay_menu{
                definition = create_UIBox_custom_video1("iklan2", "skipads"),
                config = {no_esc = true}
            }
        return true
    
     end,

     defeat = function(self, tag, context)
                G.FUNCS.overlay_menu{
                definition = create_UIBox_custom_video1("iklan3", "skipads"),
                config = {no_esc = true}
            }
        return true

     end

}

