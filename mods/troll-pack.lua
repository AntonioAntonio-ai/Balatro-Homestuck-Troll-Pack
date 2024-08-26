jokerHook = initJokerHook()

if (sendDebugMessage == nil) then
    sendDebugMessage = function(_)
    end
end

table.insert(mods,
            {
            mod_id = "troll-pack",
            name = "Troll Pack",
            version = "0.1.0",
            author = "Joustsmuggler",
            description = {
                "Adds 16 Homestuck trolls as jokers."
            },
            enabled = true,
            on_post_update = function() 
                if not patched then
					-----------------------------------------
					sendDebugMessage("Parms")
					
					local toReplaceLogic = "elseif self.ability.name == 'Hiker' then loc_vars = {self.ability.extra}"

                    local replacementLogic = [[
						elseif self.ability.name == 'Karkat' then loc_vars = {self.ability.extra} self.ability.troll = true
						elseif self.ability.name == 'Aradia' then loc_vars = {self.ability.extra.ante} self.ability.troll = true
						elseif self.ability.name == 'Tavros' then loc_vars = {self.ability.extra.poker_hand} self.ability.troll = true
						elseif self.ability.name == 'Sollux' then loc_vars = {G.GAME.probabilities.normal, self.ability.extra.odds} self.ability.troll = true
						elseif self.ability.name == 'Nepeta' then loc_vars = {self.ability.extra.chips} self.ability.troll = true
						elseif self.ability.name == 'Kanaya' then loc_vars = {self.ability.extra.poker_hand, self.ability.extra.planets} self.ability.troll = true
						elseif self.ability.name == 'Terezi' then loc_vars = {self.ability.extra.odds, self.ability.extra.changes} self.ability.troll = true
						elseif self.ability.name == 'Eridan' then loc_vars = {self.ability.extra.faces, self.ability.extra.delete} self.ability.troll = true
						elseif self.ability.name == 'Equius' then loc_vars = {self.ability.extra.a, self.ability.extra.b, self.ability.extra.c, self.ability.extra.d} self.ability.troll = true
						elseif self.ability.name == 'Feferi' then loc_vars = {self.ability.extra.x_chips, self.ability.extra.x_muns} self.ability.troll = true
						elseif self.ability.name == 'Vriska' then loc_vars = {self.ability.extra.Xmult} self.ability.troll = true
						elseif self.ability.name == 'Gamzee' then loc_vars = {self.ability.extra, self.ability.x_mult} self.ability.troll = true
						elseif self.ability.name == 'Aradiabot' then loc_vars = {self.ability.extra.h_plays, self.ability.extra.h_size, self.ability.extra.d_size, self.ability.extra.sel_size} self.ability.troll = true
                        elseif self.ability.name == 'Hiker' then loc_vars = {self.ability.extra} self.ability.troll = true
						elseif self.ability.name == 'Fantrolls' then loc_vars = {self.ability.extra} self.ability.troll = true
						elseif self.ability.name == 'Callie' then loc_vars = {self.ability.extra.all, G.GAME.probabilities.normal} self.ability.troll = true
                    ]]
                    
                    inject("card.lua", "Card:generate_UIBox_ability_table()", toReplaceLogic, replacementLogic)
                    
                    -----------------------------------------
                    sendDebugMessage("Add Trolls")

					jokerHook.addJoker(self, "karkat", "Karkat", nil, true, 3, { x = 0, y = 0 }, nil, {extra = 3}, { "Permanently gives", "{C:chips}+3 Chips{} to cards", "discarded or", "left in hand"}, 2, true, true)
					jokerHook.addJoker(self, "aradia", "Aradia", nil, true, 6, { x = 0, y = 0 }, nil, {extra = {ante=2}}, { "Prevents death", "{C:dark_edition,E:1,S:0.1}Breaks things!{}"}, 2, true, true)
					jokerHook.addJoker(self, "tavros", "Tavros", nil, true, 4, { x = 0, y = 0 }, nil, {extra = {poker_hand = 'High Card'}}, { "If {C:blue}hand{} played is a", "single card, swap {C:blue}played{}", "and {C:attention}held{} hands"}, 2, true, true)
					jokerHook.addJoker(self, "sollux", "Sollux", nil, false, 8, { x = 0, y = 0 }, nil, {extra = {odds = 2}}, { "{C:green}#1# in #2#{} chance to", "enhance a card in hand", "to a {C:attention}Glass Card{} per", "Pair left in hand" }, 2, true, true)
					jokerHook.addJoker(self, "nepeta", "Nepeta", nil, true, 5, { x = 0, y = 0 }, nil, {extra = {chips = 25}}, { "{C:chips}+25 Chips{} {C:attention}purr{} Pair", "in played hand"}, 2, true, true)
					
					jokerHook.addJoker(self, "kanaya", "Kanaya", nil, true, 4, { x = 0, y = 0 }, nil, {extra = {poker_hand = 'Straight', planets=2}}, { "Spawns #2# random", "{C:blue}Planet{} cards if played", "hand is a {C:attention}#1#{}"}, 2, true, true)
					jokerHook.addJoker(self, "terezi", "Terezi", nil, false, 6, { x = 0, y = 0 }, nil, {extra = {odds = 0, changes = {}}}, { "Converts all {C:attention}listed", "{C:green,E:1,S:1.1}probabilities{} into", "a {C:attention}coinflip{} that is", "made per {C:blue}hand{} played"}, 2, true, true)
					jokerHook.addJoker(self, "vriska", "Vriska", nil, true, 8, { x = 0, y = 0 }, nil, {extra = {Xmult = 3}}, { "{X:mult,C:white} X#1# {} Mult per {C:attention}8{}", "{C:attention}of Spades{} scored,", "{C:red}-1{} Mult otherwise"}, 2, true, true)
					jokerHook.addJoker(self, "aradiabot", "Aradiabot", nil, false, 6, { x = 0, y = 0 }, nil, {extra = {h_plays = -1, h_size = -1, d_size = 2, sel_size = 1}}, { "{C:blue}#1# hands{} per round,", "{C:attention}#2# hand size{},", "{C:red}+#3# discards{},", "Gain a {C:red}discard{}", "per {C:blue}hand{} played"}, 2, true, true)	
					jokerHook.addJoker(self, "equius", "Equius", nil, true, 5, { x = 0, y = 0 }, nil, {extra = {a = "Sell this card to", b = "upgrade next hand", c = "played by 3 levels", d = "(Has free will)"}}, {"#1#", "#2#", "#3#", "#4#"}, 2, true, true)
					
					jokerHook.addJoker(self, "fantrolls", "Fantrolls", nil, true, 10, { x = 0, y = 0 }, nil, {extra = {muns=15, other=nil, me=self}}, { "Counts as two {C:dark_edition}Trolls{}", "{C:dark_edition}+1{} Joker Slot", "Worth $20"}, 2, true, true)
					jokerHook.addJoker(self, "gamzee", "Gamzee", nil, true, 9, { x = 0, y = 0 }, nil, {extra = 0.2, x_mult=1}, { "All cards in played", "hand are destroyed", "Gains {X:mult,C:white} X#1# {} Mult per", "card destroyed", "{C:red,E:1,S:1.5}Creates ghost cards{}", "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)" }, 2, true, true)
					jokerHook.addJoker(self, "eridan", "Eridan", nil, true, 5, { x = 0, y = 0 }, nil, {extra = {faces = 5, delete = nil}}, { "Discarding five {C:attention}face{}", "cards at once spawns", "a {C:spectral}Spectral{} card and", "destroys one of them", "{C:inactive}(Needs time to skin it){}"}, 2, true, true)
					jokerHook.addJoker(self, "feferi", "Feferi", nil, true, 7, { x = 0, y = 0 }, nil, {extra = {x_chips = 1.25, x_muns = 1.05}}, {"Scored {C:diamonds}Diamonds{} {C:attention}face{} ","cards give {X:chips,C:white}X#1#{} Chips", "and {X:money,C:white}X#2#{} {C:money}money{}"}, 2, true, true)
					jokerHook.addJoker(self, "callie", "Callie", nil, true, 11, { x = 0, y = 0 }, nil, {extra = {all = 11, mult = 0}}, {"Played cards that aren't", "scored give {C:mult}+#1#{} Mult and", "have a {C:green}#2# in #1#{} chance to", "add a random seal to them", "Has a {C:green}#2# in #1#{} chance to be", "destroyed before activating"}, 2, true, true)
                    ---------------------------------------------
					
					---------------------------------------------
					sendDebugMessage("Ghost Cards")
					local toReplaceLogic = 'if self.config.center.name == "Half Joker" then'

                    local replacementLogic = [[
                        if cardTable.ability.ghost == true then
							self.T.h = 0
							self.T.w = 0
						elseif self.config.center.name == "Half Joker" then 
                    ]]
                    
                    inject("card.lua", "Card:load", toReplaceLogic, replacementLogic)
					---------------------------------------------
					
					--[[
					local function get_source_code(f)
						local t = debug.getinfo (f)
						if t.linedefined < 0 then print("source",t.source); return end
						local name = t.source:gsub("^@","")
						local i = 0
						local text = {}
						for line in love.filesystem.read(name).contents do
							i=i+1
							if i >= t.linedefined then text[#text+1] = line end
							if i >= t.lastlinedefined then break end
						end
						return table.concat(text,"\n") 
					end
					
					local change = get_source_code(G.FUNCS.evaluate_play)
					G.FUNCS.evaluate_play = loadstring(G.FUNCS.evaluate_play)
					
					
				
					
					--sendDebugMessage("x_chips")
					--local toReplaceLogic = 'if effects[ii].x_mult then '

                    --local replacementLogic = [[
						

                    --    if effects[ii].x_mult then 
                    --]]
                    
                    ---------------------------------------------
					sendDebugMessage("Fantrolls add to deck")
					local toReplaceLogic = "if self.ability.name == 'Troubadour' then"

                    local replacementLogic = [[
                        if (self.ability.name == 'Fantrolls' and self.ability.eternal == nil and self.ability.extra_value ~= -5) then
							self.ability.extra_value = self.ability.extra.muns
							self:set_cost()
							local dummy = copy_card(self)
							dummy.T.h = 0
							dummy.T.w = 0
							dummy.ability.eternal = true
							dummy.ability.ghost = true
							dummy.ability.extra_value = -5
							dummy:set_cost()
							self.ability.other = dummy
							self.ability.other:add_to_deck()
							G.jokers:emplace(self.ability.other)
							G.jokers.config.card_limit = G.jokers.config.card_limit + 2
						end
						if self.ability.name == 'Troubadour' then
                    ]]
                    
                    inject("card.lua", "Card:add_to_deck", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Fantrolls delete when debuffed")
					local toReplaceLogic = "if context.before then"

                    local replacementLogic = [[
						if context.before then
					
                        if self.ability.name == 'Fantrolls' and self.debuff then
							G.jokers:remove_card(self)
						end
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Fantrolls remove deck")
					local toReplaceLogic = "if self.ability.name == 'Troubadour' then"

                    local replacementLogic = [[
                        if self.ability.name == 'Fantrolls' and self.ability.extra_value ~= -5 and not v then
							G.jokers:remove_card(self.ability.other)
							G.jokers.config.card_limit = G.jokers.config.card_limit - 2
							for i = 1, #G.jokers.cards do
								if G.jokers.cards[i].ability.ghost then
									G.jokers:remove_card(G.jokers.cards[i])
									do return end
								end
							end
						end
						if self.ability.name == 'Troubadour' then
                    ]]
                    
                    inject("card.lua", "Card:remove_from_deck", toReplaceLogic, replacementLogic)
					
                    ------------------------------------------
                    sendDebugMessage("Calculate Joker logic for all trolls")   
					sendDebugMessage("Karkat discard")
                    
                    local toReplaceLogic = "if self.ability.name == 'Trading Card' and not context.blueprint and "

                    local replacementLogic = [[
                        if self.ability.name == 'Karkat' and not context.other_card.debuff then
							context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
							context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + self.ability.extra
							
                            return {
                                message = localize('k_upgrade_ex'),
								card = self,
								colour = G.C.CHIPS
                            }
                        end
						
						if self.ability.name == 'Karkat' and not context.other_card.debuff then
							context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
							context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + self.ability.extra
							
                            return {
                                message = localize('k_upgrade_ex'),
								card = self,
								colour = G.C.CHIPS
                            }
                        end

                        if self.ability.name == 'Trading Card' and not context.blueprint and 
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					
					sendDebugMessage("Karkat left in hand")
					local toReplaceLogic = "if self.ability.name == 'Shoot the Moon' and"

                    local replacementLogic = [[
                        if self.ability.name == 'Karkat' then
							context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
							context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus + self.ability.extra
						
							if context.other_card.debuff then
								return {
									message = localize('k_debuffed'),
									colour = G.C.RED,
									card = self,
								}
							else
								return {
									message = localize('k_upgrade_ex'),
									card = self,
									colour = G.C.CHIPS
								}
							end
                        end

                        if self.ability.name == 'Shoot the Moon' and
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					------------------------------------------
					sendDebugMessage("Aradia death")
					local toReplaceLogic = "if self.ability.name == 'Mr. Bones' and"

                    local replacementLogic = [[
						if self.ability.name == 'Aradia' and context.game_over then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand_text_area.blind_chips:juice_up()
                            G.hand_text_area.game_chips:juice_up()
                            play_sound('tarot1')
                            return true
                        end
                    })) 
					
				local joker_count = #G.jokers.cards
				
                for i = 1, #G.jokers.cards do
                    if not G.jokers.cards[i].ability.eternal and not G.jokers.cards[i].getting_sliced then
						G.jokers.cards[i].getting_sliced = true
                    G.E_MANAGER:add_event(Event({func = function()
                        (context.blueprint_card or self):juice_up(0.8, 0.8)
                        G.jokers.cards[i]:start_dissolve({G.C.RED}, nil, 1.6)
                    return true end }))
					else
						joker_count = joker_count - 1
					end
                end
				if not (context.blueprint_card or self).getting_sliced then
                    card_eval_status_text((context.blueprint_card or self), 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.x_mult}}})
                end
				
				local posse = {{foil=true}, {holo=true}, {polychrome=true}}
				local possm = {'m_lucky', 'm_mult', 'm_bonus', 'm_wild', 'm_glass', 'm_steel', 'm_gold', 'm_stone'}
				local posss = {'Red', 'Blue', 'Purple', 'Gold'}
				
				for i, card in pairs(G.playing_cards) do
					card.base.value = pseudorandom_element({'Ace', 'King', 'Jack', 'Queen', '2', '3', '4', '5', '6', '7', '8', '9', '10'}, pseudoseed('joker_create'))
					card:change_suit(pseudorandom_element({'Diamonds', 'Clubs', 'Hearts', 'Spades'}, pseudoseed('joker_create')))
				
					if pseudorandom('materiel', 1, 6) == 4 then 
						card:set_ability(G.P_CENTERS[pseudorandom_element(possm, pseudoseed('joker_create'))])
					end
					if pseudorandom('seal', 1, 12) == 8 then 
						card:set_seal(pseudorandom_element(posss, pseudoseed('joker_create')), true, true)
					end
					if pseudorandom('material', 1, 24) == 16 then 
						card:set_edition({foil = true})
					end
				end
				
				for i = 1, joker_count do

					G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Joker', G.jokers, false, nil, nil, nil, nil, 'jud')
					card:add_to_deck()
					card:set_edition({foil=true})
					G.jokers:emplace(card)
					return true end }))
				end
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Tarot', G.jokers, false, nil, nil, nil, nil, 'emp')
					card:add_to_deck()
					card:set_edition({polychrome=true})
					G.jokers:emplace(card)
					return true end }))
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Planet', G.jokers, false, nil, nil, nil, nil, 'pri')
					card:add_to_deck()
					card:set_edition({polychrome=true})
					G.jokers:emplace(card)
					return true end }))
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Tarot', G.consumeables, false, nil, nil, nil, nil, 'emp')
					card:add_to_deck()
					card:set_edition({negative=true}, true)
					G.consumeables:emplace(card)
					return true end }))
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Planet', G.consumeables, false, nil, nil, nil, nil, 'pri')
					card:add_to_deck()
					card:set_edition({negative=true}, true)
					G.consumeables:emplace(card)
					return true end }))
				
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Spectral', G.hand, nil, nil, nil, nil, nil, 'sixth')
					card:add_to_deck()
					card.base.value = 'Ace'
					card.base.nominal = 11 
					card.base.face_nominal = 0.4 
					card.base.id = 14
					card.base.suit = 'Spades'
					card.base.suit_nominal = 0.04  
					card.base.suit_nominal_original = 0.004
					
					G.hand:emplace(card)
					return true end }))
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Joker', G.hand, false, nil, nil, nil, nil, 'jud')
					card:add_to_deck()
					--card:set_edition({polychrome = true}, true, true)
					card.base.value = pseudorandom_element({'Ace', 'Jack', '2', '8'}, pseudoseed('joker_create'))
					if card.base.value == '8' then card.base.nominal = 8; card.base.id = 8
					elseif card.base.value == '2' then card.base.nominal = 2; card.base.id = 2
    elseif card.base.value == 'Jack' then card.base.nominal = 10; card.base.face_nominal = 0.1; card.base.id = 11
    elseif card.base.value == 'Ace' then card.base.nominal = 11; card.base.face_nominal = 0.4; card.base.id = 14 end
					card.base.suit = 'Hearts'
					card.base.suit_nominal = 0.03  
					card.base.suit_nominal_original = 0.003
					
					G.hand:emplace(card)
					return true end }))
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Tarot', G.hand, false, nil, nil, nil, nil, 'emp')
					card:add_to_deck()
					card.base.value = pseudorandom_element({'King', 'Jack', 'Queen', 'Queen', 'King'}, pseudoseed('joker_create'))
    if card.base.value == 'Jack' then card.base.nominal = 10; card.base.face_nominal = 0.1; card.base.id = 11
    elseif card.base.value == 'Queen' then card.base.nominal = 10; card.base.face_nominal = 0.2; card.base.id = 12
    elseif card.base.value == 'King' then card.base.nominal = 10; card.base.face_nominal = 0.3; card.base.id = 13 end
					card.base.suit = 'Clubs'
					card.base.suit_nominal = 0.02  
					card.base.suit_nominal_original = 0.002
					
					G.hand:emplace(card)
					return true end }))
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Planet', G.hand, false, nil, nil, nil, nil, 'pri')
					card:add_to_deck()
					card.base.value = pseudorandom_element({'2', '3', '4', '5', '6', '7', '8', '9', '10'}, pseudoseed('joker_create'))
					if card.base.value == '8' then card.base.nominal = 8; card.base.id = 8
					elseif card.base.value == '2' then card.base.nominal = 2; card.base.id = 2
					elseif card.base.value == '3' then card.base.nominal = 3; card.base.id = 3
					elseif card.base.value == '4' then card.base.nominal = 4; card.base.id = 4
					elseif card.base.value == '5' then card.base.nominal = 5; card.base.id = 5
					elseif card.base.value == '6' then card.base.nominal = 6; card.base.id = 6
					elseif card.base.value == '7' then card.base.nominal = 7; card.base.id = 7
					elseif card.base.value == '9' then card.base.nominal = 9; card.base.id = 9
					elseif card.base.value == '10' then card.base.nominal = 10; card.base.id = 10 end
					card.base.suit = 'Diamonds'
					card.base.suit_nominal = 0.01  
					card.base.suit_nominal_original = 0.001
					
					G.hand:emplace(card)
					return true end }))
				G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function()
					local card = create_card('Joker', G.hand, false, nil, nil, nil, nil, 'jud')
					card:add_to_deck()
					card.base.value = pseudorandom_element({'Ace', 'King', 'Jack', 'Queen', '2', '3', '4', '5', '6', '7', '8', '9', '10'}, pseudoseed('joker_create'))
					if card.base.value == 'Jack' then card.base.nominal = 10; card.base.face_nominal = 0.1; card.base.id = 11
    elseif card.base.value == 'Queen' then card.base.nominal = 10; card.base.face_nominal = 0.2; card.base.id = 12
    elseif card.base.value == 'King' then card.base.nominal = 10; card.base.face_nominal = 0.3; card.base.id = 13
					elseif card.base.value == '8' then card.base.nominal = 8; card.base.id = 8
					elseif card.base.value == '2' then card.base.nominal = 2; card.base.id = 2
					elseif card.base.value == '3' then card.base.nominal = 3; card.base.id = 3
					elseif card.base.value == '4' then card.base.nominal = 4; card.base.id = 4
					elseif card.base.value == '5' then card.base.nominal = 5; card.base.id = 5
					elseif card.base.value == '6' then card.base.nominal = 6; card.base.id = 6
					elseif card.base.value == '7' then card.base.nominal = 7; card.base.id = 7
					elseif card.base.value == '9' then card.base.nominal = 9; card.base.id = 9
					elseif card.base.value == 'Ace' then card.base.nominal = 11; card.base.face_nominal = 0.4; card.base.id = 14
					elseif card.base.value == '10' then card.base.nominal = 10; card.base.id = 10 end
					card.base.suit = pseudorandom_element({'Diamonds', 'Clubs', 'Hearts', 'Spades'}, pseudoseed('joker_create'))
					if card.base.suit == 'Diamonds' then card.base.suit_nominal = 0.01; card.base.suit_nominal_original = 0.001 
						elseif card.base.suit == 'Clubs' then card.base.suit_nominal = 0.02; card.base.suit_nominal_original = 0.002 
						elseif card.base.suit == 'Hearts' then card.base.suit_nominal = 0.03; card.base.suit_nominal_original = 0.003 
						elseif card.base.suit == 'Spades' then card.base.suit_nominal = 0.04; card.base.suit_nominal_original = 0.004 end 
					card:set_ability(G.P_CENTERS[pseudorandom_element({'m_stone', 'm_gold', 'm_steel'}, pseudoseed('joker_create'))])
					G.hand:emplace(card)
					return true end }))
					
					ease_dollars(pseudorandom('bebebeb', -22, -18))

                    return {
						message = localize('k_saved_ex'),
                        saved = true,
                        colour = G.C.RED
                    }
                end
					
                        if self.ability.name == 'Mr. Bones' and
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					
					------------------------------------------
					--Incredibly scuffed
					sendDebugMessage("Tavros")
					
					tempfunk2 = G.FUNCS.get_poker_hand_info
					
					G.FUNCS.get_poker_hand_info = function(_cards)
						if G.GAME.pool_flags.loctavros then
							G.GAME.pool_flags.loctavros = false
							return "High Card", "Page of Breath", evaluate_poker_hand(_cards), G.play.cards, "High Card"
						end
						
						return tempfunk2(_cards)
					end
					
					
					local tempfunk = G.FUNCS.evaluate_play
					
					G.FUNCS.evaluate_play = function(e)
						if #G.play.cards == 1 and next(find_joker('Tavros')) then
							G.play.cards, G.hand.cards = G.hand.cards, G.play.cards
							G.GAME.pool_flags.tavros = true
							G.GAME.pool_flags.loctavros = true
						end
						
						tempfunk()
						
						if G.GAME.pool_flags.tavros then
							G.play.cards, G.hand.cards = G.hand.cards, G.play.cards
							--G.FUNCS.draw_from_play_to_hand()
							--G.FUNCS.draw_from_hand_to_discard()
							G.GAME.pool_flags.tavros = false
						end
					end
					
					------------------------------------------------
					sendDebugMessage("Sollux")
					local toReplaceLogic = "if self.ability.name == 'Runner' then"
					
					local replacementLogic = [[
						if self.ability.name == 'Sollux' then
						local pairs = 0
							local count = 0
							for i1, v1 in ipairs(G.hand.cards) do 
								for i2, v2 in ipairs(G.hand.cards) do
									if (i2 > i1) and (v1:get_id() == v2:get_id()) then
										pairs = pairs + 1
									end
								end
							end
						
						local temp_hand = {}
            for k, v in ipairs(G.hand.cards) do temp_hand[#temp_hand+1] = v end
            table.sort(temp_hand, function (a, b) return not a.playing_card or not b.playing_card or a.playing_card < b.playing_card end)
            pseudoshuffle(temp_hand, pseudoseed('immolate'))
			
					
						for i=1, pairs do
						if i > #G.hand.cards then
							break
						end
						if pseudorandom('bloodstone') < G.GAME.probabilities.normal/self.ability.extra.odds then
						G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0, func = function()
            play_sound('tarot1')
            self:juice_up(0.3, 0.5)
            return true end }))
			local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0,func = function() temp_hand[i]:flip();play_sound('card1', percent);temp_hand[i]:juice_up(0.3, 0.3);return true end }))
						G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0,func = function() temp_hand[i]:set_ability(G.P_CENTERS['m_glass']);return true end }))
						local percent = 0.85 + (i-0.999)/(#temp_hand-0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function() temp_hand[i]:flip();play_sound('tarot2', percent, 0.6);temp_hand[i]:juice_up(0.3, 0.3);return true end }))
						end 		
						end
					
					end
			
						if self.ability.name == 'Runner' then
					]]
				
					inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					
					---------------------------------------------  
					sendDebugMessage("Nepeta logic")
                    
                    local toReplaceLogic = "if self.ability.name == 'Runner' then"

                    local replacementLogic = [[
                        if self.ability.name == 'Nepeta' then
							local pairs = 0
							local count = 0
							for i1, v1 in ipairs(context.full_hand) do
								for i2, v2 in ipairs(context.full_hand) do
									if (i2 > i1) and (v1:get_id() == v2:get_id()) then
										pairs = pairs + 1
									end
								end
							end
							self.ability.extra.chips = pairs * 25
							
							if pairs > 0 then
                            return {
                                message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                                chip_mod = self.ability.extra.chips, 
                                colour = G.C.CHIPS
                            }
							end
                        end
						

                        if self.ability.name == 'Runner' then
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					
					sendDebugMessage("Kanaya discard bonus")
					local toReplaceLogic = "if self.ability.name == 'Seance'"

                    local replacementLogic = [[
						if self.ability.name == 'Kanaya' then
							if next(context.poker_hands[self.ability.extra.poker_hand]) then
							
							if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
								G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'before',
                                    delay = 0.0,
                                    func = (function()
                                            local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                                            card:add_to_deck()
                                            G.consumeables:emplace(card)
                                            G.GAME.consumeable_buffer = 0
                                        return true
                                    end)}))
									if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
								G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                                G.E_MANAGER:add_event(Event({
                                    trigger = 'before',
                                    delay = 0.0,
                                    func = (function()
                                            local card = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'sea')
                                            card:add_to_deck()
                                            G.consumeables:emplace(card)
                                            G.GAME.consumeable_buffer = 0
                                        return true
                                    end)}))
									end
                                return {
                                    message = localize('k_plus_planet'),
                                    colour = G.C.SECONDARY_SET.Planet,
                                    card = self
                                }
								end
							end
							
						end
					
                        if self.ability.name == 'Seance'
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					------------------------------------------
					sendDebugMessage("Terezi add to deck")
					local toReplaceLogic = "if self.ability.name == 'Oops! All 6s' then"

                    local replacementLogic = [[
                        if self.ability.name == 'Terezi' then
							math.randomseed(os.time())
							local change = (math.random(0,1) - 0.5) * 826
								
							for k, v in pairs(G.GAME.probabilities) do 
								self.ability.extra.changes[k] = change
								G.GAME.probabilities[k] = v * change
							end
						end
						if self.ability.name == 'Oops! All 6s' then
                    ]]
                    
                    inject("card.lua", "Card:add_to_deck", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Terezi remove deck")
					local toReplaceLogic = "if self.ability.name == 'Oops! All 6s' then"

                    local replacementLogic = [[
                        if self.ability.name == 'Terezi' then
							for k, v in pairs(G.GAME.probabilities) do 
								G.GAME.probabilities[k] = math.abs(v / self.ability.extra.changes[k])
							end
						end
						if self.ability.name == 'Oops! All 6s' then
                    ]]
                    
                    inject("card.lua", "Card:remove_from_deck", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Terezi played hand")
					local toReplaceLogic = "if self.ability.name == 'Ice Cream' and not context.blueprint then"

                    local replacementLogic = [[
						if self.ability.name == 'Terezi' then
							for k, v in pairs(G.GAME.probabilities) do 
								math.randomseed(os.time())
								local change = (math.random(0,1) - 0.5) * 2
								G.GAME.probabilities[k] = v * change
							end
						end
					
                        if self.ability.name == 'Ice Cream' and not context.blueprint then
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					sendDebugMessage("Equius remove deck")
					local toReplaceLogic = "elseif context.selling_self then"

                    local replacementLogic = [[
						elseif context.selling_self then
						
                        if self.ability.name == 'Equius' and self.ability.extra.d == "(Has free will)" then
							
								local dummy = copy_card(self)
							dummy:set_sprites({set = "Joker", atlas = "equius2"}, nil)
							dummy.ability.extra.a = "Upgrades next hand"
							dummy.ability.extra.b = "played by 3 levels"
							dummy.ability.extra.c = "and is destroyed"
							dummy.ability.extra.d = "(Has no free will)"
							dummy:add_to_deck()
								G.jokers:emplace(dummy)
								G.jokers.config.card_limit = G.jokers.config.card_limit + 1
							
						end
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Equius2 remove from deck")
					local toReplaceLogic = "if self.ability.name == 'Oops! All 6s' then"

                    local replacementLogic = [[
                        if self.ability.name == 'Equius' and self.ability.extra.d == "(Has no free will)" then
							G.jokers.config.card_limit = G.jokers.config.card_limit - 1
						end
						if self.ability.name == 'Oops! All 6s' then
                    ]]
                    
                    inject("card.lua", "Card:remove_from_deck", toReplaceLogic, replacementLogic)

					sendDebugMessage("Equius2 upgrade hand")
					local toReplaceLogic = "if context.before then"

                    local replacementLogic = [[
						if context.before then
						
                        if self.ability.name == 'Equius' and self.ability.extra.d == "(Has no free will)" then
							
							local text,disp_text = G.FUNCS.get_poker_hand_info(context.full_hand)
							card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
							update_hand_text({sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3}, {handname=localize(text, 'poker_hands'),chips = G.GAME.hands[text].chips, mult = G.GAME.hands[text].mult, level=G.GAME.hands[text].level})
							level_up_hand(self, text, nil, 3)
							update_hand_text({sound = 'button', volume = 0.7, pitch = 1.1, delay = 0}, {mult = 0, chips = 0, handname = '', level = ''})
							
							self.ability.eternal = false
							self.T.h = 0
							self.T.w = 0
							self:remove()
							G.jokers:remove_card(self)
							
							
							
						
						end
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					
					sendDebugMessage("Equius1 other trolls bonuses")
					local toReplaceLogic = "elseif context.other_joker then"

                    local replacementLogic = [[
						elseif context.other_joker then
						
                        if self.ability.name == 'Equius' and self.ability.extra.d == "(Has free will)" and self ~= context.other_joker then
							local xmult = 0
							local out_message = ''
							
							if context.other_joker.ability.name == 'Nepeta' then xmult = 2 out_message = 'Moirail!'
							elseif context.other_joker.ability.name == 'Vriska' then xmult = 1.5 out_message = 'Partner'
							elseif context.other_joker.ability.name == 'Sollux' or context.other_joker.ability.name == 'Eridan' then xmult = 1.25 out_message = 'Pest'
							elseif context.other_joker.ability.name == 'Aradia' or context.other_joker.ability.name == 'Aradiabot' then xmult = 2 out_message = '??????'
							end
							
							if xmult > 0 then
							G.E_MANAGER:add_event(Event({
								delay = 0.2,
								func = function()
								context.other_joker:juice_up(0.5, 0.5)
								
								return true
							end
							}))
							
							return {
								message = out_message,
								Xmult_mod = xmult,
								card = context.other_joker
							}
							end
						end
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					
					------------------------------------------
					sendDebugMessage("Gamzee set ability")
					local toReplaceLogic = "if self.ability.name == 'Caino' then"

                    local replacementLogic = [[
						if self.ability.name == 'Gamzee' then 
							self.ability.x_mult = 1
						end
					
                        if self.ability.name == 'Caino' then 
                    ]]
                    
                    inject("card.lua", "Card:set_ability", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Gamzee destroy bonus")
					local toReplaceLogic = "elseif context.cards_destroyed then"

                    local replacementLogic = [[
					elseif context.cards_destroyed then
						if self.ability.name == 'Gamzee' and not context.blueprint then
							if true then
								G.E_MANAGER:add_event(Event({
									func = function()
								G.E_MANAGER:add_event(Event({
									func = function()
										self.ability.x_mult = self.ability.x_mult + self.ability.extra
									return true
								end
								}))
								card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.x_mult + self.ability.extra}}})
								return true
							end
						}))
							end

							return
						end
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Gamzee destroy bonus 2???")
					local toReplaceLogic = "elseif context.remove_playing_cards then"

                    local replacementLogic = [[
					elseif context.remove_playing_cards then
						if self.ability.name == 'Gamzee' and not context.blueprint then
							local face_cards = 0
							for k, val in ipairs(context.removed) do
								face_cards = face_cards + 1
							end
							if face_cards > 0 then
								self.ability.x_mult = self.ability.x_mult + face_cards*self.ability.extra
								G.E_MANAGER:add_event(Event({
								func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.x_mult}}}); return true
								end}))
							end
							return
						end
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Gamzee destroy cards of hand")
					local toReplaceLogic = "if self.ability.name == 'Ice Cream' and not context.blueprint then"

                    local replacementLogic = [[
						if self.ability.name == 'Gamzee' and not context.blueprint then
							G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function() 
                    
						for k, v in ipairs(context.full_hand) do
                        if v.ability.name == 'Glass Card' then 
                            v:shatter()
                        else
                            v:start_dissolve(nil, 0 == #context.full_hand)
                        end
						
						self.ability.x_mult = self.ability.x_mult + self.ability.extra
								G.E_MANAGER:add_event(Event({
								func = function() card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize{type = 'variable', key = 'a_xmult', vars = {self.ability.extra}}}); return true
								end}))
						end
                    return true end }))
					
					if self.ability.x_mult > 3 then
						context.full_hand[1].ability.ghost = true
						G.hand:emplace(context.full_hand[1])
					end
					
						end
					
                        if self.ability.name == 'Ice Cream' and not context.blueprint then
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					sendDebugMessage("Eridan discard bonus")
					local toReplaceLogic = "if self.ability.name == 'Faceless Joker'"

                    local replacementLogic = [[
						if self.ability.name == 'Eridan' and context.other_card == context.full_hand[#context.full_hand] and not self.ability.extra.delete then
							local face_cards = 0
							
							for k, v in ipairs(context.full_hand) do
								if v:is_face() then face_cards = face_cards + 1 end
							end
							if face_cards >= self.ability.extra.faces then
							
						local ptj = pseudorandom('wwoe is me', 1, 5)
						if self.ability.perma_debuff then self.ability.already_debuffed = true end
						if self.ability.eternal then self.ability.already_eternal = true end
						self.debuff = true
						self.ability.perma_debuff = true
						self.ability.eternal = true
                        if context.full_hand[ptj].ability.name == 'Glass Card' then 
                            context.full_hand[ptj]:shatter()
                        else
                            context.full_hand[ptj]:start_dissolve(nil, 0 == #context.full_hand)
                        end
						self.ability.extra.delete = context.full_hand[ptj]
								if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
									G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
									G.E_MANAGER:add_event(Event({
										trigger = 'before',
										delay = 0.0,
										func = (function()
												local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'sixth')
												card:add_to_deck()
												G.consumeables:emplace(card)
												G.GAME.consumeable_buffer = 0
												return true
										end)}))
									card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
								end
								delay(0.3)
        
							end
						end
					
                        if self.ability.name == 'Faceless Joker'
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					sendDebugMessage("Eridan delete the delete card permanently at end of round")
					local toReplaceLogic = "if self.ability.name == 'Marble Joker' and not"

                    local replacementLogic = [[
						if self.ability.name == 'Eridan' and not context.blueprint then
							if self.ability.extra.delete then
								G.deck:remove_card(self.ability.extra.delete)
								
								self.ability.extra.delete = nil
							
								if not self.ability.already_eternal then self.ability.eternal = false end
								if not self.ability.already_debuffed then 
									self.ability.perma_debuff = false
									self.debuff = false 
								end
							end
						end
					
                        if self.ability.name == 'Marble Joker' and not
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					
					sendDebugMessage("Feferi 2")
					local toReplaceLogic = 'if self.ability.name == "Stone Joker" then '

                    local replacementLogic = [[
                        if self.ability.name == "Feferi" then
							self.ability.extra.x_chips = G.GAME.dollars
						end
						
						if self.ability.name == "Stone Joker" then 
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					
					sendDebugMessage("Feferi")
					local toReplaceLogic = "if self.ability.name == 'Arrowhead' and"

                    local replacementLogic = [[
                        if self.ability.name == 'Feferi' and context.other_card:is_suit('Diamonds') and (context.other_card:is_face()) then
						
							
						if context.other_card.debuff then
                            return {
                                message = localize('k_debuffed'),
                                colour = G.C.RED,
                                card = self
                            }
                        else
                            G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                            return {
                                dollars = math.floor((G.GAME.dollars * (self.ability.extra.x_muns - 1)) * 100) / 100,
								chips = hand_chips * (self.ability.extra.x_chips - 1),
                                card = self
                            }
                        end
					end
						
						if self.ability.name == 'Arrowhead' and
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					sendDebugMessage("Vriska multiplier")
					local toReplaceLogic = "if self.ability.name ==  'Bloodstone' and"

                    local replacementLogic = [[
						if self.ability.name == 'Vriska' then
							if context.other_card:is_suit("Spades") and context.other_card:get_id() == 8 then
								return {
									x_mult = self.ability.extra.Xmult,
									card = self
								}
							else
								return {
									message = "-1 Mult",
									mult = -1,
									card = self
								}
							end
						end
					
                        if self.ability.name ==  'Bloodstone' and
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					------------------------------------------
					sendDebugMessage("Aradiabot played hand")
					local toReplaceLogic = "if self.ability.name == 'Ice Cream' and not context.blueprint then"

                    local replacementLogic = [[
						if self.ability.name == 'Aradiabot' and G.GAME.current_round.hands_left > 0 then
							ease_discard(self.ability.extra.sel_size)
						end
					
                        if self.ability.name == 'Ice Cream' and not context.blueprint then
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
					sendDebugMessage("Aradiabot add to deck")
					local toReplaceLogic = "if self.ability.name == 'Troubadour' then"

                    local replacementLogic = [[
                        if self.ability.name == 'Aradiabot' then
							G.hand:change_size(self.ability.extra.h_size)
							G.GAME.round_resets.discards = G.GAME.round_resets.discards + self.ability.extra.d_size
							G.GAME.round_resets.hands = G.GAME.round_resets.hands + self.ability.extra.h_plays
							ease_discard(self.ability.extra.d_size)
							ease_hands_played(self.ability.extra.h_plays)
						end
						if self.ability.name == 'Troubadour' then
                    ]]
                    
                    inject("card.lua", "Card:add_to_deck", toReplaceLogic, replacementLogic)
					
					
					sendDebugMessage("Aradiabot remove deck")
					local toReplaceLogic = "if self.ability.name == 'Troubadour' then"

                    local replacementLogic = [[
                        if self.ability.name == 'Aradiabot' then
							G.hand:change_size(-self.ability.extra.h_size)
							G.GAME.round_resets.discards = G.GAME.round_resets.discards - self.ability.extra.d_size
							G.GAME.round_resets.hands = G.GAME.round_resets.hands - self.ability.extra.h_plays
							ease_discard(-self.ability.extra.d_size)
							ease_hands_played(-self.ability.extra.h_plays)
						end
						if self.ability.name == 'Troubadour' then
                    ]]
                    
                    inject("card.lua", "Card:remove_from_deck", toReplaceLogic, replacementLogic)
					------------------------------------------
					sendDebugMessage("Callie hand +mult card")
					local toReplaceLogic = "if self.ability.name == 'Midas Mask' and not context.blueprint then"

                    local replacementLogic = [[
					if self.ability.name == 'Callie' then
						self.ability.extra.mult = 0
						
						if pseudorandom('calliope') < G.GAME.probabilities.normal/self.ability.extra.all then 
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                play_sound('tarot1')
                                self.T.r = -0.2
                                self:juice_up(0.3, 0.4)
                                self.states.drag.is = true
                                self.children.center.pinch.x = true
                                G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                                    func = function()
                                            G.jokers:remove_card(self)
                                            self:remove()
                                            self = nil
                                        return true; end})) 
                                return true
                            end
                        })) 
                        
                        return {
                            message = localize('k_extinct_ex')
                        }
                    else
                        
							
                        for k, v in ipairs(context.full_hand) do
							local addmult = false
							
							--add mult if card is played but not scored i.e. debuffed or not scored in hand
							if v.debuff then
								addmult = true
							else
								addmult = true
								for k2, v2 in ipairs(context.scoring_hand) do
									if v == v2 then
										addmult = false
										break
									end
								end
							end
							
							--actually add the mult and have the chance to add the seal
							if addmult then
								self.ability.extra.mult = self.ability.extra.mult + self.ability.extra.all
								
								G.E_MANAGER:add_event(Event({func = function()
										play_sound('timpani')
										v:juice_up(0.3, 0.5)
										return true end }))
										
								delay(0.5)
								
								if pseudorandom('calliope') < G.GAME.probabilities.normal/self.ability.extra.all then
									local conv_card = v
									G.E_MANAGER:add_event(Event({func = function()
										play_sound('tarot1')
										self:juice_up(0.3, 0.5)
										return true end }))
        
									G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
										conv_card:set_seal(pseudorandom_element({'Blue', 'Purple'}, pseudoseed('spheal')), nil, true)
										return true end }))
										
									G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function() G.hand:unhighlight_all(); return true end }))
								end
							end
                        end
						
						return {
                            message = localize('k_safe_ex')
                        }
                    end
					end
					
                        if self.ability.name == 'Midas Mask' and not context.blueprint then
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					------------------------------------------
					sendDebugMessage("Callie mult adding")
					local toReplaceLogic = "if self.ability.name == 'Spare Trousers' and self.ability.mult > 0 then"

                    local replacementLogic = [[
						if self.ability.name == 'Callie' and self.ability.extra.mult > 0 then
							self.ability.extra.all = self.ability.extra.all - 1
						
							return {
                                message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                                mult_mod = self.ability.extra.mult
                            }
						end
						
						if self.ability.name == 'Spare Trousers' and self.ability.mult > 0 then
                    ]]
                    
                    inject("card.lua", "Card:calculate_joker", toReplaceLogic, replacementLogic)
					
                    ------------------------------------------
					
                    ------------------------------------------
					
                    sendDebugMessage("Texture")

                    local toReplaceAtlas = "{name = 'chips', path = \"resources/textures/\"..self.SETTINGS.GRAPHICS.texture_scaling..\"x/chips.png\",px=29,py=29}"

                    local replacementAtlas = [[
                        {name = 'chips', path = "resources/textures/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/chips.png",px=29,py=29},
		                {name = 'karkat', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_karkat.png",px=71,py=95},
		                {name = 'tavros', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_tavros.png",px=71,py=95},
		                {name = 'sollux', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_sollux.png",px=71,py=95},
		                {name = 'nepeta', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_nepeta.png",px=71,py=95},
		                {name = 'kanaya', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_kanaya.png",px=71,py=95},
		                {name = 'terezi', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_terezi.png",px=71,py=95},
		                {name = 'vriska', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_vriska.png",px=71,py=95},
		                {name = 'aradiabot', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_aradiabot.png",px=71,py=95},
		                {name = 'equius', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_equius.png",px=71,py=95},
						{name = 'equius2', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_equius2.png",px=71,py=95},
		                {name = 'fantrolls', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_fantrolls.png",px=71,py=95},
		                {name = 'gamzee', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_gamzee.png",px=71,py=95},
		                {name = 'eridan', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_eridan.png",px=71,py=95},
		                {name = 'feferi', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_feferi.png",px=71,py=95},
		                {name = 'aradia', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_aradia.png",px=71,py=95},
		                {name = 'callie', path = "pack/"..self.SETTINGS.GRAPHICS.texture_scaling.."x/troll_callie.png",px=71,py=95}
                    ]]

                    inject("game.lua", "Game:set_render_settings", toReplaceAtlas, replacementAtlas)


                    G:set_render_settings()

                    -------------------------------------------------------
                    sendDebugMessage("Sprite")

                    local toReplaceTexLoad = "elseif self.config.center.set == 'Voucher' and not self.config.center.unlocked and not self.params.bypass_discovery_center then"

                    local replacementTexLoad = [[
                        elseif _center.name == 'Fantrolls' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["fantrolls"], Fantrolls)
						elseif _center.name == 'Karkat' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["karkat"], karkat)
						elseif _center.name == 'Tavros' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["tavros"], tavros)
						elseif _center.name == 'Sollux' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["sollux"], sollux)
						elseif _center.name == 'Nepeta' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["nepeta"], nepeta)
						elseif _center.name == 'Kanaya' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["kanaya"], kanaya)
						elseif _center.name == 'Terezi' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["terezi"], terezi)
						elseif _center.name == 'Vriska' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["vriska"], vriska)
						elseif _center.name == 'Aradiabot' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["aradiabot"], aradiabot)
						elseif _center.name == 'Equius' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["equius"], equius)
						elseif _center.name == 'Gamzee' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["gamzee"], gamzee)
						elseif _center.name == 'Eridan' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["eridan"], eridan)
						elseif _center.name == 'Feferi' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["feferi"], feferi)
						elseif _center.name == 'Aradia' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["aradia"], aradia)
						elseif _center.name == 'Callie' then
                            self.children.center = Sprite(self.T.x, self.T.y, self.T.w, self.T.h, G.ASSET_ATLAS["callie"], callie)
                        elseif self.config.center.set == 'Voucher' and not self.config.center.unlocked and not self.params.bypass_discovery_center then
                    ]]

                    inject("card.lua", "Card:set_sprites", toReplaceTexLoad:gsub("([^%w])", "%%%1"), replacementTexLoad)

                    -------------------------------------------------------
					

                    patched = true

                    sendDebugMessage("Patched Troll Pack: Karkat")
                end
            end,
        }
)
