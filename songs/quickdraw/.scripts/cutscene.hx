// import funkin.game.HudCamera;
// import funkin.backend.scripting.events.NoteHitEvent;
// import flixel.tweens.FlxTween;
// import flixel.tweens.FlxEase;
// import flixel.util.FlxTimer;
// var shit:Bool = true;
// var bfy:Float;

// // var doalt:Bool = false;

// // function onEvent(event){
// //    if(event.name == "Alt Animation Toggle"){
// // 	  switch(doalt){
// // 		case true:
// // 			doalt = false;

// // 		case false:
// // 			doalt = true;
// // 	  }
// //    }
// // }
// static var _8bitIdleSuffix = "-alt";
// function update(){
// 	// switch(strumLines.members[0].altAnim){
// 		// case true:

// 	// }
// 	// strumLines.members[0].characters[1].alpha = 0;
// }
// function postCreate(){
// 	_8bitIdleSuffix = "-alt"; // reset	
//     if(PlayState.instance.difficulty == "hard"){
// 	bfy = boyfriend.y;
//     boyfriend.x += 600;
// 	} else {
// 		boyfriend.x = 400;
// 		boyfriend.y = 200;
// 		boyfriend.scale.set(5.7,5.7);
// 	}
// }
// function postUpdate(){
// 	if(PlayState.instance.difficulty == "hard" && shit == true){		
// 	for(e in strumLines.members[1].members){
// 		e.y = 1000;
// 	}
// 	for(r in strumLines.members[0].members){
// 		r.y  = 1000;
// 	}
//     }

// }
// function onStartCountdown(event){
//       if(PlayState.instance.difficulty == "hard"){
// 	  makebfshit = true;
//       event.cancel();
// 	  new FlxTimer().start(2, function(tmr:FlxTimer){
		
		
// 		FlxTween.tween(boyfriend, {x: boyfriend.x - 670}, 1.5, {ease: FlxEase.linear, startDelay: 0});

// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.001});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.101});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.201});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.301});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.401});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.501});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.601});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.701});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.801});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 0.91});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 1.001});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 1.101});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 1.201});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 1.301});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y += 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 1.401});
// 		FlxTween.tween(boyfriend, {y: boyfriend.y -= 15}, 0.05, {ease: FlxEase.cubeIn, startDelay: 1.501});

// 		new FlxTimer().start(1.7, function(tmr:FlxTimer){
// 			startCountdown();
// 			shit = false;
		
// 			FlxTween.tween(strumLines.members[0].members[0], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
// 			FlxTween.tween(strumLines.members[0].members[1], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
// 			FlxTween.tween(strumLines.members[0].members[2], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
// 			FlxTween.tween(strumLines.members[0].members[3], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
	
// 			FlxTween.tween(strumLines.members[1].members[0], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
// 			FlxTween.tween(strumLines.members[1].members[1], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
// 			FlxTween.tween(strumLines.members[1].members[2], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
// 			FlxTween.tween(strumLines.members[1].members[3], {y: 50}, 1, {ease: FlxEase.cubeOut, startDelay: 0.1});
	
// 		});
// 	   });
//    }
// }