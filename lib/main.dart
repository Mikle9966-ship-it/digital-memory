
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(DigitalMemoryApp());
}

class DigitalMemoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Memory',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: MemoryHomePage(),
    );
  }
}

class MemoryHomePage extends StatefulWidget {
  @override
  _MemoryHomePageState createState() => _MemoryHomePageState();
}

class _MemoryHomePageState extends State<MemoryHomePage> {
  List<String> _memories = [];
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMemories();
  }

  Future<void> _loadMemories() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _memories = prefs.getStringList('memories') ?? [];
    });
  }

  Future<void> _addMemory() async {
    final text = _controller.text;
    if (text.isEmpty) return;

    setState(() {
      _memories.add(text);
      _controller.clear();
    });

    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('memories', _memories);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Digital Memory')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter memory',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: _addMemory, child: Text('Save')),
          Expanded(
            child: ListView.builder(
              itemCount: _memories.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(_memories[index]));
              },
            ),
          ),
        ],
      ),
    );
  }
}
