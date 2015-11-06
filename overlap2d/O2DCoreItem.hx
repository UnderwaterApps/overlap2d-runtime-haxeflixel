package overlap2d;

import flixel.FlxSprite;

interface O2DCoreItem
{
	public function getId():String;
	public function getCoreData():CoreItemData;
	public function setId(id :String): Void;
	public function setCoreData(data:CoreItemData): Void;
	public function getChild(name: String):O2DCoreItem;
	public function getFlxSprite(): FlxSprite;
	public function findChildrenByTag(tag: String): Array<FlxSprite>; 
}
 