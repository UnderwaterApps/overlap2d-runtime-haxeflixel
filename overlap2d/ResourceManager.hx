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

	var projectVO:Dynamic;

	public function new() 
	{
		assetsPath = "assets/";		
	}

	public function loadAssets():Void {
		loadProjectVO();
		loadAtlas();
	}

	public function loadProjectVO():Void {
		var content = Assets.getText(assetsPath + "project.dt");
		projectVO = Json.parse(content);
	}

	public function loadAtlas():Void {
		atlasRegions = FlxAtlasFrames.fromLibGdx(assetsPath + "orig/pack.png", assetsPath + "orig/pack.atlas");
	}

	public function getSceneVO(name:String):Dynamic {
		var content = Assets.getText(assetsPath + 'scenes/' + name + ".dt");
		var data:Dynamic = Json.parse(content);

		return data;
	}

	public function getProjectVO():Dynamic {
		return projectVO;
	}

	public function getRegion(name:String):FlxSprite {
		var sprite: FlxSprite = new FlxSprite(0, 0);
		sprite.frames  = atlasRegions;
		sprite.animation.frameName = name;
		
		return sprite;
	}
}
 