import 'package:flutter/material.dart';
import 'main.dart';
import 'note.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        leading: FloatingActionButton(
            onPressed: () => _dialogBackBox(context),
            backgroundColor: Color.fromRGBO(59, 59, 59, 1),
            child: Container(
                child: Icon(
              Icons.chevron_left,
              color: Colors.white,
            ))),
        actions: [
          FloatingActionButton(
              onPressed: () {},
              backgroundColor: Color.fromRGBO(59, 59, 59, 1),
              child: Container(
                  child: Icon(
                Icons.visibility,
                color: Colors.white,
              ))),
          SizedBox(width: 20),
          FloatingActionButton(
              onPressed: () => _dialogSaveBox(context, _titleController , _contentController),
              backgroundColor: Color.fromRGBO(59, 59, 59, 1),
              child: Container(
                  child: Icon(
                Icons.save,
                color: Colors.white,
              ))),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(height: 141.0,),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(154, 154, 154, 1),
                    fontSize: 48.0,
                  ),
                ),
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 35.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 24),
              child: TextField(
                controller: _contentController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type Something..',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(154, 154, 154, 1,),
                    fontSize: 23.0,
                  ),
                ),
                style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1,),
                  fontSize: 23.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

Future<void> _dialogBackBox(BuildContext context) async{
  final discard= await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(37, 37, 37, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Center(
            child: Column(
              children: [
                Icon(
                  Icons.info,
                  color: Color.fromRGBO(96, 96, 96, 1),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Are you sure you want to discard your changes?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromRGBO(207, 207, 207, 1),
                    fontSize: 23.0,
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                         true,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      child: Text(
                        'Discard',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                          false,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(48, 190, 113, 1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                      ),
                      child: Text(
                        'Keep',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      });
  if (discard ==true){
    Navigator.pop(context);
  }
  else{
    null;
  }
}


Future<void> _dialogSaveBox(BuildContext context, TextEditingController _titleController, TextEditingController _contentController) async{
  final shouldSave= await showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(37, 37, 37, 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.info,
                color: Color.fromRGBO(96, 96, 96, 1),
                //size:40.0,
              ),
              SizedBox(height: 20.0,),
              Text(
                'Save changes?',
                style: TextStyle(
                  color: Color.fromRGBO(207, 207, 207, 1),
                  fontSize: 18.0,
                  fontFamily: 'Nunito',
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: Text(
                      'Discard',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        true,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(48, 190, 113, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      });
  if (shouldSave== true){
    if( _titleController.text.isNotEmpty || _contentController.text.isNotEmpty){
      Navigator.pop(context, [_titleController.text, _contentController.text]);
    }
  }
  else{
    _titleController.clear();
    _contentController.clear();
  }
}
