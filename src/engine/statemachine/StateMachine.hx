package engine.statemachine;

class StateMachine implements IStateSwitcher
{
    private var state:State;

    private function new()
    {
    }

    public static function buildFromInitial(state:State):StateMachine
    {
        var stateMachine = new StateMachine();
        stateMachine.switchState(state);
        return stateMachine;
    }
    
    public function update(dt:Float):Void
    {
        state.update(this, dt);
    }

    public function switchState(newState:State)
    {
        if (state != null)
        {
            state.destroy();
        }

        this.state = newState;
        state.init(this);
    }
}