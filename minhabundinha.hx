var bundinhapreta:CustomShader;
function postCreate(){
    bundinhapreta = new CustomShader("adjustColor");
    bundinhapreta.saturation = -100;
    bundinhapreta.contrast = 700;
    // bundinhapreta.brightness = 100;
    // bundinhapreta.hue = 0;
    camGame.addShader(bundinhapreta);
    camHUD.addShader(bundinhapreta);
}
var buceta = false;
function cinzad(){
    switch(buceta){
        case false:

            camGame.addShader(bundinhapreta);
            camHUD.addShader(bundinhapreta);

        case true:
            camGame.removeShader(bundinhapreta);
            camHUD.removeShader(bundinhapreta);

    }
    buceta = !buceta;
}