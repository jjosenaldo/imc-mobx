// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'imc_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ImcStore on ImcStoreBase, Store {
  Computed<double> _$heightComputed;

  @override
  double get height => (_$heightComputed ??=
          Computed<double>(() => super.height, name: 'ImcStoreBase.height'))
      .value;
  Computed<double> _$weightComputed;

  @override
  double get weight => (_$weightComputed ??=
          Computed<double>(() => super.weight, name: 'ImcStoreBase.weight'))
      .value;
  Computed<double> _$imcComputed;

  @override
  double get imc => (_$imcComputed ??=
          Computed<double>(() => super.imc, name: 'ImcStoreBase.imc'))
      .value;
  Computed<String> _$interpretationComputed;

  @override
  String get interpretation =>
      (_$interpretationComputed ??= Computed<String>(() => super.interpretation,
              name: 'ImcStoreBase.interpretation'))
          .value;

  final _$interpretationVisibleAtom =
      Atom(name: 'ImcStoreBase.interpretationVisible');

  @override
  bool get interpretationVisible {
    _$interpretationVisibleAtom.reportRead();
    return super.interpretationVisible;
  }

  @override
  set interpretationVisible(bool value) {
    _$interpretationVisibleAtom.reportWrite(value, super.interpretationVisible,
        () {
      super.interpretationVisible = value;
    });
  }

  final _$_heightAtom = Atom(name: 'ImcStoreBase._height');

  @override
  double get _height {
    _$_heightAtom.reportRead();
    return super._height;
  }

  @override
  set _height(double value) {
    _$_heightAtom.reportWrite(value, super._height, () {
      super._height = value;
    });
  }

  final _$_weightAtom = Atom(name: 'ImcStoreBase._weight');

  @override
  double get _weight {
    _$_weightAtom.reportRead();
    return super._weight;
  }

  @override
  set _weight(double value) {
    _$_weightAtom.reportWrite(value, super._weight, () {
      super._weight = value;
    });
  }

  final _$ImcStoreBaseActionController = ActionController(name: 'ImcStoreBase');

  @override
  void reset() {
    final _$actionInfo =
        _$ImcStoreBaseActionController.startAction(name: 'ImcStoreBase.reset');
    try {
      return super.reset();
    } finally {
      _$ImcStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
interpretationVisible: ${interpretationVisible},
height: ${height},
weight: ${weight},
imc: ${imc},
interpretation: ${interpretation}
    ''';
  }
}
