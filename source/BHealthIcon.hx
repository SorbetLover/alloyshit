
class BHealthIcon extends FlxSprite
{
	public var curCharacter:String = null;

	public var isPlayer:Bool;
	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		this.isPlayer = isPlayer;
		setIcon(char);

		scrollFactor.set();
	}

	public function setIcon(char:String, width:Int = 150, height:Int = 150) {
		if(curCharacter != char || this.width != width || this.height != height) {
			curCharacter = char;
			var path = Paths.image('icons/$char');
			if (!Assets.exists(path)) path = Paths.image('icons/face');

			loadGraphic(path, true, width, height);

			animation.add(char, [for(i in 0...frames.frames.length) i], 0, false, isPlayer);
			antialiasing = true;
			animation.play(char);

		}
	}


}