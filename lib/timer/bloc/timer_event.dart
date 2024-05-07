part of 'timer_bloc.dart';
/*
Our TimerBloc will need to know how to process the following events:

    TimerStarted: informs the TimerBloc that the timer should be started.
    TimerPaused: informs the TimerBloc that the timer should be paused.
    TimerResumed: informs the TimerBloc that the timer should be resumed.
    TimerReset: informs the TimerBloc that the timer should be reset to the original state.
    _TimerTicked: informs the TimerBloc that a tick has occurred and that it needs to update its state accordingly.
*/

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});
  final int duration;
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

class TimerReset extends TimerEvent {
  const TimerReset();
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});
  final int duration;
}
