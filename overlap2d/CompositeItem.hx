package overlap2d;

import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.util.FlxColor;

class CompositeItem extends FlxSpriteGroup
{

	var ir:IResourceRetriever;
	var vo:Dynamic;

	var pixelsPerWU:Float;

	var boundHeight: Float;


	public function new(itemVO:Dynamic, ir:IResourceRetriever) 
	{
		super();

		this.ir = ir;
		this.vo = itemVO;

		pixelsPerWU = ir.getProjectVO().pixelToWorld;

		build(vo);
		invertY();
	}

	private function invertY():Void {
		boundHeight = height;
		if(vo.height != null) boundHeight = vo.height;
		for (sprite in _sprites)
		{
			var sprH = sprite.height;			
			if(Std.is(sprite, CompositeItem)) sprH = cast(sprite, CompositeItem).boundHeight;

			sprite.y = boundHeight - sprH- sprite.y;
		}
	}

	private function build(itemVO:Dynamic):Void {
		if(itemVO.composite.sImages != null) buildImages(itemVO.composite.sImages);
		if(itemVO.composite.sComposites != null) buildComposites(itemVO.composite.sComposites);
		if(itemVO.composite.sSpriteAnimations != null) buildSpriteAnimations(itemVO.composite.sSpriteAnimations);
	}

	private function processMain(sprite:FlxSprite, vo:Dynamic):Void {
		if(vo.x == null) vo.x = 0;
		if(vo.y == null) vo.y = 0;
		sprite.x = vo.x * pixelsPerWU;
		sprite.y = vo.y * pixelsPerWU;
		sprite.origin.x = sprite.frameWidth/2;
		sprite.origin.y = sprite.frameHeight/2;
		if(vo.rotation != null) sprite.angle = -vo.rotation;
		if(vo.scaleX != null) sprite.scale.x = vo.scaleX;
		if(vo.scaleY != null) sprite.scale.y = vo.scaleY;
		if(vo.tint != null) {
			sprite.color = FlxColor.fromRGB(Math.round(vo.tint[0]*255), Math.round(vo.tint[1]*255), Math.round(vo.tint[2]*255), Math.round(vo.tint[3]*255));
		}
	}

	private function buildImages(images:Array<Dynamic>):Void {
		for(imageVO in images) {
            var image:FlxSprite = ir.getRegion(imageVO.imageName);
            image.height = image.frameHeight;
            processMain(image, imageVO);
            add(image);
        }
	}

	private function buildSpriteAnimations(animations:Array<Dynamic>):Void {
		for(animVO in animations) {
            var anim:FlxSprite = ir.getSpriteAnimation(animVO.animationName);
            anim.height = anim.frameHeight;
            var frameRangeArray:Array<Dynamic> = animVO.frameRangeMap;
            var fps = animVO.fps;
            var looped:Bool = false;
            if(animVO.fps == null) fps = 24;            
            if(animVO.playMode == 2) looped = true;   
            for(range in frameRangeArray) {
            	var frames = [for (i in range.startFrame...range.endFrame) i];
            	anim.animation.add(range.name, frames, fps, looped);
            }
            anim.animation.play(animVO.currentAnimation);

            processMain(anim, animVO);
            add(anim);
        }
	}	

	private function buildComposites(composites:Array<Dynamic>):Void {
		for(compositeVo in composites) {
            var composite:CompositeItem = new CompositeItem(compositeVo, ir);
            processMain(composite, compositeVo);
            add(composite);
        }
	}
}
 