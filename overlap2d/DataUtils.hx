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

	public static function readCustomVars(varString: String): Map<String, String> {
		if(varString == null ||varString.length == 0) return new Map<String, String>();

		var result: Map<String, String> = new Map<String, String>();

        var vars:Array<String>  = varString.split(";");
        for(varItem in vars) {
            var tmp:Array<String> = varItem.split(":");
            if(tmp.length > 1) {
                result.set(tmp[0], tmp[1]);
            }
        }

        return result;
	}

}
 