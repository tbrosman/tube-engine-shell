package engine.statemachine.test;

import haxe.unit.TestCase;
import engine.statemachine.StateMachine;

class StateMachineTestCase extends TestCase
{
    public function testInitCalledAfterTransition()
    {
        var state = new TestState();
        var machine = StateMachine.buildFromInitial(state);
        machine.switchState(state);
        assertTrue(state.initWasCalled);
    }
}

private class TestState extends State
{
    public var initWasCalled:Bool = false;

    public function new()
    {
    }

    public override function init(stateMachine:IStateSwitcher)
    {
        initWasCalled = true;
    }
}