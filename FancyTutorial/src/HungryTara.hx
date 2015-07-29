package;
import flash.display.Bitmap;
import flash.display.BitmapData;
import haxe.Timer;
import openfl.Assets;
import flash.display.Sprite;
import motion.Actuate;

/**
 * ...
 * @author Tara Moses
 */
class HungryTara extends Sprite
{
	var hungerBar:Sprite;
	var hunger:Int;
	public var isSatisfied:Bool;
	var FULL_TUMMY = 10;
	var refx:Int;
	var moveHere:Array<Int>;
	
	public function new(x:Int, y:Int) 
	{
		super();
		hunger = 0;
		isSatisfied = false;
		var hungryTaraIcon = new Bitmap(Assets.getBitmapData("img/hungryTaraIcon.png"));
		var taraSprite = new Sprite();
		taraSprite.addChild(hungryTaraIcon);
		taraSprite.width = taraSprite.height = 100;
		taraSprite.x = -taraSprite.width / 2;
		taraSprite.y = -taraSprite.height / 2;
		this.addChild(taraSprite);
		
		this.refx = x;
		
		hungerBar = new Sprite();
		hungerBar.graphics.beginFill(0x00FF00, 2);
		hungerBar.graphics.drawRect(0,0,hungryTaraIcon.width,5);
		taraSprite.addChild(hungerBar);
		hungerBar.y = -8;
		
		this.width = this.height = 100;
		this.x = x;
		this.y = y;
	}
	
	public function act()
	{
		//generate random number
		var randomNum = Math.random() * 800;
		Actuate.tween(this, 2, { x: randomNum } ).onComplete(act);
	}	
}