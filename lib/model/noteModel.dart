

import 'package:note_app/dbHelper/dbHelper.dart';

class noteModel{
  int id;
  String title;
  String subTitle;

  noteModel({this.id = 0, required this.title, required this.subTitle});

/// fromMap
factory noteModel.fromMap(Map<String, dynamic> map){
  return noteModel(
    id: map[DB_HELPER.NOTE_ID],
      title: map[DB_HELPER.NOTE_TITLE],
      subTitle: map[DB_HELPER.NOTE_SUBTITLE]);
}
/// toMap
Map<String, dynamic> toMap(){
return {
  DB_HELPER.NOTE_TITLE: title,
  DB_HELPER.NOTE_SUBTITLE : subTitle,
};
}

}