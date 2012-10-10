package screens
{
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	import com.greensock.easing.Sine;
	
	import events.NavigationEvent;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Welcome extends Sprite
	{
		private var bg:Image;
		private var title:Image;
		private var hero:Image;
		
		private var playBtn:Button;
		private var aboutBtn:Button;
		
		public function Welcome()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}		
		
		private function onAddedToStage(event:Event):void
		{
			drawScreen();
		}
		
		private function drawScreen():void
		{
			bg = new Image(Assets.getTexture("BgWelcome"));
			this.addChild(bg);
			
			title = new Image(Assets.getAtlas().getTexture("welcome_title"));
			title.x = 440;
			title.y = 20;
			this.addChild(title);
				
			hero = new Image(Assets.getAtlas().getTexture("welcome_hero"));			
			this.addChild(hero);
			
			playBtn = new Button(Assets.getAtlas().getTexture("welcome_playButton"));
			playBtn.x = 500;
			playBtn.y = 260;
			this.addChild(playBtn);
			
			aboutBtn = new Button(Assets.getAtlas().getTexture("welcome_aboutButton"));
			aboutBtn.x = 410;
			aboutBtn.y = 380;				
			this.addChild(aboutBtn);
			
			this.addEventListener(starling.events.Event.TRIGGERED, onMainMenuClick);
		}
		
		private function onMainMenuClick(event:Event):void
		{
			var buttonClicked:Button = event.target as Button;			
			if (buttonClicked == playBtn)
			{
				this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN, {id: "play"}, true));
			}
		}
		
		public function initialize():void
		{
			this.visible = true;
			
			hero.x = -hero.width;
			hero.y = 100;
			
			TweenLite.to(hero, 2, {x: 80});
			
			this.addEventListener(Event.ENTER_FRAME, heroAnimation);			
			
			TweenMax.fromTo(hero, 2, {y:100}, {y:140, ease:Sine.easeInOut, repeat:-1, yoyo:true});	
		}
		
		private function heroAnimation(event:Event):void
		{
			var currentDate:Date = new Date();
			// código substituído por TweenMax em initialize
//			hero.y = 100 + (Math.cos(currentDate.getTime() * 0.002) * 25);
			playBtn.y = 260 + (Math.cos(currentDate.getTime() * 0.002) * 10);
			aboutBtn.y = 380 + (Math.cos(currentDate.getTime() * 0.002) * 10);
			
		}
		
		public function disposeTemporarily():void
		{
			this.visible = false;
			
			if (this.hasEventListener(Event.ENTER_FRAME)) this.removeEventListener(Event.ENTER_FRAME, heroAnimation);
		}
	}
}