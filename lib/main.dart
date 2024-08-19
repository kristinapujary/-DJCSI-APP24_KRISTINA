import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'note.dart';
import 'dart:math';
import 'colour.dart';
import 'addnote.dart';

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
            MaterialPageRoute(builder: (context) => NewNote()),
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
        onPressed: () async{
          final result= await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewNote()),
          );
          if (result != null && result is List<String>){
            setState(() {
              sample.add(
                  Note(
                      id: sample.length + 1 ,
                      title: result[0] ,
                      content: result[1]));
              foundNotes=List.from(sample);
            });
          }
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





