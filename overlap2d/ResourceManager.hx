package overlap2d;

import overlap2d.IResourceRetriever;
import flixel.group.FlxSpriteGroup;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;
import openfl.Assets;
import haxe.Json;
import flixel.FlxG;

class ResourceManager implements IResourceRetriever
{

	var assetsPath: String;

	var atlasRegions: FlxAtlasFrames;

	var spriteAnimations: Map<String, FlxAtlasFrames>;

	var projectVO:Dynamic;
	var sceneMap: Map<String, Dynamic>;

	public function new() 
	{
		assetsPath = "assets/";		

		sceneMap = new Map();
		spriteAnimations = new Map();
	}

	public function loadAssets():Void {
		loadProjectVO();
		loadAtlas();
		loadSpriteAnimations();
	}

	public function loadProjectVO():Void {
		var content = Assets.getText(assetsPath + "project.dt");
		projectVO = Json.parse(content);
	}

	public function loadAtlas():Void {
		atlasRegions = FlxAtlasFrames.fromLibGdx(assetsPath + "orig/pack.png", assetsPath + "orig/pack.atlas");
	}

	public function loadSpriteAnimations():Void {
		var sceneNameList:Array<Dynamic> = projectVO.scenes;
		var anims:Array<String> = new Array();
		for(sceneNm in sceneNameList) {
			var scene = getSceneVO(sceneNm.sceneName);		
			DataUtils.getSpriteAnimationsList(scene.composite, anims);
		}

		for(animName in anims) {
			var path:String = assetsPath + "orig/sprite_animations/" + animName + "/";
			var frames = FlxAtlasFrames.fromLibGdx(path + animName + ".png", path + animName + ".atlas");
			spriteAnimations[animName] = frames;
		}
	}

	public function getSceneVO(name:String):Dynamic {
		if(sceneMap[name] != null) {
			return sceneMap[name];
		}

		var content = Assets.getText(assetsPath + 'scenes/' + name + ".dt");
		var data:Dynamic = Json.parse(content);

		sceneMap[name] = data;

		return data;
	}

	public function getProjectVO():Dynamic {
		return projectVO;
	}

	public function getRegion(name:String):O2DSprite {
		var sprite: O2DSprite = new O2DSprite();
		sprite.frames  = atlasRegions;
		sprite.animation.frameName = name;
		
		return sprite;
	}

	public function getSpriteAnimation(name:String):O2DSprite {
		var frames = spriteAnimations[name];
		var sprite: O2DSprite = new O2DSprite();
		sprite.frames  = frames;
		
		return sprite;
	}
}
 
