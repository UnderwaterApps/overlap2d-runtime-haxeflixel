package overlap2d;

import flixel.FlxSprite;

interface IResourceRetriever {

	public function getSceneVO(name:String):Dynamic;
	public function getRegion(name:String):O2DSprite;
	public function getSpriteAnimation(name:String):O2DSprite;
	public function getProjectVO():Dynamic;

}