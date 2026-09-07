package shift;

import flixel.text.FlxText;

class ShiftState extends FlxState
{
    public var camGame(get, never):FlxCamera;
    public function get_camGame()
        return FlxG.camera;

    public static var state(get, never):ShiftState;
    public static function get_state()
    {
        if (Std.isOfType(FlxG.state, ShiftState))
			return cast FlxG.state;

        return null;
    }

    public var camHUD:FlxCamera = new FlxCamera();
    public var camDialogue:FlxCamera = new FlxCamera();

    override public function create() 
    {
        super.create();

        FlxG.cameras.add(camHUD);
        FlxG.cameras.add(camDialogue);
    }

    function makeText(x:Float, y:Float, text:String, center:Bool = false, size:Int = 16):FlxText
    {
        var text = new FlxText(x, y, text);
        text.setFormat(Paths.getFont('font'), size);
        if (center) text.screenCenter(X);
        add(text);
        return text;
    }
}