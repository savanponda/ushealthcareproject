import 'dart:async';


class PromoCodeApplyBloc {

  bool? applyPromoCode;
  bool? removePromoCode;

  final stateStreamController = StreamController<bool>.broadcast();
  StreamSink<bool?> get promoCodeSink => stateStreamController.sink;
  Stream<bool?> get promoCodeStream => stateStreamController.stream;


  final updateStreamController = StreamController<bool?>();
  StreamSink<bool?> get updateSink => updateStreamController.sink;
  Stream<bool?> get updateStream => updateStreamController.stream;

  SearchCityBloc(){
    updateStream.listen((event) {

      applyPromoCode=event;
      promoCodeSink.add(applyPromoCode);
    });
  }
}