import 'package:flutter/material.dart';
import 'package:note_app/dbHelper/dbHelper.dart';
import 'package:note_app/dbHelper/satate%20mangement/noteProvider.dart';
import 'package:note_app/ui/splashScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( ChangeNotifierProvider(create: (context)=>noteProvider(newDb_helper: DB_HELPER.initialiseDB()),child: splashScreen(),));
}

