import flixel.util.FlxAxes;
import flixel.util.FlxColor;
// import flixel.text.FunkinText;
// import flixel.text.FunkinText;
var diaText:FunkinText;
var shader2:CustomShader;
function postCreate(){
    strumLines.members[1].characters[1].alpha = 0;  
    diaText = new FunkinText(0,100,500, "",40, true);
    diaText.screenCenter(FlxAxes.X);
    // diaText.x = camHUD.width / 2 - diaText.text.width;
    diaText.alignment = "center"; 
    diaText.borderSize = 4;
    diaText.cameras = [camHUD];
   
    add(diaText);

    // player.cpu = true;
    // uh = new FlxSprite().makeGraphic(1000,1000, 0xFF000000);
    // add(uh);
    trace("restart");
    // shader2 = new CustomShader("bruuh3");
    //     // FlxG.camera.addShader();
    //     uh.shader = shader2;
    //     shader2.iTime = 1;

}
function stepHit(curStep){
    // if(curStep == 118){
    switch(curStep){
        case 118, 1161:
            strumLines.members[0].characters[0].playAnim("talk");

        case 119, 121, 124:
            strumLines.members[0].characters[0].playAnim("speak", true);
        case 832, 834, 844, 848, 851, 853, 856, 860, 870, 874, 876, 884, 887, 891, 892:
            strumLines.members[0].characters[0].playAnim("speak", true);
        case 1165, 1165, 1169, 1172:
            strumLines.members[0].characters[0].playAnim("speak", true);
        case 1184:
            strumLines.members[1].characters[1].alpha = 1;
            strumLines.members[1].characters[0].alpha = 0;


    }
    switch(curStep){
        case 118:
            diaText.text = "your";

            diaText.screenCenter(FlxAxes.X);    
        case 119:
            diaText.text = "your groun";

            diaText.screenCenter(FlxAxes.X);    
        case 124:
            diaText.text = "your grounded";

            diaText.screenCenter(FlxAxes.X);     
        case 128:
            diaText.text = "";
        case 832:
            diaText.text = "caillou";
        case 844:
            diaText.text = "how";
        case 847:
            diaText.text = "how dare";
        case 849:
            diaText.text = "how dare you";
        case 850:
            diaText.text = "how dare you steal";
        case 857:
            diaText.text = "how dare you steal my";
        case 859:
            diaText.text = "how dare you steal my turn";
        case 864:
            diaText.text = "";
        case 869:
            diaText.text = "that is so it";
        case 883:
            diaText.text = "you are grounded for:";

        // case 896, 952, 1020:
        //     diaText.text = "6";        
        // case 900, 902, 964, 965, 980, 981, 1088, 1089, 1090, 1102, 1104,1105,1106, 1118, 1120,1121,1122:
        //     if(diaText.text == "6" || diaText.text == "7" || diaText.text = "0") diaText.text = "";
        //     diaText.text = diaText.text + "8";
        // case 1044, 1134:
        //     diaText.text = "8";
        // case 904, 942, 1148:
        //     diaText.text = "1";
        // case 906, 941, 1026, 1008, 1034, 1096, 1112, 1128, 1146:
        //     diaText.text = "2";        
        // case 908, 957, 1040:
        //     diaText.text = "9";
        // case 912, 914, 915, 916, 934,935, 937:
        //     if(diaText.text == "9" && diaText.text == "3") diaText.text = "";
        //     diaText.text = diaText.text + "1";
        // case 920, 960, 966,  976, 982, 1016, 1048, 176:
        //     diaText.text = "7";
        // case 924, 944, 972, 988, 1012,  1028, 1080, 1092, 1098, 1108, 1104, 1124, 1130:
        //     diaText.text = "0";
        // case 928, 1052:
        //     diaText.text = "Y";
        // case 930, 1024, 1072, 1140:
        //     diaText.text = "4";
        // case 932, 938, 1144:
        //     diaText.text = "3";
        // case 948,949,950:
        //     if(diaText.text == "0") diaText.text = "";
        //     diaText.text = diaText.text + "7";
        // case 970, 986, 992, 1032, 1084: 
        //     diaText.text = "1";
        // case 971, 987, 995, 1033:
        //     diaText.text = "11";
        // case 998:
        //     diaText.text = "111";
        // case 1000:
        //     diaText.text = "3";
        // case 1004:
        //     diaText.text = "33";
        // case 1009, 1010, 1036, 1037:
        //     diaText.text = diaText.text + "2";
        // case 1038:
        //     diaText.text = "o";
        // case 1056, 1075, 1078, 1082, 1086:
        //     diaText.text = "6";
        // case 1063, 1068:
        //     diaText.text = diaText.text + "6";

        // case 1140:
        //     diaText.text = "5";

  

        case 895:
            diaText.text = "";
            trace(curStep, diaText.text);
        case 928, 1052:
            diaText.text = diaText.text + "Y";
        case 1038:
            diaText.text = diaText.text + "O";
        case 924, 940, 944, 970, 987, 1012, 1028, 1092, 1098, 1108, 1130:
            diaText.text = diaText.text + "0"; 
       
            trace(curStep, "0");
        case 904,  912, 914, 915, 916,  942, 970, 971, 986, 987,  992, 995, 998, 1032, 1033,    1080,    1114, 1124:
            diaText.text = diaText.text + "1"; 

            trace(curStep, "1");
        case 906, 1008, 1009, 1010, 1026, 1034, 1036, 1037, 1084, 1112:
            diaText.text = diaText.text + "2";
            
            trace(curStep, "2"); 
        case 932, 938, 1000, 1004, 1096, 1128:
            diaText.text = diaText.text + "3"; 

            trace(curStep, "3");
        case 930,  934, 935, 936, 937, 1024, 1072:
            diaText.text = diaText.text + "4"; 

            trace(curStep,"4");
        case 896, 952, 964, 965, 980, 981, 1020, 1056, 1062, 1068, 1074, 1078:
            diaText.text = diaText.text + "6";
    
            trace(curStep, "6"); 
        case 920, 948, 949,950,960, 966,  982, 976, 1016, 1048, 1076, 1082, 1086  :
            diaText.text = diaText.text + "7"; 

            trace(curStep, "7");
        case 900, 902, 1044, 1088,1089,1090, 1102, 1104,1105,1106, 1118, 1120,1121,1122, 1134:
            diaText.text = diaText.text + "8";

            trace(curStep, "8");
        case 908, 956, 1040:
            diaText.text = diaText.text + "9"; 

            trace(curStep, "9");

        case 1136:
            diaText.text = "5";
        case 1140:
            diaText.text = "4";
        case 1144:
            diaText.text = "3";
        case 1146:
            diaText.text = "2";
        case 1148:
            diaText.text = "1";
        case 1160:
            diaText.text = "go";
        case 1165:
            diaText.text = "go to your";
        case 1168:
            diaText.text = "go to your room";
        case 1173:
            diaText.text = "go to your room NOW";
        case 1180:
            diaText.text = "";

    }
    
}

function update(elapsed){
    diaText.x = healthBar.x + healthBar.width / 3;
    // shader2.iTime += elapsed / 2;
}

// function postUpdate(){
//     for( i in [vocals, inst]){
//         i.pitch = 0.9;
//     }
// }