function postCreate(){
	strumLines.members[0].characters[0].scale.set(0.8,0.8);
	strumLines.members[0].characters[1].scale.set(0.86,0.86);
	strumLines.members[0].characters[1].alpha = 0;
	strumLines.members[1].characters[0].scale.set(0.7,0.7);
    for(i in [zardy_bg, zardy_fevertown, zardy_foreground, rockysky, rockymountains, alleyway, sky, boardwalk, stagefront, stagecurtains, diner, bg_taki, taki_gf, matt_spotlight, matt_bg, matt_crowd, matt_foreground]){
		i.visible = false;
	}
	// strumLines.members[1].cpu = true;
	vocals.pitch = 1;
	inst.pitch = 1;

trace(boyfriend.cameraOffset.x, boyfriend.cameraOffset.y);
boyfriend.cameraOffset = FlxPoint.weak(-60,0);
strumLines.members[0].characters[1].x = strumLines.members[0].characters[0].x + 100; 
strumLines.members[0].characters[1].y = strumLines.members[0].characters[1].y + 70;

}
var volcanoUsed:Bool = false;
var dockUsed:Bool = false;
var dinerUsed:Bool = false;

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


}
function resetCamera(){
	FlxG.camera.zoom = 0.75;
	defaultCamZoom = 0.75;

	strumLines.members[0].characters[1].alpha = 0;
	strumLines.members[0].characters[0].alpha = 1;

}
function addPixels(){
	importScript('data/scripts/pixelCam');

}
function goback(){
	resetStage();
	resetCamera();
	// for(i in [ROBO_BG_SKY, ROBO_BG, ROBO_BG_CITY, ROBO_BG_WIRES]){
		ROBO_BG.visible = true;
	// }
}

function gotoMaze(){
	resetStage();
	for(e in [zardy_bg, zardy_fevertown, zardy_foreground]){
		e.visible = true;
		e.scale.set(0.7,0.7);
		e.y += 50;
	}
	FlxG.camera.zoom = 1;
	defaultCamZoom = 1.3;

}

function gotoVolcano(){
    resetStage();
    for(i in [rockysky, rockymountains]){
		i.visible = true;
		i.scale.set(0.5,0.5);
		i.x = -300;
        i.y = 30;

	}
	FlxG.camera.zoom = 1.2;
	defaultCamZoom = 1.2;
    dad.cameraOffset = FlxPoint.weak(200,0);

}

function gotoAlley(){
   resetStage();

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
		i.x = -50;
		i.y = 50;
		dockUsed = true;
	}
	boyfriend.cameraOffset = FlxPoint.weak(-100,0);


}

function gotoRoom(){
	resetStage();
	for(i in [stagecurtains, stagefront]){
		i.visible = true;
	    i.scale.set(0.7,0.7);
	}
    stagefront.x = -400;
	stagecurtains.x = -200;
	stagecurtains.y = -50;
	zardy_fevertown.visible = true;
    stagefront.y = 710;
	
	FlxG.camera.zoom = 1.3;
	defaultCamZoom = 1.3;
// trace(stagefront.x, stagefront.y);
boyfriend.cameraOffset = FlxPoint.weak(-60,0);

}
function goLunch(){
	resetStage();
	diner.visible = true;
	diner.scale.set(0.5,0.5);
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
		i.x += 10;
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
		i.x = 0;
		i.y = 150;
			
		FlxG.camera.zoom = 1.34;
		defaultCamZoom = 1.34;
	}
	strumLines.members[0].characters[1].alpha = 1;
	strumLines.members[0].characters[0].alpha = 0;
	boyfriend.cameraOffset = FlxPoint.weak(-60,0);

	
}