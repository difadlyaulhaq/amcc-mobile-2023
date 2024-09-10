import 'package:flutter/material.dart';
import 'note_detail_page.dart';
import 'add_note_page.dart';

class NotesHomePage extends StatefulWidget {
  const NotesHomePage({super.key});

  @override
  _NotesHomePageState createState() => _NotesHomePageState();
}

class _NotesHomePageState extends State<NotesHomePage> {
  List<Map<String, dynamic>> notes = [
    {
      'date': '28 May',
      'title': 'Task Management App Ui Design',
      'content': 'In publishing and graphic design, Lorem ipsum is a placeholder text commonly used.',
      'status': 'Just Now',
      'isTask': false,
    },
    {
      'date': '12 May',
      'title': 'Shopping List',
      'content': ['Apple', 'Mango Juice', 'Banana 5 pcs with', 'ButterMilk'],
      'status': '1h ago',
      'isTask': true,
      'completedTasks': ['Apple'],
    }
  ];

  void addNewNote(String title, String content) {
    setState(() {
      notes.add({
        'date': 'Today',
        'title': title,
        'content': content,
        'status': 'Just Now',
        'isTask': false,
      });
    });
  }

  void openNotePage(BuildContext context, Map<String, dynamic> note) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NoteDetailPage(note: note),
      ),
    );
  }

  void openAddNotePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddNotePage(
          onSave: (String title, String content) {
            addNewNote(title, content);
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Hello,\nMy Notes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Here',
                prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => openNotePage(context, notes[index]),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              notes[index]['date'],
                              style: const TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              notes[index]['title'],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            if (notes[index]['isTask'])
                              ...notes[index]['content'].map<Widget>((task) {
                                bool isCompleted = notes[index]['completedTasks'].contains(task);
                                return Row(
                                  children: [
                                    Checkbox(value: isCompleted, onChanged: (val) {}),
                                    Text(task),
                                  ],
                                );
                              }).toList()
                            else
                              Text(
                                notes[index]['content'],
                                style: const TextStyle(color: Colors.black54),
                              ),
                            const SizedBox(height: 5),
                            Text(
                              notes[index]['status'],
                              style: const TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => openAddNotePage(context),
        backgroundColor: Colors.purple,
        child: const Icon(Icons.add),
      ),
    );
  }
}
