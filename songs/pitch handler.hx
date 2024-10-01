function update(){
    vocals.pitch = FlxG.save.data.codenameCurPitch;
    inst.pitch = FlxG.save.data.codenameCurPitch;
}
// function postCreate(){
//     if(FlxG.save.data.samedifftime == true){
//     // player.cpu = true;
//     }
// }
function onStartSong(){

    if(FlxG.save.data.samedifftime == true){
        FlxG.save.data.samedifftime = false;
        vocals.time = FlxG.save.data.difftime;
        inst.time = FlxG.save.data.difftime;

        player.cpu = true;

        new FlxTimer().start(0.05, function(tmr:FlxTimer){
            player.cpu = false;
        });
    
    }

}