import funkin.game.HudCamera;
import funkin.backend.scripting.events.NoteHitEvent;

public var enableCameraHacks = true;


var oldStageQuality = FlxG.game.stage.quality;
static var daPixelZoom = 6;
var disableshit:Bool = false;
/**
 * CAMERA HACKS!!
 */
public function addPixel() {

	if (enableCameraHacks) {
		camGame.pixelPerfectRender = true;
		camGame.antialiasing = false;

		makeCameraPixely(camGame);
		defaultCamZoom /= daPixelZoom;
	}

	iconP1.antialiasing = false;
	iconP2.antialiasing = false;

	if (enablePixelGameOver) {
		gameOverSong = "pixel/gameOver";
		lossSFX = "pixel/gameOverSFX";
		retrySFX = "pixel/gameOverEnd";
	}
}


/**
 * Use this to make any camera pixelly (you wont be able to zoom with it anymore!)
 */
 var shad = new CustomShader('pixelZoomShader');
	
 public function makeCameraPixely(cam) {
	cam.pixelPerfectRender = true;
	if(!enableCameraHacks) return;

	cam.zoom /= Math.min(FlxG.scaleMode.scale.x, FlxG.scaleMode.scale.y) * daPixelZoom;

    cam.addShader(shad);

	pixellyCameras.push(cam);
	pixellyShaders.push(shad);

	FlxG.game.stage.quality = 2;
}


function pixelCam(cam) {
	makeCameraPixely(cam);
}

var pixellyCameras = [];
var pixellyShaders = [];

function postUpdate(elapsed) {
	if(disableshit == false){
      makethatShit();
	  trace("AA");
	}
    
}
function makethatShit(){
	
	for(e in pixellyCameras) {
		if (Std.isOfType(e, HudCamera))
			e.downscroll = camHUD.downscroll;
	}
	if (enableCameraHacks) {
		for(p in strumLines)
			p.notes.forEach(function(n) {
				n.y -= n.y % daPixelZoom;
				n.x -= n.x % daPixelZoom;
			});
	}

	for(e in pixellyCameras) {
		if (!e.exists) continue;
		e.zoom = 1 / daPixelZoom / Math.min(FlxG.scaleMode.scale.x, FlxG.scaleMode.scale.y);
	}
	for(e in pixellyShaders) {
		e.pixelZoom = 1 / daPixelZoom / Math.min(FlxG.scaleMode.scale.x, FlxG.scaleMode.scale.y);
	}
}
public function destroyShaderSHit() {
	// resets the stage quality
	FlxG.game.stage.quality = oldStageQuality;
    // camGame.shader.destroy();
    // remove(shad);
	camGame.removeShader();
}


