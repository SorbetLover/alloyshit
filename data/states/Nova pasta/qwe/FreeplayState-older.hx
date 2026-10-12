// import flixel.addons.display.FlxBackdrop;
// import flixel.util.FlxTimer;
// import flixel.text.FlxText;
// import flixel.util.FlxColor;
// import flixel.addons.display.FlxGridOverlay;
// import funkin.game.HealthIcon;
// import funkin.backend.Conductor;
// import flixel.math.FlxPoint;
// import funkin.menus.FreeplayState;
// var shit:String;
// var beat:Float = 0;
// var bpma:Float = 0;
// var bpmb:Float = songs[curSelected].bpm;
// var mokabackdrop:FlxBackdrop;
// var Bpmtext:FlxText;
// var shitBG:FlxSprite;
// var modText:FlxText;
// var shitBG2:FlxSprite;
// var modx:Float = 640;
// var shiit:String = "";
// var shitAAA:Int = 0;

// var shiit2:Float = 640;
// var beatshit:Int = 0;
// var changelogtxt:FlxText;
// var infoBox:FlxSprite;
// function create(){  
//     infoBox = new FlxSprite().makeGraphic(520,1000, 0xFF000000);
//     insert(members.indexOf(scoreBG) + 1, infoBox);
//     infoBox.screenCenter();
//     // infoBox.x += 500;
//     infoBox.x = 1500;
//     infoBox.y -= 120;
//     infoBox.alpha = 1;

//     shitBG = new FlxSprite().makeGraphic(50,50, 0xFF000000);
//     insert(members.indexOf(scoreBG), shitBG); 
//     shitBG.y = 0;
//     shitBG.x = 60;
//       shitBG.scale.x = 50;
//       shitBG.scale.y = 0.4;
    
//     FlxTween.tween(shitBG, {"scale.y": 2.8}, 1, {ease: FlxEase.cubeOut});

//     shitBG.alpha = 0.8;

//     shitBG2 = new FlxSprite().makeGraphic(500,500, 0xFF000000);
//     insert(members.indexOf(shitBG), shitBG2); 
//     shitBG2.y = 540;
//     shitBG2.x = 880;
//     shitBG2.alpha = 0.8;
    
    
    
    
//     scoreBG.alpha = 0;

//     // beatshit();
//     Bpmtext = new FlxText(10, 5, 0, "0", 25);
//     Bpmtext.y = 675;
//     Bpmtext.x = 895;
//     Bpmtext.font = Paths.font("vcr.ttf");
    
//     add(Bpmtext);

//     modText = new FlxText(32, 5, 0, ":", 35);
    
//     modText.y = 30;
//     modText.x = 10;
    
//     add(modText);

//     scoreText.y = 570;
//     diffText.y = scoreText.y + 40;
//     coopText.y = scoreText.y + 70;
//     scoreBG2.y = scoreText.y - 20;
//     bpmb = songs[curSelected].bpm;

// }
// var clText:FlxText;
// function postCreate(){
//     changelogtxt = new FlxText(800,42, 900, "Press E to view changelog.", 100);
//     insert(members.indexOf(Bpmtext) + 1, changelogtxt);
//     changelogtxt.setFormat(Paths.font("vcr.ttf"), 30);
    
//     clText = new FlxText(780, 80, 800,
//      "
//               CHANGELOG
//        - Added Agitated Remix
//        - Added Home of Core
//        - Added 'raluca' diff on 
//          Broken Heartware
//        - Added my cousin (?)
//          on cyberdossie
//        - wip of B Epiphany W gif 
//          distractions
//                        ", 40);
//     add(clText);
//     clText.setFormat(Paths.font("vcr.ttf"), 25);


// }
// function postUpdate(){
//     clText.x = infoBox.x - 100;
//     for(i in iconArray){
//         if(shitAAA == 4){
//         i.alpha += 0.05;
//         }
//     }
//     changeSelection(-FlxG.mouse.wheel);
// }
// var clopen:Bool = false;
// function update(elapsed){
//     // if(FlxG.keys.justPressed.E && clopen == false){
//     //   new FlxTimer().start(0.1, function(tmr:FlxTimer){
//     //      clopen = true;
//     //     });
//     //     FlxTween.tween(infoBox, {x: 880}, 0.3, {ease: FlxEase.cubeOut});
//     //     for( i in [diffText, coopText, scoreText, Bpmtext]){
//     //     FlxTween.tween(i, {alpha: 0}, 0.1);
//     //     }
        
//     // }
//     // if(FlxG.keys.justPressed.E && clopen == true){
//     //     FlxTween.tween(infoBox, {x: 1500}, 0.3, {ease: FlxEase.cubeOut});
//     //     for( i in [diffText, coopText, scoreText, Bpmtext]){
//     //     FlxTween.tween(i, {alpha: 1}, 0.1);
//     //     }
//     //     clopen = false;
//     // }
//     shiit = modText.text;
//     shiit2 = 640 - shiit.length;
//     bpmb = songs[curSelected].bpm;

