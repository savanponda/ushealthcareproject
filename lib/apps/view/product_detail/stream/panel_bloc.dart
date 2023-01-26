import 'dart:async';

enum PanelBlocStatus{
  OPEN,
  CLOSE,
  SCROLL,
}
class PanelBloc {

  late bool isPanelOpen;

  final stateStreamController = StreamController<bool>();
  StreamSink<bool> get panelSink => stateStreamController.sink;
  Stream<bool> get panelStream => stateStreamController.stream;

  final eventStreamController = StreamController<PanelBlocStatus>();
  StreamSink<PanelBlocStatus> get eventSink => eventStreamController.sink;
  Stream<PanelBlocStatus> get eventStream => eventStreamController.stream;

  PanelBloc(bool initialValue){

    isPanelOpen = initialValue;

    eventStream.listen((event) {

      if(event == PanelBlocStatus.OPEN){
        isPanelOpen = true;
      }
      else if(event == PanelBlocStatus.CLOSE){
        isPanelOpen = false;
      }
      else if(event == PanelBlocStatus.SCROLL){
        isPanelOpen = true;
      }

      panelSink.add(isPanelOpen);
    });
  }
}