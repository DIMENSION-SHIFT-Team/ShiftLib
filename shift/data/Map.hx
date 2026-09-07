package data;

typedef Pos = 
{
    var x:Float;
    var y:Float;
}

typedef Size =
{
    var width:Int;
    var height:Int;
}

typedef Animation =
{
    //todo
}

typedef Graphic =
{
    @:optional var images:Array<String>;
    @:optional var defaultImage:String;
    @:optional var graphicColor:String;
    @:optional var graphicSize:Size;

    @:optional var anims:Array<Animation>;
}

typedef MapObject =
{
    var pos:Pos;
    @:optional var angle:Float;
    @:optional var scale:Pos;
    @:optional var alpha:Float;

    @:optional var graphic:Graphic;
    @:optional var color:String;
}

typedef MapLayer = 
{
    var objects:Array<MapObject>;
    var id:String;
}

typedef MapData = 
{
    var layers:Array<MapLayer>;
    var bounds:Size;
    @:optional var music:String;
}

class Map
{
    public var data:MapData;

    public function writeJson(path:String)
    {
        if (data == null)
            return;
    }
}