package example;

import h2d.Graphics;
import hxd.App;
import hxd.Res;

class ExampleApp extends App
{
    private var graphics:Graphics;

    public override function init()
    {
        Res.initEmbed();
        this.graphics = new Graphics(s2d);
    }

    public override function update(dt:Float)
    {
        graphics.clear();
        drawRect(10, 10, 200, 100);
    }

    public static function main()
    {
        new ExampleApp();
    }

    private function drawRect(x:Float, y:Float, width:Float, height:Float)
    {
        graphics.beginFill(0xFFFFFF);
        graphics.drawRect(x, y, width, height);
        graphics.endFill();
    }
}