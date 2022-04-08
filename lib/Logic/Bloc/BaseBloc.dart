import 'dart:async';

abstract class BaseBloc<TEntity, TEvent> {
  final StreamController<TEntity> _stateController =
      StreamController<TEntity>();
  StreamSink get _in => _stateController.sink;

  Stream<TEntity> get stream => _stateController.stream;

  final StreamController<TEvent> _eventController = StreamController<TEvent>();

  Sink<TEvent> get eventSink => _eventController.sink;

  BaseBloc() {
    _eventController.stream.listen(mapEvent);
  }

  void add(TEntity entity) {
    if (!_stateController.isClosed || !_stateController.isPaused) {
      _in.add(entity);
    }
  }

  void addSink(TEvent event) {
    eventSink.add(event);
  }

  void mapEvent(TEvent event);

  void dispose() {
    _stateController.close();
    _eventController.close();
  }
}
