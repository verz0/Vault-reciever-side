import 'package:flutter/material.dart';
import 'package:vault_business/ret.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: DataPage(),
  ));
}
