SMODS.Sound({key = "standarnas", path = "sni.ogg",})

SMODS.Atlas {
    key = "capsni",
    path = "capsni.png",
    px = 71,
    py = 96
}

SMODS.Seal {
    name = "capsni",
    key = "capsni",
    badge_colour = HEX("000000"),
	config = { mult = 10,},
    loc_txt = {
        -- Badge name (displayed on card description when seal is applied)
        label = 'Cap SNI',
        -- Tooltip description
        name = 'Standar Nasional Indonesia',
        text = {
            '{C:mult}+#1#{} Mult',
        }
    },


    sound= "jimbolokal_standarnas",

    loc_vars = function(self, info_queue)
        return { vars = {self.config.mult} }
    end,
    atlas = "capsni",
    pos = {x=0, y=0},

    -- self - this seal prototype
    -- card - card this seal is applied to
    calculate = function(self, card, context)
        -- main_scoring context is used whenever the card is scored
        
        if context.main_scoring and context.cardarea == G.play then
            return {
                G.E_MANAGER:add_event(Event({func = function()
                play_sound('jimbolokal_standarnas')
                return true end })),

                mult = self.config.mult,
            }
        end
    end,
}
