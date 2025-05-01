if not P1 or not P2 then
	backToSongWheel('Two Player Mode Required')
	return
end

local scx = SCREEN_CENTER_X
local scy = SCREEN_CENTER_Y

-- judgment / combo proxies
for pn = 1, 2 do
	setupJudgeProxy(PJ[pn], P[pn]:GetChild('Judgment'), pn)
	setupJudgeProxy(PC[pn], P[pn]:GetChild('Combo'), pn)
end
-- player proxies
for pn = 1, #PP do
	PP[pn]:SetTarget(P[pn])
	P[pn]:hidden(0)
end


--teeth hi
definemod {'teethhix', function(b)
    teethhi:x(b)
end}
definemod {'teethhiy', function(b)
    teethhi:y(b)
end}
definemod {'teethhialpha', function(b)
    teethhi:diffusealpha(b)
end}
--- proxies
definemod {'teethhiproxyx', function(b)
    teethhiproxy:x(b)
end}
definemod {'teethhiproxyy', function(b)
    teethhiproxy:x(b)
end}
definemod {'teethhiproxyalpha', function(b)
    teethhiproxy:diffusealpha(b)
end}


setdefault{
    scx-320, 'teethhix',
	1, 'teethhiproxyalpha',
}





-- If the user is using a Nvidia graphic card, they have some issues with alphas of sprites.
if tonumber(GAMESTATE:GetVersionDate()) >= 20170405 and string.find(string.lower(DISPLAY:GetVendor()), 'nvidia')
or string.find(string.lower(PREFSMAN:GetPreference('LastSeenVideoDriver')), 'nvidia') then
	aftMult = 0.9 -- Setting the alpha multiplier to 0.9.
end

-- your code goes here here:




sprite(glitchsmear)
aft(screnaft)
glitchsmear:SetTexture(screnaft:GetTexture())

sprite(glitchlines)
aft(screnaft2)
glitchlines:SetTexture(screnaft2:GetTexture())

---sprite(teethtop)
--aft(screnaftteeth)
--teethtop:SetTexture(screnaftteeth:GetTexture())

--definemod {'teethtopmod', function(p)
---	teethtop:diffusealpha(p*aftMult)
--	end}

definemod {'touchfuzzygetdizzy', function(p)
	glitchsmear:diffusealpha(p*aftMult)
	end}

definemod {'fuzzylines', function(p)
	glitchlines:diffusealpha(p*aftMult)
	end}

----- FUNCTIONS   ----
function third_slams (beat)
	ease {beat, 0.1, outSine, 300, 'spiralz'}
	ease {(beat+0.1), 1.4, outSine, 15, 'spiralz'}
	ease {(beat+1), 0.1, outSine, 200, 'spiralx'}
	ease {(beat+1.1), 1.4, outSine, 0, 'spiralx'}
	ease {(beat+2), 0.1, outSine, 300, 'spiralz'}
	ease {(beat+2.1), 1.4, outSine, 15, 'spiralz'}
	ease {beat, 0.1, outSine, 500, 'bouncez'}
	ease {(beat+0.1), 1.4, outSine, 0, 'bouncez'}
	ease {(beat+1), 0.1, outSine, -500, 'bouncez'}
	ease {(beat+1.1), 1.4, outSine, 0, 'bouncez'}
	ease {(beat+2), 0.1, outSine, 500, 'bouncez'}
	ease {(beat+2.1), 1.4, outSine, 0, 'bouncez'}
end

function impact_effects(beat,strength,effect)
	ease {(beat), 0.1, inOutQuint, strength, effect}
	ease {(beat+0.1), 0.1, inOutQuint, 0, effect}
	ease {(beat+0.25), 0.1, inOutQuint, strength, effect}
	ease {(beat+0.35), 0.1, inOutQuint, 0, effect}
	ease {(beat+0.50), 0.1, inOutQuint, strength, effect}
	ease {(beat+0.60), 0.1, inOutQuint, 0, effect}
	ease {(beat+0.75), 0.1, inOutQuint, strength, effect}
	ease {(beat+0.85), 0.1, inOutQuint, 0, effect}
