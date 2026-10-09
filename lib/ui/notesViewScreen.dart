

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/dbHelper/satate%20mangement/noteProvider.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/ui/updateScreen.dart';
import 'package:note_app/uiHelper/customText.dart';
import 'package:provider/provider.dart';

class notesViewScreen extends StatefulWidget{
  @override
  State<notesViewScreen> createState() => _notesViewScreenState();
}

class _notesViewScreenState extends State<notesViewScreen> {

  List<noteModel> mNoteData = [];
@override
  void initState() {
    super.initState();
    context.read<noteProvider>().fetchInitialNotesDataPD();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: customText(mText: "Edit Note",color: Colors.black,size: 24,fontWeight: FontWeight.w600,latterSpacing: 1,),
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.dangerous_outlined,color: Colors.red,size: 30,)),
        actions: [IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon: Icon(Icons.check_circle_outline_outlined,color: Colors.green,size: 30,))],
        actionsPadding: EdgeInsets.only(right: 5),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Container(
          child: ListView.builder(
            itemCount: mNoteData.length + 1,
              itemBuilder: ((context, index ){
                mNoteData = context.read<noteProvider>().getAllNotesDataPd();
                print(mNoteData);
                return  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        fontFamilyCustomText(mText: "${(mNoteData[index].title)}",color: Colors.black,fontWeight:FontWeight.w700,size: 19,textAlign: TextAlign.start,),                ],
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Divider(thickness: 2,color: Colors.grey.shade300,),
                          fontFamilyCustomText(mText: "${mNoteData[index].subTitle}",color: Colors.black,size: 17,textAlign: TextAlign.start,),
                        ],
                      ),
                    ),
                  ],
                );
              })
            ),
        )

      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> updateNoteScreen()));
      },
        child: Icon(Icons.edit),
      ),
    );
  }
}