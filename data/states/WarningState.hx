import flixel.text.FlxTextAlign;
var amioled:FunkinText;
function create(){
    if(FlxG.save.data.AMOLEDSCREEN == null){
        FlxG.save.data.AMOLEDSCREEN = false;
    }
    disclaimer.text = "\nThis mod contains some covers and ports, \n*nothing is 100% accurate or finished.* \n Please go to the settings and let the game know if you use an #AMOLED# screen or press #H# to turn this mode, for brightness purposes. \n\n -SorbetLover";

    amioled = new FunkinText(0,0,1000, "AMOLED mode is currently " + (FlxG.save.data.AMOLEDSCREEN ? "ON" : "OFF") , 32);
    add(amioled);
    amioled.alignment = FlxTextAlign.CENTER;
    amioled.screenCenter();
    amioled.y = FlxG.height - 100;
    
    amioled.antialiasing = false;
}
// "AMOLED mode is currently #" + (FlxG.save.data.AMOLEDSCREEN ? "ON" : "OFF") + "#"

function update(){
    if(FlxG.keys.justPressed.H){
        FlxG.save.data.AMOLEDSCREEN = !FlxG.save.data.AMOLEDSCREEN;
        amioled.text = "AMOLED mode is currently " + (FlxG.save.data.AMOLEDSCREEN ? "ON" : "OFF");
    }

}