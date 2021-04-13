import 'dart:math';

import 'package:mobx/mobx.dart';

part 'imc_store.g.dart';

class ImcStore = ImcStoreBase with _$ImcStore;

abstract class ImcStoreBase with Store {
  @observable
  bool interpretationVisible = false;

  @observable
  double _height;

  @observable
  double _weight;

  @computed
  double get height => _height;

  @computed
  double get weight => _weight;

  @computed
  double get imc {
    if (height == null || weight == null || height == 0) {
      return null;
    } else {
      return weight / pow(height / 100, 2);
    }
  }

  @computed
  String get interpretation {
    if (imc == null) {
      return null;
    } else if (imc < 17)
      return 'muito abaixo do peso';
    else if (imc < 18.5)
      return 'abaixo do peso';
    else if (imc < 25)
      return 'peso normal';
    else if (imc < 30)
      return 'acima do peso';
    else if (imc < 35)
      return 'obesidade';
    else if (imc < 40)
      return 'obesidade severa';
    else
      return 'obesidade mórbida';
  }

  @computed
  set height(double height) {
    _height = height;
    interpretationVisible = false;
  }

  @computed
  set weight(double weight) {
    _weight = weight;
    interpretationVisible = false;
  }

  @action
  void reset() {
    height = weight = null;
    interpretationVisible = false;
  }
}
