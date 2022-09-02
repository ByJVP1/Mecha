function onCreate()
	-- background shit
	makeLuaSprite('dielandback', 'dielandback', -200, -100);
	setLuaSpriteScrollFactor('dielandback', 0.9, 0.9);

	makeLuaSprite('dielandfront', 'dielandfront', -380, -200);
	setLuaSpriteScrollFactor('dielandfront', 0.9, 0.9);

	addLuaSprite('dielandback', false);
	addLuaSprite('dielandfront', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end