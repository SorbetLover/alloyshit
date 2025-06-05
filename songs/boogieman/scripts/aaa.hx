import  funkin.backend.shaders.CustomShader;

var shader2:CustomShader;
function postCreate(){
    shader2 = new CustomShader("camDupe");
    shader2.renderScale = [ 2, 2];
    FlxG.camera.addShader(shader2.shader);

    
    // strumLines.members[0].characters[0].shader = shader2;
    // shader2.brightness = 2;
    // shader2.hue = 4;
    // shader2.contrast = 1;
    // shader2.saturation = 9;
}