end

function triplet_sides (beat,strength,effect)
	set {beat, 400, 'dizzy'}
	ease {(beat), 0.33, inOutCubic, strength, effect}
	ease {(beat+0.33), 0.33, inOutCubic, 0, effect}

	ease {(beat+0.33), 0.33, inOutCubic, strength, effect}
	ease {(beat+0.66), 0.33, inOutCubic, 10, effect}

	ease {(beat+0.66), 0.33, inOutCubic, strength, effect}
	ease {(beat+1), 0.33, inOutCubic, 0, effect}

	set {(beat+1), 0, 'dizzy'}
end

function triplet_sides_num(beat,strength,effect,num)
	for i=0,num,1
	do
		triplet_sides((beat),strength,effect)
		triplet_sides((beat+1),strength,effect)
		triplet_sides((beat+2),strength,effect)
	end
end

function big_single_slam (beat)
	ease {beat, 0.5, outSine, 100, 'spiralx'}
	ease {beat, 0.5, outSine, 100, 'spiraly'}
	ease {beat, 0.5, outSine, 1000, 'tipsy'}
	
	ease {(beat+0.5), 0.5, outSine, 0, 'spiralx'}
	ease {(beat+0.5), 0.5, outSine, 0, 'spiraly'}
	ease {(beat+0.5), 0.5, outSine, 0, 'tipsy'}
	end
	
function thirty_seconds_worble(beat)
	ease {beat, 0.5, inOutCubic, 50, 'spiralx'}
	ease {beat, 0.5, inOutCubic, 100, 'dizzy'}
	ease {(beat+0.5), 0.5, inOutCubic, 0, 'spiralx'}
	ease {(beat+0.5), 0.5, inOutCubic, 0, 'dizzy'}
end
-----------------------------------

---Begin---
setdefault {2, 'xmod', 400, 'overhead', 100, 'dizzyholds', 100, 'modtimer'}
bg:xywh(scx, scy, sw, sh)

set {0, 100, 'invert'}
set {0, 100, 'invert'}

ease {0.75, 0.75, inOutQuint, 100, 'invert'}
ease {0.75, 0.75, inOutQuint, 100, 'flip'}

ease {1.50, 1.75, outSine, 0, 'invert'}
ease {1.50, 1.75, outSine, 0, 'flip'}
-- on beat 0, for 12 beats, use the `outExpo` animation to set 100% invert

ease {6, 8, outQuad, 5, 'touchfuzzygetdizzy'}
ease {6, 24, outSine, 100, 'drunk'}
ease {6, 24, outSine, 100, 'tornado'}
ease {16, 10, outSine, 25, 'spiralz'}
ease {16, 1, outQuad, 10, 'touchfuzzygetdizzy'}


--Glitchy Attacks--
ease {31.467, 0.08, outSine, 200, 'spiralz'}
ease {31.567, 0.08, outSine, 25, 'spiralz'}

ease {31.8, 0.15, outSine, 200, 'spiralz'}
ease {31.95, 0.08, outSine, 25, 'spiralz'}

ease {32.467, 0.08, outSine, 200, 'spiralz'}
ease {32.567, 0.08, outSine, 25, 'spiralz'}

ease {32.8, 0.08, outSine, 200, 'spiralz'}
ease {32.9, 0.08, outSine, 25, 'spiralz'}

ease {33.133, 0.08, outSine, 200, 'spiralz'}
ease {33.233, 0.08, outSine, 25, 'spiralz'}

ease {33.467, 0.15, outSine, 200, 'spiralz'}
ease {33.617, 0.08, outSine, 25, 'spiralz'}

ease {34.133, 0.08, outSine, 200, 'spiralz'}
ease {34.233, 0.08, outSine, 25, 'spiralz'}	

