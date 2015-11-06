package overlap2d;

import flixel.FlxSprite;

class O2DSprite extends FlxSprite implements O2DCoreItem
{
	private var coreData: CoreItemData;

	private var itemId: String;

	public function getId():String {
		return itemId;
	}

	public function getCoreData():CoreItemData {
		return coreData;
	}

	public function setId(id :String): Void {
		itemId = id;
	}

	public function setCoreData(data:CoreItemData): Void {
		coreData = data;
	}

	public function getChild(name: String):O2DCoreItem {
		throw "O2DSprite instances do not have children";

		return this;
	}

	public function getFlxSprite(): FlxSprite {
		return this;
	}
}
 