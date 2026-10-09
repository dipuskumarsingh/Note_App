
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/dbHelper/satate%20mangement/noteProvider.dart';
import 'package:note_app/model/noteModel.dart';
import 'package:note_app/ui/notesViewScreen.dart';
import 'package:note_app/uiHelper/customText.dart';
import 'package:provider/provider.dart';

import 'addNoteScreen.dart';
class homeScreen extends StatefulWidget{
  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  List< noteModel > mNotesData = [];
  TextEditingController updateTitle = TextEditingController();
  TextEditingController updateSubTitle = TextEditingController();

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
        leading: Image.asset('assets/icon/note.png'),
          leadingWidth: 40,
          title: customText(mText: "Lao Note",size: 24,color: Colors.black,fontWeight: FontWeight.w900,latterSpacing: 1,),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,size: 35,color: Color(0xff1e1f22),)),
          IconButton(onPressed: (){}, icon: Icon(Icons.save_as_outlined,size: 35,color: Color(0xff1e1f22),)),
        ],
        actionsPadding: EdgeInsetsGeometry.only(right: 10),
        // shape: RoundedRectangleBorder(side: BorderSide(width: 1.5,color: Colors.grey)),
        ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Divider(
              thickness: 2.5,
              color: Colors.grey.shade200,
            ),
            Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 65,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(onPressed: (){}, child: customText(mText: 'Notes',color: Colors.grey.shade500,)),
                          TextButton(onPressed: (){}, child: customText(mText: 'Highlights',color: Colors.grey.shade500,)),
                          TextButton(onPressed: (){}, child: customText(mText: 'Favorite Notes',color: Colors.grey.shade500,)),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        customText(mText: "List Notes",color: Colors.black,size: 19,fontWeight: FontWeight.bold,latterSpacing: 1,),
                        customText(mText: "All Notes",color: Colors.grey.shade600,size: 16,latterSpacing: 1,),
                      ],
                    )
                  ],
                )),
            Expanded(
                flex: 5,
                child: Consumer<noteProvider>(builder: (ctx, provider, child){
                  mNotesData = provider.getAllNotesDataPd();
                  return  mNotesData.isNotEmpty ? ListView.builder(
                    itemCount: mNotesData.length,
                    itemBuilder: (context, index){
                      return Card(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>notesViewScreen()));
                                  },
                                  child: fontFamilyCustomText(mText: "${mNotesData[index].title}",color:  Colors.black,fontWeight:FontWeight.w700,size: 19,textAlign: TextAlign.start,)),
                              SizedBox(height: 10,),
                              InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>notesViewScreen()));
                                  },
                                  child: fontFamilyCustomText(mText: "${mNotesData[index].subTitle}",color: Colors.grey.shade600,textAlign: TextAlign.start,)),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      TextButton(onPressed: (){
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                            useSafeArea: true,
                                            context: context,
                                            builder: (BuildContext context){
                                          return Padding(
                                            padding: const EdgeInsets.all(20),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    children: [
                                                      SizedBox(height: 20),
                                                      TextField(
                                                        controller: updateTitle,
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
                                                    controller: updateSubTitle,
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
                                                FloatingActionButton(onPressed: (){
                                                  context.read<noteProvider>().upDateNotesDataPD(newModelPD: noteModel(title: updateTitle.text, subTitle: updateSubTitle.text,id: mNotesData[index].id));
                                                  Navigator.pop(context);
                                                },
                                                  child: Icon(Icons.check,color: Colors.grey,),

                                                )
                                              ],
                                            )
                                            );
                                            });
                                      },child: customText(mText: "Edit",size: 12,color: Colors.green,)),
                                      TextButton(onPressed: (){
                                        context.read<noteProvider>().deleteNotesDataPd(newIdPD: mNotesData[index].id);
                                      }, child: customText(mText: "Delete",size: 12,color: Colors.red,)),
                                    ],
                                  ),

                                  customText(mText: "2020/05/09",color: Colors.grey.shade600,size: 14,)
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ):Container(child: Center(child: customText(mText: "No Notes Found",color: Colors.grey.shade600,),),);
                })
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context)=>addNoteScreen()));

      },
        child: Icon(Icons.add),
      ),
    );
  }

}

/*
 mNotesData.isNotEmpty ? ListView.builder(
                  itemCount: mNotesData.length,
                  itemBuilder: (context, index){
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>notesViewScreen()));
                                },
                                child: fontFamilyCustomText(mText: "${mNotesData[index].title}",color:  Colors.black,fontWeight:FontWeight.w700,size: 19,textAlign: TextAlign.start,)),
                            SizedBox(height: 10,),
                            InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>notesViewScreen()));
                                },
                                child: fontFamilyCustomText(mText: "${mNotesData[index].subTitle}",color: Colors.grey.shade600,textAlign: TextAlign.start,)),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(onPressed: ()async{
                                  bool check = await dbHelper.deleteNote(id: mNotesData[index].id);
                                  if(check){
                                    get_notes();
                                    setState(() {

                                    });
                                  }
                                }, child: customText(mText: "Delete",size: 12,color: Colors.red,)),
                                customText(mText: "2020/05/09",color: Colors.grey.shade600,size: 14,)
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ):Container(child: Center(child: customText(mText: "No Notes Found",color: Colors.grey.shade600,),),)*/