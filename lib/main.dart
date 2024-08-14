import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Main(),
));

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(37 , 37, 37, 1),
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
          IconButton(
              onPressed: (){
          },
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )
          ),
          IconButton(
              onPressed: (){
              },
              icon: Icon(
                Icons.info,
                color: Colors.white,
              )
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
        backgroundColor: Color.fromRGBO(37,37,37,1),
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Container(
            child: Icon(
              Icons.add ,
              color: Colors.white,
            ),
        ),
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
    return Scaffold(backgroundColor: Color.fromRGBO(37,37,37,1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(37,37,37,1),
        leading: FloatingActionButton(
            onPressed: () => _dialogBackBox(context),
            backgroundColor: Color.fromRGBO(59,59,59,1),
            child: Container(
                child: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                )
            )
        ),
        actions: [
          FloatingActionButton(
              onPressed: (){},
              backgroundColor: Color.fromRGBO(59,59,59,1),
              child: Container(
                  child: Icon(
                    Icons.visibility,
                    color: Colors.white,
                  )
              )
          ),
          SizedBox(width: 20),
          FloatingActionButton(
              onPressed: () => _dialogSaveBox(context),
              backgroundColor: Color.fromRGBO(59,59,59,1),
              child: Container(
                  child: Icon(
                    Icons.save,
                    color: Colors.white,
                  )
              )
          ),
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
              padding: EdgeInsets.only(left:24),
              child: TextField(
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
                  fontSize:23.0,
                ),
              ),
            ),
          )
        ],
      ),

    );
  }
  Future<void> _dialogBackBox (BuildContext context){
              return showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    backgroundColor: Color.fromRGBO(37,37,37,1),
                    title: Center(
                      child: Column(
                        children: [
                          Icon(
                              Icons.info,
                              color: Colors.white,
                          ),
                          Text(
                            'Are you sure you want to discard your changes?',
                            style: TextStyle(
                              color: Color.fromRGBO(207, 207, 207, 1),
                              fontSize: 23.0,
                              fontFamily: 'Nunito',
                            ),
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Main()),
                          );
                        },
                        child: Text(
                            'Discard',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> Home()),
                          );
                        },
                        child: Text(
                          'Keep',
                        ),
                      ),
                    ],
                  );
                }
              );
  }

  Future<void> _dialogSaveBox (BuildContext context){
    return showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            backgroundColor: Color.fromRGBO(37,37,37,1),
            title: Center(
              child: Column(
                children: [
                  Icon(
                    Icons.info,
                    color: Colors.white,
                  ),
                  //SizedBox(height: 33.0, width: 33.0,),
                  Text(
                    'Save changes?',
                    style: TextStyle(
                      color: Color.fromRGBO(207, 207, 207, 1),
                      fontSize: 23.0,
                      fontFamily: 'Nunito',
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context)=> Home()),
                  );
                },
                child: Text(
                  'Discard',
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Main()),
                  );
                },
                child: Text(
                  'Save',
                ),
              ),
            ],
          );
        }
    );
  }
}








