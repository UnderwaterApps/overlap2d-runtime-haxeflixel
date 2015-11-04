package overlap2d;

import flixel.FlxSprite;

interface IResourceRetriever {

	public function getSceneVO(name:String):Dynamic;
	public function getRegion(name:String):FlxSprite;
	public function getSpriteAnimation(name:String):FlxSprite;
	public function getProjectVO():Dynamic;

}