import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown.shade900),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView.builder(
        itemCount: 100,
        itemBuilder: (context, index) {
          index +-1;
          return Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(color: Colors.grey.shade200),
            child: ListTile(
              title: Text(
                'Name $index',
                style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            leading: const Icon(
              Icons.people_alt_outlined,
              color: Colors.black
              ),
              trailing: IconButton(
                onPressed: () => {Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) =>
                    showDetails(index: index)))
                    },
                icon: const Icon(
                  Icons.forward,
                  color: Colors.blue,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// newScreen
// ignore: camel_case_types
class showDetails extends StatelessWidget {

  final int index;
  const showDetails ({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(
        'Details $index',
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
        ),
        body: Center(
          child: Text(
            'WELCOME TO #$index NAME!', 
            style: const TextStyle(fontSize: 20),
          ),
        ),
    );
  }
}