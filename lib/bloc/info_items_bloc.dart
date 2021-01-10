import 'dart:async';

class InfoItemsBloc {
  final infoStreamController = StreamController.broadcast();

  Stream get getStream => infoStreamController.stream;

  Map infoData = {};

  void setInfoData(data) {
    infoData = data;
    infoStreamController.sink.add(infoData);
  }

  void dispose() {
    infoStreamController.close();
  }
}

final bloc = InfoItemsBloc();
