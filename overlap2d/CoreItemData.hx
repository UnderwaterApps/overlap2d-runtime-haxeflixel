package overlap2d;

class CoreItemData
{
	public var tags: Array<String>;
	public var customVariables: Map<String, String>;

	public function new() 
	{
	}

	public function hasTag(tag: String): Bool {
		if(tags.indexOf(tag) != -1) {
			return true;
		}

		return false;
	}

	public function getVar(key: String): String {
		return customVariables.get(key);
	}
}
 