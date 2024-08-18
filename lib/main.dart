import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'note.dart';
import 'dart:math';
import 'colour.dart';

void main() => runApp(MaterialApp(
      home: Main2(),
    ));

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontSize: 43.0,
          ),
        ),
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        actions: [
          Container(
            height: 50.0,
            width: 50.0,
            child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(59, 59, 59, 1),
                onPressed: () {},
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
          SizedBox(width: 10.0),
          Container(
            height: 50.0,
            width: 50.0,
            child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(59, 59, 59, 1),
                onPressed: () {},
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/pic.png'),
          ),
          Center(
            child: Text(
              'Create your first note!',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito',
                fontSize: 20.0,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Container(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
      ),
    );
  }
}

class Main2 extends StatefulWidget {
  const Main2({super.key});

  @override
  State<Main2> createState() => _Main2State();
}

class _Main2State extends State<Main2> {

  List<Note> foundNotes=[];

  @override
  void initState(){
    super.initState();
    foundNotes= sample;
  }

  bool _searchBar= false;

  void _toggleSearchBar(){
    setState(() {
      _searchBar= !_searchBar;
    });
  }

  bool _deleteButton = false;

  void _toggleDeleteButton(){
    setState(() {
      _deleteButton= !_deleteButton;
    });
  }

  void searchText(String text){
   setState(() {
     foundNotes= sample.where((note) => note.content.toLowerCase().contains(text.toLowerCase())
         || note.title.toLowerCase().contains(text.toLowerCase())).toList();
   });
  }

  getColor() {
    Random random = Random();
    return backgroundColor[random.nextInt(backgroundColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37, 37, 37, 1),
      appBar: AppBar(
        title: Text(
          'Notes',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Nunito',
            fontSize: 43.0,
          ),
        ),
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        actions: [
          Container(
            height: 50.0,
            width: 50.0,
            child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(59, 59, 59, 1),
                onPressed: _toggleSearchBar,
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                )),
          ),
          SizedBox(width: 10.0),
          Container(
            height: 50.0,
            width: 50.0,
            child: FloatingActionButton(
                backgroundColor: Color.fromRGBO(59, 59, 59, 1),
                onPressed: _toggleDeleteButton,
                child: Icon(
                  Icons.info,
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          if (_searchBar)
            Padding(padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: searchText,
              style: TextStyle(color: Colors.white, fontSize: 23,),
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(59, 59, 59, 1),
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintText: 'Search notes...',
                hintStyle: TextStyle(color: Colors.grey),
                prefixIcon: Icon(Icons.search, color:Colors.grey),
              ),
            ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: foundNotes.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    color: getColor(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListTile(
                        title: Text(
                          '${foundNotes[index].title}',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Nunito',
                            fontWeight: FontWeight.w400,
                            fontSize: 25.0,
                          ),
                        ),
                        trailing: _deleteButton ?
                        IconButton(
                            onPressed: (){
                              setState(() {
                                sample.remove(foundNotes[index]);
                                foundNotes=sample;
                              });
                            },
                            icon: Icon(Icons.delete, size: 20,),
                        )
                        :null
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(37, 37, 37, 1),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Container(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
      ),
    );
  }
}




class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
              onPressed: () => _dialogSaveBox(context),
              backgroundColor: Color.fromRGBO(59, 59, 59, 1),
              child: Container(
                  child: Icon(
                Icons.save,
                color: Colors.white,
              ))),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 141.0,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: TextField(
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type Something..',
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(
                      154,
                      154,
                      154,
                      1,
                    ),
                    fontSize: 23.0,
                  ),
                ),
                style: TextStyle(
                  color: Color.fromRGBO(
                    255,
                    255,
                    255,
                    1,
                  ),
                  fontSize: 23.0,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> _dialogBackBox(BuildContext context) {
    return showDialog(
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
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Main()),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
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
  }

  Future<void> _dialogSaveBox(BuildContext context) {
    return showDialog(
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
                SizedBox(
                  height: 20.0,
                ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Home()),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Main()),
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
  }
}
