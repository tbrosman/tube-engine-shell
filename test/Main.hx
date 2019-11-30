package ;

import engine.statemachine.test.StateMachineTestCase;
import haxe.unit.TestRunner;

class Main
{
    public static function main():Void
    {
        var runner = new TestRunner();
        runner.add(new StateMachineTestCase());
        runner.run();
    }
}
