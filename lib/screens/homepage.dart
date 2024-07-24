import 'package:flutter/material.dart';
import 'package:focuslist/model/todo.dart';
import 'package:focuslist/widget/todo_item.dart';

class home_page extends StatefulWidget {
  home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  final todosList = ToDo.todoList();
  List<ToDo> _foundToDo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   // SystemUiOverlayStyle(statusBarColor: Colors.transparent);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.menu_outlined,
                size: 50,
                color: Colors.amber,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/ayush_image.jpeg'),
              )
            ],
          ),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                
                const SizedBox(
                  height: 10,
                ),
                searchBox(),
                Container(
                  height: 600,
                  child: ListView(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        child: Text(
                          'All ToDos',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (ToDo todo in _foundToDo.reversed)
                        ToDoItem(
                          todo: todo,
                          onToDoChanged: _handleToDoChange,
                          onDeleteItem: _deleteToDoItem,
                        ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Stack(
                children:[ Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(
                          bottom: 20,
                          right: 20,
                          left: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 0.0),
                              blurRadius: 10.0,
                              spreadRadius: 0.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          controller: _todoController,
                          decoration: InputDecoration(
                              hintText: 'Add a new todo item',
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 20, right: 20),
                      child: ElevatedButton(
                        onPressed: () {
                          _addToDoItem(_todoController.text);
                        },
                        child: Text(
                          '+',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 228, 140, 33),
                          minimumSize: Size(60, 60),
                          elevation: 10,
                        ),
                      ),
                    )
                  ],
                ),]
              ),
            )
          ],
        ),
      ),
    );
  }

  void _handleToDoChange(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((item) => item.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(
        ToDo(
            id: DateTime.now().millisecondsSinceEpoch.toString(),
            todoText: toDo),
      );
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyWord) {
    List<ToDo> results = [];
    if (enteredKeyWord.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((item) => item.todoText!
              .toLowerCase()
              .contains(enteredKeyWord.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  Widget searchBox() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextFormField(
        
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 30,
            maxWidth: 30,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
