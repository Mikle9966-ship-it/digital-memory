import 'package:flutter/material.dart';

void main() {
  runApp(DigitalMemoryApp());
}

class DigitalMemoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Memory',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: MemoryHomePage(),
    );
  }
}

class MemoryHomePage extends StatefulWidget {
  @override
  _MemoryHomePageState createState() => _MemoryHomePageState();
}

class _MemoryHomePageState extends State<MemoryHomePage> {
  final List<String> _memories = [];
  final TextEditingController _controller = TextEditingController();

  void _addMemory() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      setState(() {
        _memories.add(text);
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Digital Memory')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Add a memory',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addMemory,
                ),
              ),
              onSubmitted: (_) => _addMemory(),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _memories.length,
                itemBuilder: (context, index) => ListTile(
                  leading: Icon(Icons.memory),
                  title: Text(_memories[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
