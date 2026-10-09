

import 'package:flutter/cupertino.dart';
import 'package:note_app/dbHelper/dbHelper.dart';
import 'package:note_app/model/noteModel.dart';

class noteProvider extends ChangeNotifier{
  DB_HELPER newDb_helper;
  noteProvider({required this.newDb_helper});
  List<noteModel> _mNotesDataPD = [];

/// get all data
List<noteModel> getAllNotesDataPd(){
  return _mNotesDataPD;
}

/// all events
/// add notes
 void addNotesPD({required noteModel newModelPD})async{
 bool check = await  newDb_helper.addNoteData(newNote: newModelPD);
 if(check){
   _mNotesDataPD = await  newDb_helper.fetchAllNotes();
   notifyListeners();
 }
 }
/// fetch initial data;
void fetchInitialNotesDataPD()async{
  _mNotesDataPD = await newDb_helper.fetchAllNotes();
  notifyListeners();
}
/// update data
void upDateNotesDataPD({required noteModel newModelPD})async{
  bool check = await newDb_helper.updateNote(upDateNote: newModelPD);
  if(check){
    _mNotesDataPD = await newDb_helper.fetchAllNotes();
    notifyListeners();
  }
}
  /// delete data

void deleteNotesDataPd({required int newIdPD})async{
 bool check = await newDb_helper.deleteNote(id: newIdPD);
 if(check){
   _mNotesDataPD = await newDb_helper.fetchAllNotes();
   notifyListeners();
 }
}
}