ease {34.633, 0.08, outSine, 200, 'spiralz'}
ease {34.733, 0.08, outSine, 25, 'spiralz'}

------------------
ease {60, 2, outCirc, 50, 'tornado'}
ease {71, 1, outQuad, 0, 'touchfuzzygetdizzy'}

--First Breakdown
ease {71, 1, outCirc, 0, 'tornado'}
ease {71, 1, outSine, 0, 'drunk'}

third_slams(72)

ease {75, 0.5, outSine, 50, 'pulse'}
ease {75, 0.5, outSine, 100, 'tanbumpy'}

ease {75.5, 1, outSine, 0, 'pulse'}
ease {75.5, 1, outSine, 0, 'tanbumpy'}

third_slams(76)

ease {79, 0.5, outSine, 10000, 'confusion'}
ease {79, 0.5, outSine, 10000, 'zoomx'}

ease {79.5, 0.5, outSine, 0, 'confusion'}
ease {79.5, 0.5, outCirc, 100, 'zoomx'}

third_slams(81)

ease {83, 0.5, outCirc, 100, 'invert'}
ease {83, 0.5, outCirc, 100, 'confusion'}

ease {83.5, 0.5, outCirc, 0, 'invert'}
ease {83.5, 0.5, outCirc, 0, 'confusion'}

third_slams(84)

ease {87, 0.25, outCirc, 100, 'tanbumpy'}
ease {87.333, 0.177, outCirc, 0, 'tanbumpy'}
ease {87.333, 0.177, outCirc, 200, 'zoomx'}
ease {87.333, 0.177, outCirc, 200, 'zoomy'}	
ease {87.333, 0.177, outCirc, 1000, 'noteskewy'}
ease {87.333, 0.177, outCirc, 200, 'noteskewy'}

ease {87.833, 0.177, linear, 0, 'noteskewy'}
ease {87.833, 0.177, outCirc, 100, 'zoomx'}
ease {87.833, 0.177, outCirc, 100, 'zoomy'}
ease {87.833, 0.177, outCirc, 100, 'beat'}

third_slams(88)	

impact_effects(91,1000,'digitalz')

third_slams(92)

ease {95, 0.33, linear, 200, 'noteskewx'}
ease {95, 0.33, linear, 200, 'noteskewy'}
ease {95, 0.33, linear, 1000, 'bounce'}
ease {95, 0.33, inOutCubic, 100, 'stealth'}

set {95.33, -200, 'noteskewx'}
set {95.33, -200, 'noteskewy'}
set {95.33, 0, 'bounce'}
ease {95.33, 0.33, inOutCubic, 0, 'noteskewx'}
ease {95.33, 0.33, inOutCubic, 0, 'noteskewy'}
ease {95.33, 0.33, inOutCubic, 0, 'stealth'}

third_slams(96)

ease {99, 0.5, inOutCubic, 1000, 'drunkz'}
ease {99.5, 0.5, inOutCubic, 0, 'drunkz'}

third_slams(100)

---impact_effects(148.5,500,'digitalz')

third_slams(150)
ease {104, 0.25, outCirc, 0, 'beat'}


--First Breakdown Pt2--
big_single_slam (104)


ease {156, 0.75	, inOutCubic, 1000, 'flip'}
ease {156.75, 0.75, inOutCubic, 0, 'flip'}


triplet_sides_num(105,100,'sawtooth',3)


triplet_sides_num(109,100,'sawtooth',3)

triplet_sides_num(113,100,'sawtooth2',3)

for i=116,118,1
do
	beat = i
	ease {beat, 0.10, inOutCubic, 200, 'pulse'}
	ease {(beat+0.10), 0.90, inOutCubic, 0, 'pulse'}
end

ease {119, 0.05, inOutCubic, 100, 'stealth'}
ease {119, 0.05, inOutCubic, 1000, 'ultraman'}
ease {119.05, 0.95, inOutCubic, 0, 'stealth'}	
ease {119.05, 0.95, inOutCubic, 0, 'ultraman'}

