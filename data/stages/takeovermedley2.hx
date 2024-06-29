import flixel.addons.display.FlxBackdrop;
import funkin.game.HealthIcon;
import flixel.util.FlxColor;
import flixel.text.FlxText;

import flixel.text.FlxTextBorderStyle;


function postUpdate(){
    camFollow.setPosition(camobj.x,camobj.y);

    camZooming = true;
    strumLines.members[2].characters[0].y = bgsepie.y - 100;

    strumLines.members[2].characters[0].x = bgsepie.x + 100;
    boxsepie.y = bgsepie.y;

    bgmonka.x = box.x + 2;
    bg.x = box.x;
    strumLines.members[0].characters[0].x = box2.x + 70;
    bg0.x = box2.x + 2;
    strumLines.members[1].characters[0].x = box.x + 100;
    strumLines.members[1].characters[0].y = -40;

    strumLines.members[3].characters[0].x = box.x - 100;
    strumLines.members[3].characters[0].y = 250;

    strumLines.members[4].characters[0].x = box.x + 40;
    strumLines.members[4].characters[0].y = -30;

    strumLines.members[5].characters[0].x = box.x + 250;
    strumLines.members[5].characters[0].y = 180;

    strumLines.members[5].characters[1].x = box.x + 200;
    strumLines.members[5].characters[1].y = 250;
    
    strumLines.members[6].characters[0].x = box.x + 100;
    strumLines.members[6].characters[0].y = -20;

    // strumLines.members[7].characters[0].x = box.x - 20;
    // strumLines.members[7].characters[0].y = -50;
   
    if(PlayState.curStep > 1870 ){
        bgabbie.alpha = 0;

    }


}
//0 bf
//1 monka
//2 sepie
//3 annie
//4 nat
//5 gif
//5 1 gif mad
//6 sepie real
var bgback:FlxBackdrop;
//7 monka real
var pen:FlxSprite;
var sngText:FlxText;
function postCreate(){

    FlxG.camera.addShader(shader2 = new CustomShader("antifish"));

    // importScript("data/scripts/FishEyeShader");
    // var shadershit:FishEyeShader = new FishEyeShader();
    // FlxG.camera.addShader(shadershit);
    // FlxG.camera.addShader(shader2 = new CustomShader("old tv effect/old tv3"));


    HomeStatic.cameras = [camHUD];
    HomeStatic.screenCenter();
    HomeStatic.alpha = 0;
    bgback = new FlxBackdrop(Paths.image('stages/takeovermedley/scrolling_bg'));
    insert(0, bgback);
    bgback.velocity.x = -100;

    bgback2 = new FlxBackdrop(Paths.image('stages/takeovermedley/pocBackground'));
    insert(1, bgback2);
    // bgback2.scale.set(0.7,0.7);
    bgback2.alpha = 0.8;
    bgback2.velocity.x = -200;

    abgback = new FlxBackdrop(Paths.image('stages/takeovermedley/scrolling_bgstatic'));
    insert(0, abgback);
    abgback.velocity.x = -100;

    abgback2 = new FlxBackdrop(Paths.image('stages/takeovermedley/pocBackgroundstatic'));
    insert(1, abgback2);
    // abgback2.scale.set(0.7,0.7);
    abgback2.alpha = 0.8;
    abgback2.velocity.x = -200;

    strumLines.members[0].characters[0].alpha = 0;
    strumLines.members[1].characters[0].alpha = 0;
    strumLines.members[2].characters[0].alpha = 0;
    strumLines.members[3].characters[0].alpha = 0;
    strumLines.members[4].characters[0].alpha = 0;
    strumLines.members[5].characters[0].alpha = 0;
    strumLines.members[5].characters[1].alpha = 0;
    strumLines.members[6].characters[0].alpha = 0;
    // strumLines.members[1].characters[0].x = -100;
    // strumLines.members[1].characters[0].y = 300;

    // strumLines.members[2].characters[0].x = -200;
    for(i in strumLines.members[2].members){

      i.cameras = [camGame];
      i.x += 336;
      i.y -= 100;
    //   i.angle = 180;
      i.alpha = 0;

    }
    bgmonka.alpha = 0;
    bgabbie.alpha = 0;
    bgannie.alpha = 0;
    bggif.alpha = 0;
    bgsereal.alpha = 0;
    bg0.alpha = 0;
    box.alpha = 0;
    box2.alpha = 0;
    boxsepie.alpha = 0;
    bgsepie.alpha = 0;
    bg.alpha = 0;
    
    FlxG.camera.zoom = 0.5;

    dokiLogo.cameras = [camHUD];
    dokiLogo.alpha = 0;
    dokiLogo.scale.set(0.6,0.6);
    dokiLogo.screenCenter();
    insert(5, dokiLogo);
    // strumLines.members[0].cpu = true;

    healthBar.createFilledBar(0xFF880000, 0xFF0099ff);    
    healthBar.percent = health;            

    remove(iconP2);
    iconP2 = new HealthIcon("alastor", false);
    iconP2.cameras = [camHUD];
    iconP2.y = healthBar.y - 75;
    iconP2.x = iconP2;
    insert(members.indexOf(iconP1) + 1, iconP2);

    remove(iconP1);
    iconP1 = new HealthIcon("bf", true);
    iconP1.cameras = [camHUD];
    iconP1.y = healthBar.y - 75;
    iconP1.x = iconP2;
    insert(members.indexOf(iconP2) - 1, iconP1);


    sngText = new FlxText(1010,640, 500, "Takeover Medley", 15, false);
    sngText.cameras = [camHUD];
    sngText.setFormat(Paths.font("riffic.ttf"), 30);
    sngText.antialiasing = true;



    sngText.color = 0xFFFFFFFF;
	 sngText.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.PURPLE, 20);
	   sngText.borderSize = 2;
	   sngText.borderQuality = 10;
    insert(members.indexOf(healthBar) + 2, sngText);
    pen = new FlxSprite().loadGraphic(Paths.image("icons/pen"));
    insert(members.indexOf(sngText) - 1, pen);

    pen.cameras = [camHUD];
    pen.antialiasing = true;
    pen.x = 910;
    pen.y = 585;
    pen.scale.set(0.4,0.4);
    new FlxTimer().start(8, function(tmr:FlxTimer){ FlxTween.tween(pen, {alpha: 0}, 1);FlxTween.tween(sngText, {alpha: 0}, 1);});
    camobj.y -= 1000;

    for(i in strumLines.members[2].members) i.alpha = 0;

    for(i in 0...strumLines.length){
        strumLines.members[i].members[0].alpha = 0;
        strumLines.members[i].members[1].alpha = 0;
        strumLines.members[i].members[2].alpha = 0;
        strumLines.members[i].members[3].alpha = 0;
    }
    initialletociaAlpha = 0;
    iconP1.alpha = 0;
    iconP2.alpha = 0;
    healthBar.alpha = 0;
    healthBarBG.alpha = 0;
}



