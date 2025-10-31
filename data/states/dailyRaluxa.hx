import flixel.addons.text.FlxTypeText;
import flixel.text.FlxTextFormat;
import flixel.text.FlxTextFormatMarkerPair;
import flixel.text.FlxTextBorderStyle;
var raluxa:FunkinSprite;
var quote:FlxTypeText;
var randomq = 0;
var falas = [
    "Eu so biologicamente viado",
    "Essa é a minha bullseta e eu permito que garotinhos mamados-",
    "Voce que ta assistindo isso, eu sou biologicamente AAAAAAAAAAAAAAAA",
    "Pensamentos preconceituosos e AAAAAAfobicos",
    "Entenda q to com coçeira no cur, afinal foi a minha abordagem sequisual nos ultimos anos, como seu anus",
    "Não é facil viver num mundo onde o preconceito prevalece sobre um saco peludo, e principalmente da mesma forma que minha rola te faz subir,           \nela também te faz descer. Porém eu não vou me calar enquanto fazerem meu Onlyfans",
    "Eu sou biologicamente arrogante",
    "Deus Diggo.      Diggo é um garoto mimado de 20 anos que cresceu na casa do caralho, e ele ficou popular na internet por fazer opnioes          sexuais                  populares sobre erros e falhas de um saco peludo",
    "Mas. Eu sou biologicamente Walter Walti.       \n*musica bacana*                                       \nI am Breaking Bad",
    "Puta que pariu",
    "Quero deixar claro desde o inicio que idfugebfjnasujdanjsdjikasdaskdasgdabsnhdajsshjasdjahdqewriqwrfyhqwetyuadh",
    "Apenas paguei o conteúdo duas vezes por causa de qwuejknsxcyusearnmfmwejrugx e honestamente eu nao so ~G~}A}{Y{",
    "Eu recomendo voces estorarem pau dentro do próprio rabo     porque a partir de agora,         vai ser uma começão de cu sees çuqvigsemo",
    "Parabéns Jean Linguiça,          a partir de hoje             ojooj                  oje    \nvai ser sóóó Jean            \nno seu      %CU%"
];
function create(){
    FlxG.sound.music.volume = 0;
    randomq = FlxG.random.int(0,13);
    raluxa = new FunkinSprite().loadGraphic(Paths.image("raluxamesa"));
    add(raluxa);
    raluxa.scale.set(1.1,1.1);
    raluxa.updateHitbox();
    raluxa.x = FlxG.width - raluxa.width + 300;
    raluxa.y = FlxG.height - raluxa.height + 150;
    // var bg = new FunkinSprite().makeSolid(100,100, 0xFFFFFFFF);
    // add(bg);

    quote = new FlxTypeText(0,0,800, "Lorem, ipsum dolor sit amet consectetur adipisicing elit. cu 1 cu 2 cu3 cu4", 40);
    quote.x = 30;
    quote.y = 40;
    add(quote);
    quote.font = Paths.font("Roboto-Light.ttf");
    // randomq = 13;
    quote.resetText(falas[randomq - 1] + "\n\n $- Raluxa$");
    quote.setBorderStyle(FlxTextBorderStyle.OUTLINE, 0xFF000000, true);
    switch(randomq){
        default:    quote.borderSize = 3;
        case 11:    quote.borderSize = 2;
    }
    quote.applyMarkup(falas[randomq] + "\n\n $- Raluxa$",[    
        new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFFF0000, false,false,FlxColor.RED), "%"), 
        new FlxTextFormatMarkerPair(new FlxTextFormat(0xFF999999), "$"),

        new FlxTextFormatMarkerPair(new FlxTextFormat(0xFF99e8c2, false, false, 0xFF99e8c2), "~"),
        new FlxTextFormatMarkerPair(new FlxTextFormat(0xFFefefff, false, false, 0xFFefefff), "}"),
        new FlxTextFormatMarkerPair(new FlxTextFormat(0xFF7bade3, false, falas, 0xFF7bade3), "{"),
        

    ]);
    new FlxTimer().start(0.5, function(){
    quote.start(0.05,true, false, {});

    FlxG.sound.play(Paths.sound("raluca/" + (randomq + 1)));

    });

    cu = new FlxText(10,FlxG.height - 40,100, randomq, 20);
    cu.color = 0xFF333333;
    add(cu);
}

function update(){
    if(FlxG.keys.justPressed.R){
        FlxG.switchState(new ModState("dailyRaluxa"));
    }
    if(FlxG.keys.justPressed.ESCAPE){
        FlxG.switchState(new MainMenuState());
    }
}