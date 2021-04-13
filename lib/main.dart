import 'package:flutter/material.dart';
import 'package:imc_mobx/imc_page.dart';
import 'package:imc_mobx/imc_store.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ImcPage(
        imcStore: ImcStore(),
        formKey: GlobalKey<FormState>(),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
