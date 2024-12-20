// <!DOCTYPE codename-engine-stage>
// <stage folder="stages/gears/" zoom="1.05">
// 	<gf new FlxBackdrop().loadGraphic="0"/>
// 	<sprite x="-1246" y="-502" sprite="sky" name="sky"/>
// 	<sprite x="-1042" y="577" sprite="train" name="train"/>
// 	<sprite x="-1098" y="530" sprite="trainGlow" name="trainGlow"/>
// 	<sprite x="-1047" y="462" sprite="death" name="death">
// 		<anim x="0" loop="false" y="0" fps="24" anim="Train be like" type="none" name="death"/>
// 	</sprite>
// 	<dad x="-439" y="-233"/>
// 	<bf x="262" y="-212"/>
// 	<combo x="1286" y="-97"/>
// </stage>


import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxAxes;
var buildings1:FlxBackdrop;
var buildings2:FlxBackdrop;
var buildings3:FlxBackdrop;

var jean:Character;
var eggmob:FlxSprite;
var sergei:FlxSprite;
function postCreate(){

	// strumLines.members[1].cpu = true;
	buildings1 = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/furthestBuildings'), 0, 0);
	buildings1.antialiasing = true;
	buildings1.scrollFactor.set(0.9, 0.9);
	buildings1.origin.set(0, 0);
	buildings1.setGraphicSize(Std.int(buildings1.width * 1.75));
	buildings1.updateHitbox();
	buildings1.y -= 180;
	buildings1.x -= 600;

	buildings2 = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/middleBuildings'), 0, 0);
	buildings2.antialiasing = true;
	buildings2.scrollFactor.set(0.9, 0.9);
	buildings2.origin.set(0, 0);
	buildings2.setGraphicSize(Std.int(buildings2.width * 1.75));
	buildings2.updateHitbox();
	buildings2.y -= 350;
	buildings2.x -= 600;

	buildings3 = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/frontBuildings'), 0, 0);
	buildings3.antialiasing = true;
	buildings3.scrollFactor.set(0.9, 0.9);
	buildings3.origin.set(0, 0);
	buildings3.setGraphicSize(Std.int(buildings3.width * 1.75));
	buildings3.updateHitbox();
	buildings3.y -= 750;
	buildings3.x -= 600;
	
	tunnelBG = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/tunnel'));
	tunnelBG.antialiasing = true;
	tunnelBG.y -= 950;
	tunnelBG.setGraphicSize(Std.int(tunnelBG.width * 1.15));
	tunnelBG.color = 0xFFA672B2;

	ftunnelBG = new FlxSprite().loadGraphic(Paths.image('stages/gears/tunnel'));
	ftunnelBG.antialiasing = true;
	ftunnelBG.y -= 950;
	ftunnelBG.x = 6000;
	tunnelEnterance.x = 3200;
	ftunnelBG.setGraphicSize(Std.int(tunnelBG.width * 1.15));
	ftunnelBG.color = 0xFFA672B2;
	ftunnelBG.scale.x = 2;
	ftunnelBG.updateHitbox();
	// add(ftunnelBG);
	insert(members.indexOf(tunnelEnterance) - 1, ftunnelBG);
	// add(tunnelBG);
	
	
	lights = new FlxBackdrop().loadGraphic(Paths.image('stages/gears/lights'));
	lights.antialiasing = true;
	lights.y -= 400;
	lights.scale.set(1.2,1.2);
	lights.setGraphicSize(Std.int(lights.width * 1.6));
	// add(lights);F
		insert(members.indexOf(tunnelBG) + 1, ftunnelBG);

	buildings1.repeatAxes = FlxAxes.X;
	buildings2.repeatAxes = FlxAxes.X;
	buildings3.repeatAxes = FlxAxes.X;
	tunnelBG.repeatAxes = FlxAxes.X;
	lights.repeatAxes = FlxAxes.X;
	tunnelBG.spacing.x = 0;
	
	var dddd:Int = 0;
	for(i in [buildings1,buildings2,buildings3]){
		insert(members.indexOf(sky) + 1 + dddd, i);
		
		i.velocity.x = -2000 * dddd;
		dddd += 1;
	}	
	var eeee:Int = 0;

	for(i in [tunnelBG,lights]){
		i.scale.set(1,1);
		insert(members.indexOf(trainGlow), i);
		i.velocity.x = -9000;

		i.visible = false;
		
	}

	
	for(i in [trainGlow, death]){
		i.visible = false;
	}

	boyfriend.cameraOffset = FlxPoint.weak(-400,100);
	dad.cameraOffset = FlxPoint.weak(240,100);
		eggmob = new FlxSprite().loadGraphic(Paths.image("stages/prey/eggmobile"));
		
		jean = new Character(0,0,	"jeanL", false);
		jean.x = boyfriend.x - 800;
		jean.y = boyfriend.y + 800;
		jean.scale.set(0.6,0.6);
		eggmob.x = jean.x + 350;
		eggmob.y = jean.y + 580;
		eggmob.scale.set(1.4,1.4);
				insert(members.indexOf(boyfriend) - 1, jean);
		insert(members.indexOf(boyfriend) - 1, eggmob);

		fallBG.alpha = 0;
		streaks.alpha = 0;

	backBuildings = new FlxBackdrop(Paths.image('stages/gears/flyBGBehind'), 0, 0);
	backBuildings.antialiasing = true;
	backBuildings.scrollFactor.set(0.9, 0.9);
	backBuildings.origin.set(0, 0);
	backBuildings.scale.set(2.5, 2.5);
	// add(backBuildings);
	backBuildings.alpha = 0.0000000009;

	buildings = new FlxBackdrop(Paths.image('stages/gears/flyBG'), 0, 0);
	buildings.repeatAxes = FlxAxes.X;
	backBuildings.repeatAxes = FlxAxes.X;
	buildings.antialiasing = true;
	buildings.scrollFactor.set(0.9, 0.9);
	buildings.origin.set(0, 0);
	buildings.scale.set(2.5, 2.5);
	// buildings.y -= 1200;
	// buildings.x -= 600;
	// add(buildings);
	buildings.alpha = 0.0000000009;
	insert(members.indexOf(dad) - 2, backBuildings);
	insert(members.indexOf(dad) - 1, buildings);

	if(dad.curCharacter == "wrench")
{
	dad.scale.set(0.5,0.5);
	boyfriend.scale.set(0.5,0.5);

	dad.y -= 60;
	dad.x -= 570;
	boyfriend.y -= 50;
	boyfriend.x -= 300;

    jean.alpha = 0;
	eggmob.alpha = 0;

	sergei = new FlxSprite().loadGraphic(Paths.image("stages/sergei"));
	// add(sergei);
	insert(members.indexOf(dad)-1, sergei);	
	sergei.alpha = 0;

}
}
function beatHit(curBeat){
	switch(curBeat){
		case 205:
			enterTunnel();
		case 271:
			exitTunnel();
		case 420:
		shootTrain();
		case 555:
			FlxTween.tween(jean, {x:boyfriend.x,y:boyfriend.y}, 0.2, {onComplete: function(dd:FlxTween){

				FlxTween.tween(jean, {x:boyfriend.x + 800,y:boyfriend.y - 800}, 0.2);
				FlxTween.tween(boyfriend, {x:boyfriend.x + 800,y:boyfriend.y - 800}, 0.2);
				
				FlxTween.tween(dad, {x:dad.x + 1200,y:dad.y - 1200}, 0.2, {startDelay: 0.5, onComplete: function(ee:FlxTween){
						FlxG.camera.fade(0xFF000000, 0.3,false);

						new FlxTimer().start(0.5, function(tmr:FlxTimer){
						FlxG.camera.fade(0xFF000000, 0.3,true);

			fallBG.alpha = 0;
			streaks.alpha = 0;
			camGame.zoom -= 0.5;	
			defaultCamZoom -= 0.5;
			falling = false;
			backBuildings.alpha = 1;
			buildings.alpha = 1;

			buildings1.alpha = 0;
			buildings2.alpha = 0;
			buildings3.alpha = 0;

			buildings.scale.set(1,1);
			backBuildings.scale.set(0.97,0.97);

			sky.scale.set(1.2,1.2);
			buildings.velocity.x = -5000;
			backBuildings.velocity.x = -4930;
			train.visible = false;

			dad.scale.set(1,1);
	boyfriend.cameraOffset = FlxPoint.weak(-400,260);
	dad.cameraOffset = FlxPoint.weak(240,100);

			// sky.scale.set(0.6,0.6);
			dad.angle = 0;
			
			// dad.y -= 300;
			boyfriend.y -= 300;
			dad.x -= 500;
			boyfriend.scale.set(1,1);
			jean.scale.set(0.8,0.8);
			eggmob.scale.set(1.8,1.8);
			eggmob.y -= 160;
			jean.y -= 300;
			sky.y -= 1000;
			
	eggmob.alpha = 0;
	
	sergei.scale.set(0.9,0.7);

	dad.scale.set(0.5,0.5);
	boyfriend.scale.set(0.5,0.5);
	sergei.alpha = 1;
	
	sergei.x = dad.x + 40;
	sergei.y = dad.y + 490;

	boyfriend.x = dad.x + 500;
	boyfriend.y -= sergei.y + 1000;

			
						});

				}});
			}});
	}
}