big_single_slam (120)

triplet_sides_num(121,100,'sawtooth',3)

thirty_seconds_worble(124)

triplet_sides_num(125,100,'sawtooth',3)

triplet_sides_num(129,100,'sawtooth2',3)


ease {128, .1, outQuad, 100, 'movex'}
ease {129, .1, outQuad, 0, 'movex'}

ease {128, 0.05, inOutCubic, 100, 'pulse'}
ease {(128+0.05), 0.05, inOutCubic, 0, 'pulse'}
ease {128.162, 0.05, inOutCubic, 100, 'pulse'}
ease {(128.162+0.05), 0.05, inOutCubic, 0, 'pulse'}
ease {128.333, 0.05, inOutCubic, 100, 'pulse'}
ease {(128.333+0.05), 0.05, inOutCubic, 0, 'pulse'}
ease {128.5, 0.05, inOutCubic, 100, 'pulse'}
ease {(128.5+0.05), 0.05, inOutCubic, 0, 'pulse'}
ease {128.667, 0.05, inOutCubic, 100, 'pulse'}
ease {(128.667+0.05), 0.05, inOutCubic, 0, 'pulse'}
ease {128.833, 0.05, inOutCubic, 100, 'pulse'}
ease {(128.833+0.05), 0.05, inOutCubic, 0, 'pulse'}

for i=132,136,1
do
	beat = i
	ease {beat, 0.10, inOutCubic, 200, 'pulse'}
	ease {(beat+0.10), 0.90, inOutCubic, 0, 'pulse'}
end
ease {136, 6, outQuad, -10000, 'dizzy'}
--ease {136, 6, outQuad, 100, 'stealthred'}
--ease {136, 6, outQuad, 100, 'twirl'}

---ease {192, 1, outQuad, 100, 'touchfuzzygetdizzy'}
ease {171, 1, outSine, 100, 'tornado'}
ease {171, 1, outSine, 25, 'spiralz'}
ease {172, 1, outQuad, 100, 'dizzy'}

function quick_build(beat,interval)
	for i=0,4,1
	do
		ease {beat, interval, inOutCubic, 100, 'pulse'}
		ease {(beat+interval), interval, inOutCubic, 0, 'pulse'}
		beat = beat-interval
		beat = beat+0.5

	end
end

ease {196, 0.15, inOutCubic, 100, 'pulse'}
ease {(196+0.15), 0.15, inOutCubic, 0, 'pulse'}
ease {196.5, 0.15, inOutCubic, 100, 'pulse'}
ease {(196.5+0.15), 0.15, inOutCubic, 0, 'pulse'}
ease {197, 0.15, inOutCubic, 100, 'pulse'}
ease {(197+0.15), 0.15, inOutCubic, 0, 'pulse'}
ease {197.5, 0.15, inOutCubic, 100, 'pulse'}
ease {(197.5+0.15), 0.15, inOutCubic, 0, 'pulse'}

ease {198, 0.15, inOutCubic, 100, 'pulse'}
ease {(198+0.15), 0.15, inOutCubic, 0, 'pulse'}
ease {198.5, 0.15, inOutCubic, 100, 'pulse'}
ease {(198.5+0.15), 0.15, inOutCubic, 0, 'pulse'}
ease {199, 0.15, inOutCubic, 100, 'pulse'}
ease {(199+0.15), 0.15, inOutCubic, 0, 'pulse'}
ease {199.5, 0.15, inOutCubic, 100, 'pulse'}
ease {(199.5+0.15), 0.15, inOutCubic, 0, 'pulse'}



ease {199, 1, outSine, 0, 'tornado'}
ease {199, 1, outSine, 0, 'spiralz'}
ease {199, 1, outQuad, 0, 'dizzy'}

ease {200, 0.1, inOutCubic, 100, 'space'}
ease {200, 0.1, inOutCubic, 100, 'cubicz'}
ease {200, 2, inOutCubic, 25, 'noteskew'}

