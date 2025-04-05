import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/task.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 // final user=FirebaseAuth.instance.currentUser;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _taskcontroller;
  void savedata() async
  {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    Task t=Task.fromString(_taskcontroller.text);
    prefs.setString('task',json.encode(t.getMap()));
    _taskcontroller.text='';

  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _taskcontroller=TextEditingController();
  }
  @override
  void dispose() {
    _taskcontroller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Daily task manager',style: GoogleFonts.agbalumo()),backgroundColor:Color.fromRGBO(176, 4, 4, 0.855),),
      body:Center(child: Text('No tasks added yet'),),backgroundColor: const Color.fromARGB(255, 235, 207, 197),
      floatingActionButton: FloatingActionButton(
      child: Icon(
        Icons.add,
        color:const Color.fromRGBO(239, 241, 240, 1),
        
      ),
      backgroundColor: const Color.fromARGB(239, 189, 7, 16),
      onPressed:(){showModalBottomSheet(context: context, builder:(BuildContext context)
      => Container(
        padding: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 164, 28, 28),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('add task',style: GoogleFonts.montserrat(color:const Color.fromARGB(238, 239, 236, 236),fontSize: 20.0),),
                GestureDetector(
                  onTap: ()=>Navigator.of(context).pop(),
                  child: Icon(Icons.close),),

              ],
            ),
            Divider(
               thickness: 1.2,color: Colors.black
            ),
            SizedBox(height: 6.0,),
            TextField(
              controller: _taskcontroller,
              decoration: InputDecoration(border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide(color: Colors.black12),
              ),
              fillColor: const Color.fromARGB(255, 246, 244, 243),
              filled: true,
              hintText: 'enter task',
              hintStyle: GoogleFonts.agbalumo(),iconColor: Colors.black,
              ),
            ),
            SizedBox(height: 9.0,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal:5.0),
              width:MediaQuery.of(context).size.width,
              height: 30,
              child: Row(
                children: [
                  Container(
                    width: (MediaQuery.of(context).size.width/2)-450,
                    child: ElevatedButton(
                     
                      onPressed:()=>_taskcontroller.text='',
                       style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(202, 224, 109, 77)),
                       child:Text('Reset',style: GoogleFonts.agbalumo(),selectionColor:Color.fromRGBO(71, 50, 164, 0.184),))),
                  Container(
                     width: (MediaQuery.of(context).size.width/2)-450,
                    child: ElevatedButton(onPressed:()=>savedata(), child:Text('add',style: GoogleFonts.aBeeZee(),)))
              
                ],
              
              ),
            ),

          ],
        ),
      ),

      
      );},
    )

    );
    
  }
}