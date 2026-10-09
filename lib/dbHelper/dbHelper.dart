import 'package:note_app/model/noteModel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DB_HELPER {
  /// global variable for tables and columns
  /// Tables name
  static const String NOTE = "note";

  /// columns name
  static const String NOTE_TITLE = "note_title";
  static const String NOTE_SUBTITLE = "note_subtitle";
  static const String NOTE_ID = "note_id";

  DB_HELPER._();

  /// this is used for privatize constructor;
  static  DB_HELPER initialiseDB() => DB_HELPER._();

  /// this is used for make single object which was calling from any where
  ///global variable
  Database? mDataDB;

  ///open
  Future<Database> getDB() async {
    // return mDataDB ??= await openDB();   /// create one line code
    if (mDataDB != null) {
      return mDataDB!;
    } else {
      mDataDB = await openDB();
      return mDataDB!;
    }
  }

  Future<Database> openDB() async {
    var appDir = await getApplicationDocumentsDirectory();
    String dbPath = join(appDir.path, "mainDB.db");
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        ///create
        /// when db is created we need to crate table
        db.execute(
          "create table $NOTE ( $NOTE_ID integer primary key autoincrement, $NOTE_TITLE text, $NOTE_SUBTITLE  text )",
        );
      },
    );
  }

  ///quire

  /// add data quire
  Future<bool> addNoteData({required noteModel newNote}) async {
    var db = await getDB();
    int rowsEffected = await db.insert(NOTE,
      newNote.toMap());
    return rowsEffected > 0;
  }

  /// fetch all notes quire
  Future<List<noteModel>> fetchAllNotes() async {
    var db = await getDB();
    /// select * from note
    List<Map<String, dynamic>> mNotesData = await db.query(NOTE);
    List<noteModel> mNotes = [];
    for(int i = 0; i<mNotesData.length; i++){
      noteModel eachNotes = noteModel.fromMap(mNotesData[i]);
      mNotes.add(eachNotes);

    }
    return mNotes;
  }

  /// update note
  Future<bool> updateNote({required noteModel upDateNote}) async {
    var db = await getDB();
    int rowsEffected = await db.update(NOTE, upDateNote.toMap(), where: "$NOTE_ID = ${upDateNote.id}");
    return rowsEffected > 0;
  }

  /// delete note
  Future<bool> deleteNote({required int id}) async {
    var db = await getDB();
    int rowsEffected = await db.delete("$NOTE", where: "$NOTE_ID = $id");
    return rowsEffected > 0;
  }
}
