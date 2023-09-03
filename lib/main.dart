import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../widget/todo_item.dart';
import '../model/todo.dart';
import '../constants/colors.dart';

void main() {
  runApp(const FocusList());
}

class FocusList extends StatelessWidget {
  const FocusList({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 228, 140, 33),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 225, 225, 225)),
        useMaterial3: true,
      ),
      initialRoute: "/start",
      routes: {
        '/start': (context) => const start_page(),
        '/home': (context) => home_page(),
      },
    );
  }
}

class start_page extends StatelessWidget {
  const start_page({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 225, 225),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text("FocusList",
                    style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 238, 191, 49))),
              ),
              const SizedBox(
                height: 20,
              ),
              Image.asset("images/todo.jpg"),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: Text("Welcome to FocusList",
                    style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.bold)),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: Text(
                    "FocusList will help you to stay\n  organized and perform your\n          tasks much faster.",
                    style: TextStyle(
                        fontSize: 15, color: Color.fromARGB(255, 0, 0, 0))),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                    child: const Text(
                      "Get Started",
                      style: TextStyle(),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home_page()));
                    },
                    style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 228, 140, 33)),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

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
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);

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
                const Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: Color.fromARGB(255, 228, 140, 33),
                  child: ListTile(
                    trailing: Icon(
                      Icons.tab_sharp,
                      size: 50,
                    ),
                    leading: Text(
                      'Manage your\n '
                      'time well',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    'Categories',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            iconSize: MaterialStateProperty.all(20),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.work_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Work',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            iconSize: MaterialStateProperty.all(20),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Personal',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            iconSize: MaterialStateProperty.all(20),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Shopping',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor),
                            iconSize: MaterialStateProperty.all(20),
                          ),
                          onPressed: () {},
                          child: const Icon(
                            Icons.heart_broken_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          'Health',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                searchBox(),
                Expanded(
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
              child: Row(
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
      todosList.add(ToDo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoText: toDo));
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
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
