package overlap2d;

import overlap2d.IResourceRetriever;
import flixel.group.FlxSpriteGroup;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;
import openfl.Assets;
import haxe.Json;
import flixel.FlxG;

class SceneLoader
{
	var rm:ResourceManager;
	var root:CompositeItem;

	var sceneVO:Dynamic;

	public function new() 
	{
		rm = new ResourceManager();
		rm.loadAssets();
	}

	public function loadScene(name:String):Void {
		sceneVO = rm.getSceneVO("MainScene");

		var tmp:Dynamic = {};
		tmp.composite = sceneVO.composite;
		tmp.x = 0;
		tmp.y = 0;
		root = new CompositeItem(tmp, rm);
	}

	public function getRoot():CompositeItem {
		return root;
	}

}
 