ease {200, 0.1, inOutCubic, 100, 'invert'}
ease {200.75, 0.1, inOutCubic, 0, 'invert'	}

ease {202, 0.1, inOutCubic, 100, 'invert'}
ease {202.75, 0.1, inOutCubic, 0, 'invert'	}
ease {200, 3.5, inOutCubic, -100	, 'space'}
ease {204, 0.1, inOutCubic, 0	, 'space'}
ease {202, 1.5, inOutCubic, -25, 'noteskew'}
ease {202, 0.5, inOutCubic, 0, 'noteskew'}
ease {202.75, 0.625, inOutCubic, 100, 'stealth'}

set {203.375, 0, 'noteskew'}
set {203.375, 0, 'space'}
set {203.375, 0, 'centered2'}

ease {203.375, 0.625, inOutCubic, 0, 'stealth'}


func_ease {204, 2, outBack, 160, -160, function(p)
	P[1]:x(SCREEN_CENTER_X-(p))
	P[2]:x(SCREEN_CENTER_X+(p))
	end}

func_ease {204, 1, outBack, 160, -160, function(p)
	P[1]:x(SCREEN_CENTER_X-(p))
	P[2]:x(SCREEN_CENTER_X+(p))
	end}


func {204, function(b) teethhi:hidden(0) end}
set {204, scx, 'teethhix'}
set {204, scy+400, 'teethhiy'}
set {204, 1, 'teethhialpha'}
ease {204, 3, outQuart, scy, 'teethhiy'}


func{0, function()												--(PP= Player Proxy, P = player?)
	for plr=1,2 do
	  if P[plr] then -- if the player exists then
		P[plr]:x(sw/2) -- set its x to sw/2
	  end
	end
  end}



  
--------------------------------RAVING RAPTOR TEST MOD
  definemod {
    'blacksphere',
    function(blacksphere)
        local invert = 50 - 50 * math.cos(blacksphere * math.pi / 180)
        local alternate = 25 * math.sin(blacksphere * math.pi / 180)
        local reverse = -12.5 * math.sin(blacksphere * math.pi / 180)
        return invert, alternate, reverse
    end,
    'invert', 'alternate', 'reverse',
}
---------------------------------------

function reg_kick(beat,interval,strength)
	ease {beat, interval, inOutCubic, strength, 'pulse'}
	ease {beat+interval, interval, inOutCubic, 0, 'pulse'}
end

function sharp_kick(beat,interval,strength)
	ease {beat, interval, inOutCubic, strength, 'spiralz'}
	ease {beat+interval, interval, inOutCubic, 0, 'spiralz'}
	ease {beat, interval, inOutCubic, strength, 'bouncez'}
	ease {beat+interval, interval, inOutCubic, 0, 'bouncez'}
	ease {beat, interval, inOutCubic, strength, 'tipsy'}
	ease {beat+interval, interval, inOutCubic, 0, 'tipsy'}
	ease {beat, interval, inOutCubic, strength, 'split'}
	ease {beat+interval, interval, inOutCubic, 0, 'split'}
end


--ease {204, 1, outSine, 180, 'Blacksphere'}

---function bite(beat,interval,strength)
---
---end

ease {204, 16, linear, scx, 'teethhix'}
ease {204, 8, outSine, 0.5, 'teethhialpha'}
--ease {8, 8, inSine, 0, 'raptor1alpha'}

--set {16, scx+320, 'raptor1x'}
--set {16, -1, 'raptor1zoomx'}
--ease {16, 16, linear, scx, 'raptor1x'}
--ease {16, 8, outSine, 0.5, 'raptor1alpha'}
--ease {24, 8, inSine, 0, 'raptor1alpha'}





reg_kick(204,0.1,200)

reg_kick(206,0.1,200)
sharp_kick(206,0.1,400)

reg_kick(208,0.1,200)
reg_kick(208.750,0.1,200)

sharp_kick(210,0.1,400)