import funkin.backend.utils.WindowUtils;
import openfl.Lib;
import lime.graphics.Image;

static var redirectStates:Map<FlxState, String> = [
    FreeplayState => "fp/Freeplay",
];

function preStateSwitch() {

    for (redirectState in redirectStates.keys())
        if (FlxG.game._requestedState is redirectState)
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
}


public function testshit(){
    trace("raluca");
}
