package shift;

import flixel.system.FlxAssets.FlxGraphicAsset;

class ShiftSprite extends FlxSprite
{
    override public function new(X:Float = 0, Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset)
    {
        super(X, Y, SimpleGraphic);
        antialiasing = false;
        create();
    }

    function create() {}
}