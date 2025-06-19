SMODS.ConsumableType{
    key = 'propemerintah',
    collection_rows = {4,5},
    primary_colour = G.C.RED,
    secondary_colour = G.C.DARK_EDITION,
    loc_txt = {
        collection = 'Program Pemerintah',
        name = 'program pemerintah',
    },
    shop_rate = 2,
}


--MAKAN SIANG GRATIS

SMODS.Sound({key = "makansig", path = "capsni.ogg",})

SMODS.Atlas{
    key = "makansiang",
    path = "makansiangconsum.png",
    px = 71,
    py = 95,
}


SMODS.Consumable {
    set = "propemerintah",
    key = "jimbolokal_makansiang",
	config = {
        -- How many cards can be selected.
        max_highlighted = 3,
        -- the key of the seal to change to
        extra = 'capsni',
    },
    loc_vars = function(self, info_queue, card)
        -- Handle creating a tooltip with seal args.
        info_queue[#info_queue+1] = G.P_SEALS[(card.ability or self.config).extra]
        -- Description vars
        return {vars = {(card.ability or self.config).max_highlighted}}
    end,
    loc_txt = {
        name = 'Makan Siang Gratis',
        text = {
            "pilih {C:attention}#1#{} kartu",
            "untuk di multiply"
        }
    },
    cost = 4,
    atlas = "makansiang",
    pos = {x=0, y=0},
    use = function(self, card, area, copier)
        for i = 1, math.min(#G.hand.highlighted, card.ability.max_highlighted) do
            G.E_MANAGER:add_event(Event({func = function()
                sound = "jimbolokal_makansig"
                card:juice_up(0.3, 0.5)
                return true end }))
            
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.hand.highlighted[i].seal = "jimbolokal_capsni"
                return true end }))
            
            delay(0.5)
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
    end
}