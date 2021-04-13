import 'package:flutter/material.dart';
import 'package:imc_mobx/imc_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ImcPage extends StatelessWidget {
  const ImcPage({
    Key key,
    @required this.imcStore,
    @required this.formKey,
  }) : super(key: key);

  final ImcStore imcStore;
  final GlobalKey<FormState> formKey;

  final String _kMandatoryFieldError = 'Campo obrigatório';
  final String _invalidNumberError = 'Insira um valor válido';
  final String _numberNotPositiveError = 'O valor deve ser positivo';

  String mandatoryFieldValidator(String enteredText) {
    if (enteredText == null || enteredText.isEmpty) {
      return _kMandatoryFieldError;
    } else {
      return null;
    }
  }

  String positiveIntegerValidator(String enteredNumber) {
    int maybeNumber = int.tryParse(enteredNumber);
    if (maybeNumber == null) {
      return _invalidNumberError;
    } else if (maybeNumber <= 0) {
      return _numberNotPositiveError;
    } else {
      return null;
    }
  }

  String mandatoryPositiveIntegerValidator(String enteredNumber) {
    final mandatoryFieldValidationMessage =
        mandatoryFieldValidator(enteredNumber);

    if (mandatoryFieldValidationMessage != null) {
      return mandatoryFieldValidationMessage;
    }

    return positiveIntegerValidator(enteredNumber);
  }

  Widget _verticalPadding() => SizedBox(height: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              imcStore.reset();
              formKey.currentState.reset();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.black38,
                ),
                SizedBox(height: 10),
                TextFormField(
                  validator: mandatoryPositiveIntegerValidator,
                  decoration: InputDecoration(
                    hintText: 'Peso (kg)',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (String weight) =>
                      imcStore.setWeight(double.tryParse(weight)),
                  maxLength: 3,
                ),
                _verticalPadding(),
                TextFormField(
                  validator: mandatoryPositiveIntegerValidator,
                  decoration: InputDecoration(
                    hintText: 'Altura (cm)',
                  ),
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (String height) =>
                      imcStore.setHeight(double.tryParse(height)),
                  maxLength: 3,
                ),
                _verticalPadding(),
                ElevatedButton(
                  child: Text('Calcular'),
                  onPressed: () {
                    if (formKey.currentState.validate()) {
                      imcStore.interpretationVisible = true;
                    }
                    _unfocusCurrentFocus(context);
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.teal),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                  ),
                ),
                Observer(
                  builder: (_) => Visibility(
                    visible: imcStore.interpretationVisible,
                    child: Center(
                      child: Text(imcStore.interpretation ?? ''),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _unfocusCurrentFocus(BuildContext context) {
    final currentFocus = FocusScope.of(context);
    if (currentFocus.hasFocus) {
      currentFocus.unfocus();
    }
  }
}
