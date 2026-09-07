package shift.data;

import haxe.Json;
import sys.io.File;
import lime.ui.FileDialog;
import lime.ui.FileDialogType;

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
    public static var dialogOpen:Bool;

    public var onSave:Void->Void;
    public var onOpen:Void->Void;

    public function new() {}

    public function openJson()
    {
        var dialog = new FileDialog();
        dialog.onSelect.add(function(path:String)
        {
            trace("Selected: " + path);

            var raw = File.getContent(path);
            data = Json.parse(raw);
            dialogOpen = true;

            if (onOpen != null) onOpen();
        });

        dialog.onCancel.add(function()
        {
            trace("Cancelled");
            dialogOpen = true;
        });

        dialog.browse(
            FileDialogType.OPEN,
            null,
            null,
            "Open Map"
        );
        dialogOpen = false;
    }

    public function saveJson()
    {
        if (data == null)
            return;

        var string = Json.stringify(data);
        var dialog = new FileDialog();

        dialog.onSelect.add(function(path:String)
        {
            trace("Save to: " + path);
            File.saveContent(path, string);
            dialogOpen = true;
            if (onSave != null) onSave();
        });

        dialog.onCancel.add(function()
        {
            trace("Cancelled");
            dialogOpen = true;
        });

        dialog.browse(
            FileDialogType.SAVE,
            null,
            null,
            "Save Map"
        );

        dialogOpen = false;
    }
}