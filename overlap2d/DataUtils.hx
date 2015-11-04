package overlap2d;


class DataUtils
{
	public static function getSpriteAnimationsList(composite: Dynamic, list:Array<String>) {
		if(composite.sSpriteAnimations != null) {
			var items: Array<Dynamic> = composite.sSpriteAnimations;
			for(item in items) {
				var name:String = item.animationName;
				if(list.indexOf(name) == -1) list.push(name);
			}
		}
		if(composite.sComposites != null) {
			var items: Array<Dynamic> = composite.sComposites;
			for(item in items) {
				getSpriteAnimationsList(item.composite, list);
			}
		}

		return list;
	}

}
 