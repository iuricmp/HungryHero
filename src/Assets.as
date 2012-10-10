package
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{
		[Embed(source="../media/graphics/bgWelcome.jpg")]
		private static const BgWelcome:Class;
		
		[Embed(source="../media/graphics/bgLayer1.jpg")]
		private static const BgLayer1:Class;
		
		private static var gameTextures:Dictionary = new Dictionary();		
		private static var gameTextureAlas:TextureAtlas;
		
		[Embed(source="../media/graphics/mySpritesheet.png")]
		public static var AtlasTextureGame:Class;
		
		[Embed(source="../media/graphics/mySpritesheet.xml", mimeType="application/octet-stream")]
		public static const AtlasXmlGame:Class;
		
		[Embed(source="../media/fonts/embedded/BADABB__.TTF", fontFamily="MyFontName", embedAsCFF="false")]
		public static var MyFont:Class;
				
		public static function getAtlas():TextureAtlas
		{
			if (gameTextureAlas == null)
			{
				var texture:Texture = getTexture("AtlasTextureGame");
				var xml:XML = new XML(new AtlasXmlGame());
				gameTextureAlas = new TextureAtlas(texture, xml);
			}
			return gameTextureAlas;
		}
		
		public static function getTexture(name:String):Texture
		{
			trace(gameTextures[name]);
			var obj:Object = gameTextures[name];
			
			if (gameTextures[name] == null)
			{
				var bitmap:Bitmap = new Assets[name];
				gameTextures[name] = Texture.fromBitmap(bitmap);
			}
			return gameTextures[name];
		}
	}
}