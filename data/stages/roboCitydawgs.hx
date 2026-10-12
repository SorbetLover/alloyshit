
var shader2:CustomShader;
function postCreate(){
	strumLines.members[0].characters[0].scale.set(0.46,0.46);
	strumLines.members[1].characters[0].scale.set(0.46,0.46);
    for(i in [zardy_bg, zardy_fevertown, zardy_foreground, rockysky, rockymountains, alleyway, sky, boardwalk, stagefront, stagecurtains, diner, bg_taki, taki_gf, matt_spotlight, matt_bg, matt_crowd, matt_foreground]){
		i.visible = false;
	}
	// strumLines.members[1].cpu = true;
	vocals.pitch = 1;
	inst.pitch = 1;

trace(boyfriend.cameraOffset.x, boyfriend.cameraOffset.y);
    // shader2 = new CustomShader("rgbeffect3");
    // FlxG.camera.addShader(shader2);

boyfriend.cameraOffset = FlxPoint.weak(-60,-50);
dad.x -= 400;
dad.y -= 100;
boyfriend.x -= 400;
boyfriend.y -= 140;
}
var volcanoUsed:Bool = false;
var dockUsed:Bool = false;
var dinerUsed:Bool = false;
//     var uhh = 0;

// function update(elapsed){
//     shader2.multi = uhh;
// }
function stepHit(curStep){
	
	switch(curStep){
      case 128: gotoMaze();
	  case 384: gotoVolcano();
	  case 512: gotoAlley();
	  case 576: gotoDock();
      case 640: goback();
	  case 896: gotoRoom();
	  case 1024: goLunch();
	  
	  case 1152: gotoDock();
	  case 1280:
		 goback();
      case 1420, 1422, 1436, 1438, 1548, 1550, 1564, 1566:
		 FlxG.camera.zoom += 0.2;
      case 1600:
		goPray();	
	  case 1728: goLunch();
	  case 1856: gotoVolcano();
	  case 1984: gotoRing();
	  case 2112: gotoRoom();
	  case 2368: goback();
	}
}
function resetStage(){
	FlxG.camera.fade(0xFFFFFFFF,Conductor.crochet / 1000,true);

	for(i in [zardy_bg, zardy_fevertown, zardy_foreground, rockysky, rockymountains, alleyway, sky, boardwalk, stagefront, stagecurtains, diner, bg_taki, taki_gf, matt_spotlight, matt_bg, matt_crowd, matt_foreground]){
		i.visible = false;
	}
	for(i in [ROBO_BG_SKY, ROBO_BG, ROBO_BG_CITY, ROBO_BG_WIRES]){
		i.visible = false;
	}

boyfriend.cameraOffset = FlxPoint.weak(-60,-50);

}
function resetCamera(){
	FlxG.camera.zoom = 0.75;
	defaultCamZoom = 0.75;
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);


}
function addPixels(){
	importScript('data/scripts/pixelCam');

}
function goback(){
	resetStage();
	resetCamera();
	for(i in [ROBO_BG_SKY, ROBO_BG, ROBO_BG_CITY, ROBO_BG_WIRES]){
		i.visible = true;
	}
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);
}

function gotoMaze(){
	resetStage();
	for(e in [zardy_bg, zardy_fevertown, zardy_foreground]){
		e.visible = true;
		e.scale.set(0.7,0.7);
		e.y += 200;
	}
	FlxG.camera.zoom = 1;
	defaultCamZoom = 1.3;
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);

}

function gotoVolcano(){
    resetStage();
    for(i in [rockysky, rockymountains]){
		i.visible = true;
		i.scale.set(0.5,0.5);
		i.x = -80;
        i.y = 30;

	}
	FlxG.camera.zoom = 1.2;
	defaultCamZoom = 1.2;
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);

}

function gotoAlley(){
   resetStage();
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);

   alleyway.scale.set(0.7,0.7);
   alleyway.x += 200;
   alleyway.y += 100;
   alleyway.visible = true;
}
function gotoDock(){
	resetStage();
	for(i in [boardwalk, sky]){
		i.visible = true;
		i.scale.set(0.6,0.6);
		i.x = 170;
		i.y = 50;
		dockUsed = true;
	}
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);

}

function gotoRoom(){
	resetStage();
	for(i in [stagecurtains, stagefront]){
		i.visible = true;
	    i.scale.set(0.7,0.7);
	}
    stagefront.x = -200;
	stagecurtains.x = 100;
	stagecurtains.y = -50;
	zardy_fevertown.visible = true;
    stagefront.y = 710;
	
	FlxG.camera.zoom = 1.3;
	defaultCamZoom = 1.3;

boyfriend.cameraOffset = FlxPoint.weak(-60,-50);
// trace(stagefront.x, stagefront.y);
}
function goLunch(){
	resetStage();
	diner.visible = true;
	diner.scale.set(0.5,0.5);
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);
   if(dinerUsed == false){
	diner.x += 150;
	diner.y += 170;
	dinerUsed = true;
   }
   FlxG.camera.zoom = 1.3;
   defaultCamZoom = 1.3;	
}
var praying:Bool = false;
function goPray(){
	praying = true;
	resetStage();
	for(i in [taki_gf, bg_taki]){
		i.visible = true;
		i.scale.set(0.7,0.7);
		i.x += 300;
		i.y += 100;
	}
	bg_taki.x += 50;
	taki_gf.y -= 40;
	taki_gf.x += 100;
    defaultCamZoom = 1;
	FlxG.camera.zoom = 0.8;
	taki_gf.scale.set(0.6,0.6);

}

function gotoRing(){
	resetStage();
	for(i in [matt_bg, matt_crowd, matt_foreground, matt_spotlight]){
		i.visible = true;
	    i.scale.set(0.6,0.6);
		i.x = 200;
		i.y = 130;
boyfriend.cameraOffset = FlxPoint.weak(-60,-50);

		FlxG.camera.zoom = 1.34;
		defaultCamZoom = 1.34;
	}
	
}