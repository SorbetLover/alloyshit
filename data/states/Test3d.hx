import flx3d.Flx3DView;

import away3d.entities.Mesh;
import away3d.primitives.CubeGeometry;
var cube:Mesh;
var scene3D:Flx3DView;
function create() {
    cube = new Mesh();
    cube2 = new Mesh();
 

    scene3D = new Flx3DView(0, 0, FlxG.width / 2 , FlxG.height / 2); // This is what's creating the 3D world
    scene3D.scale.set(2,2);
    scene3D.screenCenter();
    
    add(scene3D); // The 3D View works just like any other sprite so it will have to be added like one
    scene3D.addChild(cube);
    
    scene3D.addModel(Paths.dae('nyanses'), function(model){
        if(Std.string(model.asset.assetType) == 'mesh'){
            model.asset.scale(80);
            model.asset.y -= 100;
            model.asset.z -= 300;
            model.asset.x = -300;
            model.asset.rotationX = 90;
            cube = model.asset;
        }
    }, Paths.image("models/y804000_01"), false);

    scene3D.addModel(Paths.obj('obj/Nyanses'), function(model){
        if(Std.string(model.asset.assetType) == 'mesh'){
            model.asset.scale(80);
            model.asset.y -=300;
            model.asset.z = 0;
            model.asset.x = 300;
            cube2 = model.asset;
        }
    }, Paths.image("models/y804000_01"), false);

}



function update(elapsed){
    // cube. += 30 * elapsed;
    // cube.rotationY += 30 * elapsed;
    // cube.rotationZ += 30 * elapsed;

    if(FlxG.keys.pressed.A){
        scene3D.camera.x += 300*elapsed;
    }
    if(FlxG.keys.pressed.D){
        scene3D.camera.x -= 300*elapsed;
    }

}