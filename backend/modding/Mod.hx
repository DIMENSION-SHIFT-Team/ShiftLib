package backend.modding;

class Mod
{
    public var id:String;
    public var enabled:Bool = true;
    public function new(id:String, ?enabled:Bool)
    {
        this.id = id;
        if (enabled != null) this.enabled = enabled;
    }

    public function toString():String
        return id;
}