import flixel.addons.display.FlxBackdrop;

var backdropshit:FlxBackdrop;
function create(){
    backdropshit = new FlxBackdrop(Paths.image('editors/bgs/charter'));
    // add(backdropshit);
    insert(1, backdropshit);

}
function postCreate(){
    logo.screenCenter();
}
function beatHit(){
    if(curBeat % 2 == 0)
    backdropshit.zoom = 1.2;
}
var enterp = false;
function update(){

    backdropshit.zoom = FlxMath.lerp(backdropshit.zoom, 1, 0.06);
}

