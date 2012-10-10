package events
{
	import starling.events.Event;
	
	public class NavigationEvent extends starling.events.Event
	{
		public static const CHANGE_SCREEN:String = "changeScreen";
		
		public var params:Object;
		
		public function NavigationEvent(type:String, _params:Object = null, bubbles:Boolean=false)
		{
			this.params = _params;
			super(type, bubbles);
		}
	}
}