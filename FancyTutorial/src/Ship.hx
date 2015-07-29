package;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.KeyboardEvent;
import flash.display.Bitmap;
import flash.display.BitmapData;
import openfl.Assets;

/**
 * ...
 * @author Tara Moses
 */
class Ship extends Sprite
{
	var velocity:Float;
	public var isAlive:Bool;
	var health:Int;
	var MAX_HEALTH = 3;
	var health_bar:Sprite;
	
	public function new(x:Int, y:Int) 
	{
		super();
		isAlive = true;
		var playerSprite = new Sprite();
		var shipIcon = new Bitmap(Assets.getBitmapData("img/shipIcon.png"));
		playerSprite.addChild(shipIcon);
		
		playerSprite.x = -shipIcon.width / 2;
		playerSprite.y = -shipIcon.height / 2;
		this.addChild(playerSprite);
		
		this.x = x;
		this.y = y;
		this.velocity = 0;
	}
	
	public function goLeft()
	{
		this.velocity-=2;
	}
	
	public function goRight()
	{
		this.velocity+=2;
	}
	
	public function shoot() 
	{
		if (isAlive)
		{
			//create a pizza slice to shoot
			var slice:Pizza = new Pizza(Std.int(this.x), Std.int(this.y - this.height / 2));
			Main.game.slices.add(slice);
			Main.game.addChild(slice);
		}
	}
	
	public function act() 
	{
		if (this.x < this.width/2 && this.velocity<0) //ship going left
		{
			this.velocity = 0;
			this.x = this.width / 2;
		}
		if (this.x > 800 - this.width/2 && this.velocity>0) //ship going right
		{
			this.velocity = 0;
			this.x = 800 - this.width / 2;
		}
		this.velocity *= 0.9;
		this.x += this.velocity;
	}
}