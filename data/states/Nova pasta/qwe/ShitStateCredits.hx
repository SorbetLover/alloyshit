import flixel.addons.display.FlxBackdrop;
import flixel.util.FlxTimer;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.addons.display.FlxGridOverlay;
import funkin.game.HealthIcon;
import funkin.backend.Conductor;
import flixel.math.FlxPoint;
import funkin.menus.PauseSubState;
import flixel.FlxCamera;
import funkin.game.PlayState;
var group1:FlxText = "Atores";
var text1:FlxText = "Douglas Vidal - ";
var text2:FlxText = "Victor - ";
var text3:FlxText = "Andrei - ";

var group2:FlxText = "Entrevistadores";
var text4:FlxText = "Douglas Ferreira";
var text5:FlxText = "Pierry";

var group2:FlxText = "Programação das animações";
var text6:FlxText = "Toninho Burro";

var group3:FlxText = "Edição";
var text7:FlxText = "Anthony";

var group4:FlxText = "Edição de som";
var text8:FlxText = "Anthony";

var group5:FlxText = "Tratamento de cor";
var text9:FlxText = "Anthony";

var group6:FlxText = "Direção";
var text10:FlxText = "Douglas Ferreira";

var group7:FlxText = "Tratamento de áudio";
var text11:FlxText = "Anthony";

var group8:FlxText = "Edição de imagem";
var text12:FlxText = "Anthony";

var group9:FlxText = "Detalhes adicionais";
var text13:FlxText = "Anthony";

var group10:FlxText = "fiz com haxe esse negocio";
var text14:FlxText = "anthony cansado";

var group11:FlxText = "Chegou msg";
var text15:FlxText = "pra vc";



   "Atores";
"Douglas Vidal - ";
"Victor - ";
"Andrei - ";

    "Entrevistadores";
"Douglas Ferreira";
"Pierry";

    "Programação das animações";
"Toninho Burro";

    "Edição";
"Anthony";

    "Edição de som";
"Anthony";

    "Tratamento de cor";
"Anthony";

    "Direção";
"Douglas Ferreira";

    "Tratamento de áudio";
"Anthony";

    "Edição de imagem";
"Anthony";

    "Detalhes adicionais";
"Anthony";

    "fiz com haxe esse negocio";
"anthony cansado";

    "Chegou mensagem";
"pra vc";




var camGame:FlxCamera;
function create(){

group1 = new FlxText(0,0,1000, "Atores/Entrevistados", 60);
add(group1);
group1.screenCenter();

text1 = new FlxText(0,0, 800, "Douglas Vidal", 40);
add(text1);
text1.screenCenter();
text1.y = group1.y + 100;

text2 = new FlxText(0,0, 800, "Victor", 40);
add(text2);
text2.screenCenter();
text2.y = group1.y + 150;

text3 = new FlxText(0,0, 800, "Andrei", 40);
add(text3);
text3.screenCenter();
text3.y = group1.y + 200;

group2 = new FlxText(0,0,1000, "Entrevistadores", 60);
add(group2);
group2.screenCenter();
group2.y = group1.y + 300;

text4 = new FlxText(0,0, 800, "Douglas Ferreira", 40);
add(text4);
text4.screenCenter();
text4.y = group2.y + 100;

text5 = new FlxText(0,0, 800, "Pierry", 40);
add(text5);
text5.screenCenter();
text5.y = group2.y + 150;


group3 = new FlxText(0,0,1000, "Animações", 60);
add(group3);
group3.screenCenter();
group3.y = group2.y + 300;

text6 = new FlxText(0,0, 800, "Anthony sem graça", 40);
add(text6);
text6.screenCenter();
text6.y = group3.y + 100;

group4 = new FlxText(0,0,1000, "Edição", 60);
add(group4);
group4.screenCenter();
group4.y = group3.y + 300;

text7 = new FlxText(0,0, 800, "Antonelo sem sono", 40);
add(text7);
text7.screenCenter();
text7.y = group4.y + 100;

group5= new FlxText(0,0,1000, "Edição de som", 60);
add(group5);
group5.screenCenter();
group5.y = group4.y + 300;


text8 = new FlxText(0,0, 800, "toninho", 40);
add(text8);
text8.screenCenter();
text8.y = group5.y + 100;

group6 = new FlxText(0,0,1000, "Tratamento de cor", 60);
add(group6);
group6.screenCenter();
group6.y = group5.y + 300;
text9 = new FlxText(0,0, 800,
"
Anthony
Anthony
Anthony
Anthony
Anthony
Anthony

Anthony
Anthony

Anthony
Anthony
Anthony


", 40);
add(text9);

text9.screenCenter();
text9.y = group5.y + 300;


group7 = new FlxText(0,0,1000, "Tratamento de áudio", 60);
add(group7);
group7.screenCenter();
group7.y = group6.y + 300;

group8 = new FlxText(0,0,1000, "Edição de Imagem", 60);
add(group8);
group8.screenCenter();
group8.y = group7.y + 300;

group9 = new FlxText(0,0,1000, "Detalhes Adicionais", 60);
add(group9);
group9.screenCenter();
group9.y = group8.y + 300;

group10 = new FlxText(0,0,1000, "Feito com HaxeFlixel - Anthony", 60);
add(group10);
group10.screenCenter();
group10.y = group9.y + 300;

group10.visible = false;


FlxG.camera.zoom = 1;

for(i in [group1, group2, group3, group4, group5, group6, group7, group8, group9, group10, text1, text2, text3, text4, text5, text6, text7, text8,text9 ]){

	i.font = 'NotoSans';
}
for(i in [group1, group2, group3, group4, group5, group6, group7, group8, group9, group10, text1, text2, text3, text4, text5, text6, text7, text8,text9 ]){

	i.setBorderStyle(OUTLINE, FlxColor.BLACK, 0.3, 0.3);
	i.setBorderStyle(FlxTextBorderStyle.OUTLINE, FlxColor.PURPLE, 20);
i.borderSize = 4;
i.borderQuality = 10;

}

}

function update(){
	for(i in [group1, group2, group3, group4, group5, group6, group7, group8, group9, group10, text1, text2, text3, text4, text5, text6, text7,text8,text9 ]){
		i.y -= 0.1;
	}

	if(FlxG.keys.justPressed.ESCAPE){
		FlxG.switchState(new MainMenuState());
	}   
    if(FlxG.keys.pressed.K){
		for(i in [group1, group2, group3, group4, group5, group6, group7, group8, group9, group10, text1, text2, text3, text4, text5, text6, text7,text8,text9 ]){
			i.y -= 10;
		}
	}
	if(FlxG.keys.pressed.I){
		for(i in [group1, group2, group3, group4, group5, group6, group7, group8, group9, group10, text1, text2, text3, text4, text5, text6, text7,text8,text9 ]){
			i.y += 10;
		}
	}
}
