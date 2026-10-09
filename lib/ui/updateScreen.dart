

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/dbHelper/satate%20mangement/noteProvider.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/ui/homeScreen.dart';
import 'package:provider/provider.dart';
import '../uiHelper/customText.dart';

class updateNoteScreen extends StatefulWidget {
  @override
  State<updateNoteScreen> createState() => _addNoteScreenState();
}

class _addNoteScreenState extends State<updateNoteScreen> {
  List<noteModel> mNotesData = [];
  TextEditingController titleController = TextEditingController();

  TextEditingController subTitleController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setState(() {
      context.read<noteProvider>().fetchInitialNotesDataPD();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: customText(
          mText: "Add Note",
          color: Colors.black,
          size: 24,
          fontWeight: FontWeight.w600,
          latterSpacing: 1,
        ),
        actions: [
          IconButton(
            onPressed: (){
              context.read<noteProvider>().upDateNotesDataPD(newModelPD: noteModel(title: "this my love", subTitle: "this my love",));
              Navigator.push(context, MaterialPageRoute(builder: (context)=> homeScreen()));

            },

            icon: Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.green,
              size: 30,
            ),
          ),
        ],
        actionsPadding: EdgeInsets.only(right: 5),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  TextField(
                    controller: titleController,
                    maxLines: null,
                    // expands: true,
                    style: const TextStyle(color: Colors.black, fontSize: 21),

                    decoration: const InputDecoration(
                      hintText: "Title",

                      hintStyle: TextStyle(color: Colors.grey, fontSize: 21),

                      border: InputBorder.none,
                    ),
                  ),

                  const SizedBox(height: 15),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: TextField(
                controller: subTitleController,
                // Unlimited lines
                maxLines: null,

                expands: true,

                textAlignVertical: TextAlignVertical.top,

                style: const TextStyle(color: Colors.black, fontSize: 22),

                decoration: const InputDecoration(
                  hintText: "Type something...",

                  hintStyle: TextStyle(color: Colors.grey, fontSize: 22),

                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
