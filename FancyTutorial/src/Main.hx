package ;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.Lib;
import haxe.Timer;
import motion.Actuate;

/**
 * ...
 * @author Tara Moses
 */

class Main extends Sprite 
{
	var inited:Bool;
	var leftDown:Bool;
	var rightDown:Bool;
	public var ship:Ship;
	public var tara:HungryTara;
	public var slices:List<Pizza>;
	public static var game:Main;

	/* ENTRY POINT */
	
	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;

		// (your code here)
		
		// Stage:
		// stage.stageWidth x stage.stageHeight @ stage.dpiScale
		
		// Assets:
		// nme.Assets.getBitmapData("img/assetname.jpg");
	}

	/* SETUP */

	public function new() 
	{
		super();
		
		game = this;
		
		addEventListener(Event.ADDED_TO_STAGE, added);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, processKeyPressed);
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, processKeyReleased);
		Lib.current.stage.addEventListener(Event.ENTER_FRAME, doMoreStuffIGuess);
		
		slices = new List<Pizza>();
		
		tara = new HungryTara(400,40);
		this.addChild(tara);
		ship = new Ship(400, 400);
		this.addChild(ship);
		
		tara.act();
	}
	
	function processKeyPressed(e:KeyboardEvent) 
	{
		//stuff happens here when you press keys
		trace(e.keyCode);
		
		if (e.keyCode == 37) leftDown = true;
		if (e.keyCode == 39) rightDown = true;
		if (e.keyCode == 38) ship.shoot();
	}
	
	function processKeyReleased(e:KeyboardEvent)
	{
		//stuff happens here when you release keys!
		trace(e.keyCode);
		
		if (e.keyCode == 37) leftDown = false;
		if (e.keyCode == 39) rightDown = false;
	}
	
	function doMoreStuffIGuess(e) 
	{
		//other stuff happens here but i don't know when or why hehe
		if (leftDown) ship.goLeft();
		if (rightDown) ship.goRight();
		
		ship.act();
		for (slice in slices) slice.act();
	}
	
	function move(e:MouseEvent)
	{
		var x = e.stageX;
		var y = e.stageY;
		this.x = x;
		this.y = y;
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