function enterTunnel(){
	FlxTween.tween(tunnelEnterance, {x: tunnelEnterance.x - 7000}, 0.3);
	FlxTween.tween(ftunnelBG, {x:  ftunnelBG.x - 7000}, 0.3, {
		onComplete: function(t)
		{
			for(i in [tunnelEnterance, ftunnelBG]){
				FlxTween.tween(i, {alpha:0}, 0.2);
			}


	train.visible = false;
	trainGlow.visible = true;
	lights.visible = true;
	tunnelBG.visible = true;
	for(i in [buildings1,buildings2,buildings3]){
		i.visible = false;
	}
		}});
}

function exitTunnel(){
	
			for(i in [tunnelEnterance, ftunnelBG]){
				FlxTween.tween(i, {alpha:1}, 0.2);
			}

			tunnelEnterance.x += ftunnelBG.width;

	FlxTween.tween(tunnelEnterance, {x: tunnelEnterance.x - 7000}, 0.3);
	FlxTween.tween(ftunnelBG, {x:  ftunnelBG.x - 7000}, 0.3, {
		onComplete: function(t)
		{
			for(i in [tunnelEnterance, ftunnelBG]){
				FlxTween.tween(i, {alpha:0}, 0.2);
			}


	train.visible = true;
	trainGlow.visible = false;
	lights.visible = false;
	tunnelBG.visible = false;
	for(i in [buildings1,buildings2,buildings3]){
		i.visible = true;
	}
		}});

				
}
var falling:Bool = false;
function shootTrain(){
	FlxG.camera.fade(0xFF000000, 0.3,false);


	new FlxTimer().start(2.4, function(tmr:FlxTimer){
	camGame.zoom += 0.5;
	FlxG.camera.fade(0xFF000000, 1, true);

	defaultCamZoom += 0.5;
train.visible = false;

	dad.x += 70;
	dad.y += 200;
	dad.scale.set(1.7,1.7);
	dad.angle = 20;

	boyfriend.scale.set(0.8,0.8);
	
		falling = true;


				FlxTween.tween(fallBG, {"scale.x": 2.5, "scale.y": 2.5}, 29);

		fallBG.alpha = 1;
		streaks.alpha = 1;
	});

}


function postUpdate(){
	if(falling == true){
		camFollow.setPosition(fallBG.x + 800,fallBG.y + 500);
		eggmob.x = jean.x + 350;
		eggmob.y = jean.y + 580;
		if(dad.curCharacter == "wrench"){



		}
	}

	backBuildings.y = boyfriend.y + 100;
	buildings.y = boyfriend.y + 100;
	buildings.spacing.x = 1000;
	
		if(dad.curCharacter == "wrench" && falling == false){
			
	eggmob.alpha = 0;
			switch(curCameraTarget){
				case 0:
					camFollow.setPosition(dad.x + 1200,dad.y + 600);
				case 1:
					camFollow.setPosition(boyfriend.x+ 500,boyfriend.y + 500);

			}
		}

}