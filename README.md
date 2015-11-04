# overlap2d-runtime-haxeflixel

This is an official runtime for loading scenes, created with Overlap2D Editor ( [http://overlap2d.com/](http://overlap2d.com/) ),
and rendering them in [HaxeFlixel](http://haxeflixel.com/) framework.

Just set your overlap2d export path to assets folder of your HaxeFlixel project. And than later in your create method write:

```as3
var sl:SceneLoader = new SceneLoader();
sl.loadScene("MainScene");
add(sl.getRoot());
```


To get it ready for you
```
haxelib git overlap2d https://github.com/UnderwaterApps/overlap2d-runtime-haxeflixel master
```

##**Note**

This is just initial skeletal version that ONLY supports Images, Sprite Animations and Groups. Everything else to come soon.


##**How to Contribute**

The detailed specification of what runtime should do is in [here](http://overlap2d.com/data-api-creating-custom-runtime/)

Please read before you contribute.
