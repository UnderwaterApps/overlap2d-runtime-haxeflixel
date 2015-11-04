# overlap2d-runtime-haxeflixel

This is an official runtime for loading scenes, created with Overlap2D Editor ( [http://overlap2d.com/](http://overlap2d.com/) ),
and rendering them in [HaxeFlixel](http://haxeflixel.com/) framework.

Just set your overlap2d export path to assets folder of your HaxeFlixel project. And than later in your create method write:

```as3
var sl:SceneLoader = new SceneLoader();
sl.loadScene("MainScene");
add(sl.getRoot());
```


##**Note**

This is just initial skeletal version that ONLY supports Images and Groups. Everything else to come soon.