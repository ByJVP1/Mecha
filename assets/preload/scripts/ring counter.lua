rings = 0
super = false
fastsuper = false
supercooldown = false
hasshield = false
function onCreatePost()
addCharacterToList('super-bf-transform', 'boyfriend');
addCharacterToList('super-bf', 'boyfriend');

runTimer('HE GOT NO RINGS OH SHIT', 0.3, 0)

makeLuaText('1', 'rings ', 1000, 410, 0);
setTextFont('1', 'sonic-hud-font.ttf');
setTextSize('1', 25)
setTextAlignment('1', 'alignment' == 'center');
setTextColor('1', '0xFFf6ff00');
setTextBorder('1', 1, '0xFF000000');
setObjectCamera('1', 'hud');
setProperty('1.alpha', 1);
addLuaText('1');

makeLuaText('3', rings, 1000, 490, 0);
setTextFont('3', 'sonic-hud-font.ttf');
setTextSize('3', 25)
setTextAlignment('3', 'alignment' == 'center');
setTextColor('3', '0xFFffffff');
setTextBorder('3', 1, '0xFF000000');
setObjectCamera('3', 'hud');
setProperty('3.alpha', 1);
addLuaText('3');

makeLuaText('2', 'press 1 to become super!', 1000, 550, 0);
setTextFont('2', 'sonic-hud-font.ttf');
setTextSize('2', 25)
setTextAlignment('2', 'alignment' == 'center');
setTextBorder('2', 1, '0xFF000000');
setTextColor('2', '0xFFffffff');
setObjectCamera('2', 'hud');
setProperty('2.alpha', 0);
addLuaText('2');

makeLuaSprite('WhiteSquare', 'white', 0, 0);
addLuaSprite('WhiteSquare', true);
setObjectCamera('WhiteSquare', 'hud');
setProperty('WhiteSquare.visible', false);
end

function onUpdate(elapsed)

if rings >= 50 then
setProperty('2.alpha', 1);
end

if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ONE') and rings >= 50 and super == false and fastsuper == false then
triggerEvent('Change Character', 0, 'super-bf-transform');
characterPlayAnim('boyfriend', 'transform', false);
setProperty('boyfriend.specialAnim', true);
playSound('bedededededede', 0.5);
runTimer('delayed super sound', 0.45);
setProperty('2.visible', false);
super = true
supercooldown = true
runTimer('supercooldown', 3);
end

if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ONE') and rings >= 50 and super == false and fastsuper == true then
setProperty('WhiteSquare.visible', true);
runTimer('begone white', 0.1);
triggerEvent('Change Character', 0, 'super-bf');
runTimer('loserings', 0.5, 0);
runTimer('gainHP', 0.1, 0);
playSound('transform', 0.5);
setProperty('2.visible', false);
super = true
supercooldown = true
runTimer('supercooldown', 3);
end

if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ONE') and super == true and supercooldown == false then
cancelTimer('gainHP')
cancelTimer('loserings')
super = false
setProperty('WhiteSquare.visible', true);
runTimer('begone white', 0.1);
runTimer('flicker', 0.3, 6)
playSound('bshhhhhh', 0.5)
playSound('bweeeooo', 0.5);
triggerEvent('Change Character', 0, 'bf');
fastsuper = true
end
end

function onUpdatePost(elapsed)

if rings > 0 then
cancelTimer('HE GOT NO RINGS OH SHIT')
end

 if getProperty("boyfriend.curCharacter") == 'super-bf-transform' and getProperty('boyfriend.animation.curAnim.finished') then
	 triggerEvent('Change Character', 0, 'super-bf');
	 runTimer('loserings', 0.5, 0);
	 runTimer('gainHP', 0.1, 0);
 end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'delayed super sound' then
playSound('transform', 0.5);
setProperty('WhiteSquare.visible', true);
runTimer('begone white', 0.1);
end
if tag == 'begone white' then
setProperty('WhiteSquare.visible', false);
end
if tag == 'loserings' then
	rings = rings - 1
setTextString('3', rings);
if rings == 10 then
playSound('underwater bebebing', 0.5);
end

if rings == 0 then
fastsuper = true
super = false
runTimer('HE GOT NO RINGS OH SHIT', 0.3, 0)
setProperty('WhiteSquare.visible', true);
runTimer('begone white', 0.1);
runTimer('flicker', 0.3, 6)
playSound('bshhhhhh', 0.5)
playSound('bweeeooo', 0.5);
triggerEvent('Change Character', 0, 'bf');
cancelTimer('loserings')
end
end
if tag == 'gainHP' then
setProperty('health', getProperty('health')+0.05);
if rings == 0 then
cancelTimer('gainHP')
end
end
	if tag == 'flicker' then
		runTimer('flicker out', 0.1)
		runTimer('flicker in', 0.2)
	end

	if tag == 'flicker out' then
		setProperty('boyfriend.alpha', 0);
		setProperty('iconP1.alpha', 0);
	end

	if tag == 'flicker in' then
		setProperty('boyfriend.alpha', 1);
		setProperty('iconP1.alpha', 1);
	end

	if tag == 'HE GOT NO RINGS OH SHIT' then
		runTimer('broke bitch', 0.1)
		runTimer('broker bitch', 0.2)
	end

	if tag == 'broke bitch' then
		setTextColor('1', '0xFFfc0303')
	end

	if tag == 'broker bitch' then
		setTextColor('1', '0xFFf6ff00');
	end

	if tag == 'supercooldown' then
	supercooldown = false
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
if id == 0 and hasshield == true then
		hasshield = false
end
if rings > 0 and hasshield == false then
randomloss = getRandomInt(1, rings)
rings = rings - randomloss
setTextString('3', rings);
playSound('ring loss', 0.5);
end
if rings == 0 then
runTimer('HE GOT NO RINGS OH SHIT', 0.3, 0)
end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
if noteType == 'Ring Monitor' then
	 rings = rings + 10

setTextString('3', rings);

if rings == 50 and super == false then
playSound('big ring', 0.5);
end

end
if noteType == 'Rings' then
	 rings = rings + 1

setTextString('3', rings);

if rings == 50 and super == false then
playSound('big ring', 0.5);
end

end
if noteType == 'S Monitor' then
	 rings = rings + 50
triggerEvent('Change Character', 0, 'super-bf-transform');
characterPlayAnim('boyfriend', 'transform', false);
setProperty('boyfriend.specialAnim', true);
playSound('bedededededede', 0.5);
runTimer('delayed super sound', 0.45);
setProperty('2.visible', false);
setTextString('3', rings);
super = true
end
if noteType == 'Shield Monitor' then
		hasshield = true
end
if noteType == 'Flame Shield Monitor' then
		hasshield = true
end
end