function stepHit(curStep){
    if(curStep > 1128){
        
        boxsepie.y = -5000;
    }
    switch(curStep){


        case 16:
                    FlxTween.tween(dokiLogo, {alpha: 1}, 2);
            
        case 52:
                    for(i in 0...strumLines.length){
                        FlxTween.tween(strumLines.members[i].members[0], {alpha: 1}, 0.5);
                        FlxTween.tween(strumLines.members[i].members[1], {alpha: 1}, 0.5);
                        FlxTween.tween(strumLines.members[i].members[2], {alpha: 1}, 0.5);
                        FlxTween.tween(strumLines.members[i].members[3], {alpha: 1}, 0.5);

                    }
                    for(i in [ iconP1, iconP2, healthBar, healthBarBG]){
                        FlxTween.tween(i, {alpha: 1}, 0.5);
                    }
                    for(i in 0...uhhGrouper.length){
    
                    FlxTween.tween(uhhGrouper.members[i], {alpha: 0.8}, 0.5);
                    }
                    FlxTween.tween(dokiLogo, {alpha: 0}, 0.5);
                    FlxTween.tween(camobj, {y: camobj.y + 1000}, 3);
        case 64:
            FlxTween.tween(box, {alpha: 1}, 1);
            FlxTween.tween(box2, {alpha: 1}, 1);

            FlxTween.tween(boxsepie, {alpha: 1}, 1);
            FlxTween.tween(bg0, {alpha: 1}, 1);
            
         for(i in strumLines.members[2].members){
                FlxTween.tween(i, {alpha: 1}, 1);
        
         }            FlxTween.tween(strumLines.members[0].characters[0], {alpha: 1}, 1);
            FlxTween.tween(bg, {alpha: 1}, 1);
        case 76:
            strumLines.members[1].characters[0].alpha = 1;
            FlxTween.tween(bgmonka, {alpha: 1}, 0.01);
            FlxTween.tween(bgmonka, {"scale.y": 1.55}, Conductor.crochet / 10000);
            FlxTween.tween(box, {"scale.y": 1.55}, Conductor.crochet / 10000);


        case 239:
            FlxTween.tween(boxsepie, {y: -20}, Conductor.crochet / 200, {ease:FlxEase.cubeOut});
            FlxTween.tween(bgsepie, {y: -20}, Conductor.crochet / 200, {ease: FlxEase.cubeOut});

            FlxTween.tween(box2, {x: box2.x + 300}, 2, {ease: FlxEase.cubeOut});
            FlxTween.tween(box , {x: box.x - 300}, 2, {ease: FlxEase.cubeOut});
            for(i in strumLines.members[2].members){
                FlxTween.tween(i, {alpha: 1}, Conductor.crochet / 600);
            }
            boxsepie.alpha = 1;
            bgsepie.alpha = 1;
            strumLines.members[2].characters[0].alpha = 1;
        case 440:
                FlxTween.tween(boxsepie, {y: -1500}, 3, {ease:FlxEase.cubeOut});
                FlxTween.tween(bgsepie, {y: -1500}, 3, {ease: FlxEase.cubeOut});
    
                FlxTween.tween(box2, {x: box2.x - 300}, 2, {ease: FlxEase.cubeIn});
                FlxTween.tween(box , {x: box.x + 300}, 2, {ease: FlxEase.cubeIn});
                for(i in strumLines.members[2].members){
                    FlxTween.tween(i, {alpha: 0}, Conductor.crochet / 600);
                }
        case 460:
            strumLines.members[1].characters[0].alpha = 0;
            strumLines.members[3].characters[0].alpha = 1;
            strumLines.members[3].characters[0].scale.set(1.3,1.3);
            bgannie.alpha = 1;
            bgmonka.alpha = 0;

            FlxTween.tween(bgmonka, {"scale.y": 1.3}, Conductor.crochet / 10000);
            FlxTween.tween(box, {"scale.y": 1.3}, Conductor.crochet / 10000);

            remove(iconP2);
            iconP2 = new HealthIcon("annie", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            insert(members.indexOf(iconP1) + 1, iconP2);
            healthBar.percent = health;            
            
            healthBar.createFilledBar(0xFFff0000, 0xFF0098ff);    

        case 844:
            strumLines.members[3].characters[0].alpha = 0;
            strumLines.members[4].characters[0].alpha = 1;
            bgannie.alpha = 0;
            bgabbie.alpha = 1;

            healthBar.createFilledBar(0xFFff80ff, 0xFF0098ff);    
            healthBar.percent = health;            

            remove(iconP2);
            iconP2 = new HealthIcon("lucian", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            insert(members.indexOf(iconP1) + 1, iconP2);
            
            FlxTween.tween(bgmonka, {"scale.y": 1.3}, Conductor.crochet / 10000);
            FlxTween.tween(bgabbie, {"scale.y": 1.5}, Conductor.crochet / 10000);
            FlxTween.tween(box, {"scale.y": 1.5}, Conductor.crochet / 10000);


        case 1228:
            strumLines.members[4].characters[0].alpha = 0;
            strumLines.members[5].characters[0].alpha = 1;
            bgannie.alpha = 0;
            bggif.alpha = 1;
            healthBar.createFilledBar(0xFFff1ac6, 0xFF0098ff);    
            healthBar.percent = health;            
            bgabbie.alpha = 0;
            remove(iconP2);
            FlxTween.tween(box, {"scale.y": 1.5}, Conductor.crochet / 10000);
            bgmonka.alpha = 0;
            iconP2 = new HealthIcon("gifnormal", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            insert(members.indexOf(iconP1) + 1, iconP2);
            bggif.y += 20;
            FlxTween.tween(bggif, {"scale.y": 1.45  }, Conductor.crochet / 10000);
            for(eee in [bgmonka, bgabbie, bgannie, bgsereal]){ eee.alpha = 0;}

        case 1360:
            FlxTween.tween(strumLines.members[5].characters[0], {alpha: 0}, 6);
            FlxTween.tween(strumLines.members[5].characters[1], {alpha: 1}, 6);
            FlxTween.tween(HomeStatic, {alpha: 0.6}, 16 / vocals.pitch);
            FlxTween.color(bgback, 16.0, 0xFFFFFFFF, 0xFF111111);
            FlxTween.color(bgback2, 16.0, 0xFFFFFFFF, 0xFF111111);
            FlxTween.color(bg0, 16.0, 0xFFFFFFFF, 0xFF111111);
            FlxTween.color(bggif, 16.0, 0xFFFFFFFF, 0xFF111111);
            FlxTween.color(box, 16.0, 0xFFFFFFFF, 0xFF111111);
            FlxTween.color(box2, 16.0, 0xFFFFFFFF, 0xFF111111);
            for(eee in [bg, bgmonka, bgabbie, bgannie, bgsereal]){ eee.alpha = 0;}
             
            // bggif.alpha = 0;
            // box.alpha = 0;

        case 1484:
            strumLines.members[5].characters[1].alpha = 0;
            strumLines.members[5].characters[0].alpha = 1;
            HomeStatic.alpha = 0;
            bgback.color = 0xFFFFFFFF;
            bgback2.color = 0xFFFFFFFF;
            bg0.color = 0xFFFFFFFF;
            bggif.color = 0xFFFFFFFF;
            box.color = 0xFFFFFFFF;
            box2.color = 0xFFFFFFFF;
            // box.color = 0xFFFFFFFF;
        case 1612:
            strumLines.members[5].characters[0].alpha = 0;
            strumLines.members[6].characters[0].alpha = 1;
            bggif.alpha = 0;
            bgsereal.alpha = 1;
            healthBar.createFilledBar(0xFFea9361, 0xFF0098ff);    
            healthBar.percent = health;            
            FlxTween.tween(box, {"scale.y": 1.3}, Conductor.crochet / 10000);
            // FlxTween.tween(box, {"scale.y": 1.5}, Conductor.crochet / 10000);
            bgabbie.alpha = 0;

            remove(iconP2);
            iconP2 = new HealthIcon("sepie", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            insert(members.indexOf(iconP1) + 1, iconP2);
            


        case 1876:
            strumLines.members[6].characters[0].alpha = 0;
            strumLines.members[1].characters[0].alpha = 1;
            bgsereal.alpha = 0;
            
            bgmonka.alpha = 1;
            bgabbie.alpha = 0;
            bgsepie.alpha = 0;
            strumLines.members[2].characters[0].alpha = 0;

            healthBar.createFilledBar(0xFF8cd465, 0xFF0098ff);    

            remove(iconP2);
            iconP2 = new HealthIcon("alastor", false);
            iconP2.cameras = [camHUD];
            iconP2.y = healthBar.y - 75;
            iconP2.x = iconP2;
            insert(members.indexOf(iconP1) + 1, iconP2);
            healthBar.createFilledBar(0xFF8cd465, 0xFF0098ff);    
            healthBar.percent = health;            
            FlxTween.tween(bgmonka, {"scale.y": 1.55}, Conductor.crochet / 10000);
            FlxTween.tween(box, {"scale.y": 1.55}, Conductor.crochet / 10000);
            


        case 2234:
            FlxTween.tween(FlxG.camera, {zoom: 0.4}, 6, {ease: FlxEase.quadInOut});
            FlxTween.tween(camobj, {y: -3000}, 6, {ease: FlxEase.quadInOut});
            boxsepie.scale.set(0.001,0.001);


        case 2264:

            FlxTween.tween(healthBar, {alpha: 0}, 0.6);
            FlxTween.tween(healthBarBG, {alpha: 0}, 0.6);
            
            FlxTween.tween(iconP1, {alpha: 0}, 0.6);

            FlxTween.tween(iconP2, {alpha: 0}, 0.6);
           
            
            strumLines.members[2].members[0].alpha = 0;
            strumLines.members[2].members[1].alpha = 0;
            strumLines.members[2].members[2].alpha = 0;
            strumLines.members[2].members[3].alpha = 0;
            
            strumLines.members[3].members[0].alpha = 0;
            strumLines.members[3].members[1].alpha = 0;
            strumLines.members[3].members[2].alpha = 0;
            strumLines.members[3].members[3].alpha = 0;
            
            strumLines.members[4].members[0].alpha = 0;
            strumLines.members[4].members[1].alpha = 0;
            strumLines.members[4].members[2].alpha = 0;
            strumLines.members[4].members[3].alpha = 0;
            
            strumLines.members[5].members[0].alpha = 0;
            strumLines.members[5].members[1].alpha = 0;
            strumLines.members[5].members[2].alpha = 0;
            strumLines.members[5].members[3].alpha = 0;
            
            strumLines.members[6].members[0].alpha = 0;
            strumLines.members[6].members[1].alpha = 0;
            strumLines.members[6].members[2].alpha = 0;
            strumLines.members[6].members[3].alpha = 0;
            FlxTween.tween(strumLines.members[0].members[0], {alpha: 0}, 0.6);
            FlxTween.tween(strumLines.members[0].members[1], {alpha: 0}, 0.6);
            FlxTween.tween(strumLines.members[0].members[2], {alpha: 0}, 0.6);
            FlxTween.tween(strumLines.members[0].members[3], {alpha: 0}, 0.6);
            
            
            FlxTween.tween(strumLines.members[1].members[0], {alpha: 0}, 0.6);
            FlxTween.tween(strumLines.members[1].members[1], {alpha: 0}, 0.6);
            FlxTween.tween(strumLines.members[1].members[2], {alpha: 0}, 0.6);
            FlxTween.tween(strumLines.members[1].members[3], {alpha: 0}, 0.6);
        case 2276:
                    FlxTween.tween(dokiLogo, {alpha: 1}, 2);
            
        case 2328:
                  FlxTween.tween(dokiLogo, {alpha: 0}, 0.5);
        case 2391:
                
            FlxTween.tween(bgback, {alpha: 0}, 0.01);
            FlxTween.tween(bgback2, {alpha: 0}, 0.01);

            FlxTween.tween(abgback, {alpha: 1}, 0.01);
            
            FlxTween.tween(abgback2, {alpha: 1}, 0.01);
        case 2424:
            FlxTween.tween(abgback, {alpha: 0}, 0.1);
            
            FlxTween.tween(abgback2, {alpha: 0}, 0.1);

        }
}
