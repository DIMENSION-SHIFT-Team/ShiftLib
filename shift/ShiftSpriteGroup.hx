package shift;

import flixel.group.FlxSpriteGroup;

class ShiftSpriteGroup extends FlxSpriteGroup
{
    public function new(x:Float = 0, y:Float = 0, maxSize = 0)
    {
        super(x, y, maxSize);

        create();
    }

    function create() {}
}