package engine.statemachine;

interface IStateSwitcher
{
    function switchState(newState:State):Void;
}