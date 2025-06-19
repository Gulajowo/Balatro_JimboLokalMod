--thanks to yahiamice for scripts


-- Booster Atlas
SMODS.Atlas{
    key = 'boosteratlas',
    path = 'boosteratlas.png',
    px = 71,
    py = 96,
}

SMODS.Sound({
    key = "music_buysomethin", 
    path = "tokomusik.ogg",
    pitch = 1,
    volume = 0.6,
    select_music_track = function()
        if G.STATE == G.STATES.SMODS_BOOSTER_OPENED then
            if G.pack_cards
                and G.pack_cards.cards
                and G.pack_cards.cards[1]
                and G.pack_cards.cards[1].config
                and G.pack_cards.cards[1].config.center
                and G.pack_cards.cards[1].config.center.mod
                and G.pack_cards.cards[1].config.center.mod.id 
                and G.pack_cards.cards[1].config.center.mod.id == "Jimbolokal" then
		        return true 
            end
        end
	end,
})


-- Booster Pack 1
SMODS.Booster{
    key = 'boostersatu',
    group_key = "k_jimbolokal_booster_group",
    atlas = 'boosteratlas', 
    pos = { x = 0, y = 0 },
    discovered = true,
    loc_txt= {
        name = 'Nusantara Booster',
        text = { "pilih{C:attention}#1#{}kartu", },
        group_name = {"Ya ini nyata bukan asbun doang!"},
    },
    
    draw_hand = false,
    config = {
        extra = 3,
        choose = 1, 
    },

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.choose, card.ability.extra } }
    end,

    weight = 1,
    cost = 5,
    kind = "jimbolokalpack",
    
    create_card = function(self, card, i)
        ease_background_colour(HEX("ffac00"))
        return SMODS.create_card({
            set = "jimbolokalcards",
            area = G.pack_cards,
            skip_materialize = true,
            soulable = true,
        })
    end,
    select_card = 'jokers',

    in_pool = function() return true end
}