// import flixel.addons.ui.FlxUI;
import lime.utils.Assets;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
var fileCheckIMG:Array = ["alphabet", "test/merda", "test/merda2"];
var fileCheckCHARS:Array = ["dadd", "momm", "sepie"];
function create(){
    FlxG.save.data.insubs = false;

    trace(FlxG.save.data.portraitmode);
    
}
function postCreate(){
        bg.scrollFactor.set(0,0.1);
        magenta.scrollFactor.set(0,0.1);
    for(i in 0...menuItems.length){
        menuItems.members[i].scrollFactor.set(0,0.6);
    }
}
function update(){
    
    if(FlxG.keys.justPressed.Z){
        FlxG.switchState(new ModState("qwe/TestStoryState"));
         
    }
    if(FlxG.keys.justPressed.X){
        FlxG.switchState(new ModState("qwe/TestCreditState"));
         
    }
    if(FlxG.keys.justPressed.C){
        FlxG.switchState(new ModState("qwe/WDState"));
         
    }
    
    // if(FlxG.keys.justPressed.V){
    //     FlxG.switchState(new ModState("BruFP"));
         
    // }

    // if(FlxG.keys.justPressed.Q){
    //     FlxG.switchState(new ModState("ScrSwitch"));
    // }
    // if(FlxG.keys.justPressed.R){
    //     var nonExistantImages:Array = [];
    //     var nonExistantChars:Array = [];
        
    //     for(i in fileCheckIMG){
    //         if(!Assets.exists(Paths.image(i))){
    //             nonExistantImages.push(i);
    //         }
    //     }
    //     for(i in fileCheckCHARS){
    //         if(!Assets.exists(Paths.character(i))){
    //             nonExistantChars.push(i);
    //         }
    //     }
    //     // trace(nonExistantImages);
    //     FlxG.save.data.missingAssetsIMG = nonExistantImages;
    //     FlxG.save.data.missingAssetsCHARS = nonExistantChars;
    //     FlxG.save.data.missingAssetsY = -100;
    //     FlxG.save.data.insubs = true;

    //     FlxG.switchState(new ModState("MissingAssets"));
    //     FlxG.save.data.WarningLastState = "MainMenuState";
    // }
}

function onChangeItem(){
    camFollow.y = menuItems[curSelected];
}

function onSelectItem(event){
    if(event.name == "raluca"){
        FlxG.switchState(new ModState("dailyRaluxa"));
    }
}