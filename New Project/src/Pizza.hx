package;
import flash.display.Bitmap;
import flash.display.Sprite;
import openfl.Assets;
import flash.display.Bitmap;
import flash.display.BitmapData;

/**
 * ...
 * @author Tara Moses
 */
class Pizza extends Sprite
{
	var countdownToConsumption:Int;
	public var misses:Int;
	
	public function new(x:Int, y:Int) 
	{
		super();
		
		var pizzaIcon = new Bitmap(Assets.getBitmapData("img/pizzaIcon.png"));
		var pizzaSprite = new Sprite();
		pizzaSprite.addChild(pizzaIcon);
		pizzaSprite.x = -pizzaIcon.width / 2;
		pizzaSprite.y = -pizzaIcon.height / 2;
		this.addChild(pizzaSprite);
		
		this.width = 25;
		this.height = 25;
		this.x = x;
		this.y = y;
		
		countdownToConsumption = -1;
	}
	
	public function feed() 
	{
		countdownToConsumption = 60;
		this.removeChildAt(0);
	}
	
	public function act() 
	{
		if (countdownToConsumption < 0) 
		{
			var distanceFromTara = Math.sqrt((this.x - Main.game.tara.x) * (this.x - Main.game.tara.x) + (this.y - Main.game.tara.y) * (this.y - Main.game.tara.y));
			if (distanceFromTara < 30) this.feed();
			
			if (this.y < -this.height) //if pizza goes off-screen
			{
				Main.game.slices.remove(this);
				Main.game.removeChild(this);
				misses++;
				//if (misses==3) gameOver;
			}
		}
		this.y -= 5;
	}
	
}