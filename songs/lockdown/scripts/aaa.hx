function create(){
    var shader2 = new CustomShader("camDupe");
    FlxG.camera.addShader(shader2);
    shader2.multi = 1;

}