// switch(songs[curSelected].difficulties[curDifficulty]){

//     case "hard", "Hard", "HARD": 
//         diffText.color = 0xff1a1a;

//     case "normal", "Normal","NORMAL": 
//         diffText.color = 0xffff66;

//     case "easy", "Easy", "EASY": 
//         diffText.color = 0x00ff80;


//     case "unfair", "Unfair", "UNFAIR": 
//         diffText.color = 0xFFb300b3;
        
//     default:
//         diffText.color = 0xFFFFFF;


//     }
    
//     switch(songs[curSelected].name){
//         case "worship":
//             modText.text = "Mid Fight Masses";
//         case "worshi-fy":
//             modText.text = "Mid Fight Masses / Friday Night Fever";
//         case "quick-draw" | "quickdraw":
//             modText.text = "Mad Virus Attack v2";

    
//         case "b-epiphany", "love n funkin", "takeover medley":
//                 modText.text = "Doki Doki Takeover";
//         case "b-epiphany-alt", "poems-n-thorns":
//                 modText.text = "Doki Doki Takeover / Friday Night Romance 7";
//         case "last-meow":
//             modText.text = "Friday Night Fever: Taki's Revenge";
//         case "w00f" | "cosmic-swing" | "mechanical":
//             modText.text = "Friday Night Fever: Frenzy";
//         case "deep-poems":
//             modText.text = "Hotline 024 / FNF Piggyfied";
//         case "soul":
//             modText.text = "Static Memories Act 2";
//         case "hot-air-baloon" | "its-complicated" | "catfight":
//             modText.text = "Maginage Matches / DDTO+";  
//         case "monochrome":
//             modText.text = "THIS IS BLACK DIAMOND";
//         case "vespers":
//             modText.text = "Mid Fight Masses Deluxe Edition";
//         case "takeover":
//             modText.text = "Cassandra";
//         case "boogieman":
//             modText.text = "Twinsomnia";
//         case "memories":
//             modText.text = "Piggyfied";
//         case "broken-heartware":
//             modText.text = "Friday Night Romance 7";
//         case "markov":
//             modText.text = "Raluca Bad Ending";
//         case "bgospel", "power-hour", "cyberhate", "triple-trouble", "libitina", "sleeptalk", "home", "agitated_remix":
//             modText.text = "Friday Night Exposed and Others";
//         case "xamuel":
//             modText.text = "eh pra qm quiser";    
//         default:
//             modText.text = "Base Game";
//         }
//         Bpmtext.text = "BPM:" + " " + bpmb;

// }
    
// // function beatshit(){
    
// //     bpma = 60 / songs[curSelected].bpm;
// //     beat += 1;
// //     if(beat % 2 == 0){
// //     camera.zoom = 0.96;
// // FlxTween.tween(camera, {zoom: 1}, bpma * 0.9, {ease: FlxEase.cubeOut});	
// //    }
// //    new FlxTimer().start(bpma , function(tmr:FlxTimer){ 
// //     beatshit();
// //    });
       

// // }
// var shitskew:Bool = false;
// function beatHit(){
//     beatshit += 1;
      
//     if(beatshit % 2 == 0){
//     for(i in iconArray){
//         switch(shitAAA){
//             case 0:
//                 i.scale.set(0.9, 0.8);
//                 new FlxTimer().start(0.05 , function(tmr:FlxTimer){ 
                            
//                 shitAAA = 1;
//                 });
//             case 1:
//                 i.scale.set(0.8, 0.9);

//                 new FlxTimer().start(0.05 , function(tmr:FlxTimer){ 
                            
//                     shitAAA = 2;
//                     });
//                 case 2:
//                 i.angle = -15;       

//                 new FlxTimer().start(0.05 , function(tmr:FlxTimer){ 
                            
//                     shitAAA = 3;
//                     });
//                 case 3:
//                 i.angle = 15;

//                 new FlxTimer().start(0.05 , function(tmr:FlxTimer){ 
                            
//                     shitAAA = 4;
//                     });
//                 case 4:
//                     i.color = 0xFF000000;
//                     FlxTween.color(i, 0.4, i.color, 0x99FFFFFF);

//                     new FlxTimer().start(0.05 , function(tmr:FlxTimer){ 
                                
//                         shitAAA = 0;
//                     });
                        
//         }
//         FlxTween.tween(i, {angle: 0, "scale.x": 1, "scale.y": 1}, .4, {ease: FlxEase.cubeOut});	
//     }

//      bg.scale.set(0.95, 0.95);
//     camera.zoom = 0.96;
//     FlxTween.tween(camera, {zoom: 1.1}, Conductor.crochet / .4, {ease: FlxEase.cubeOut});
//     FlxTween.tween(bg, {"scale.x": 1.02, "scale.y": 1.02}, .4, {ease: FlxEase.cubeOut});	

    
    
//   }
        
// }