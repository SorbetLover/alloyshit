function postCreate(){
importScript("data/scripts/camsys"); 
// player.cpu = true;


camOFF[0][0] = 500;
camOFF[0][1] = 450;

camOFF[1][0] = 800;
camOFF[1][1] = 450;

camOFF[2][0] = 600;
camOFF[2][1] = 450;
camGame.followLerp = 0.03;
}

// function onStartSong(){
//     FlxG.sound.music.time = 20000;
//     vocals.time = 20000;
// }