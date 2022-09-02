function onCreate()
	-- background shit
	makeLuaSprite('forestback', 'forestback', -380, -270);
	setLuaSpriteScrollFactor('forestback', 0.9, 0.9);

	makeLuaSprite('bush', 'bush', -200, -100);
	setLuaSpriteScrollFactor('bush', 0.9, 0.9);
	
	makeLuaSprite('forestfront', 'forestfront', -380, -50);
	setLuaSpriteScrollFactor('forestfront', 0.9, 0.9);

	makeLuaSprite('vines', 'vines', -380, -50);
	setLuaSpriteScrollFactor('vines', 0.9, 0.9);

	makeLuaSprite('emerald', 'emerald', 420, 60);
	setLuaSpriteScrollFactor('emerald', 0.9, 0.9);

	addLuaSprite('forestback', false);
	addLuaSprite('bush', false);
	addLuaSprite('forestfront', false);
	addLuaSprite('vines', false);
	addLuaSprite('emerald', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end