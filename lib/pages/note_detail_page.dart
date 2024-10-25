import 'package:flutter/material.dart';

class NoteDetailPage extends StatelessWidget {
  final Map<String, dynamic> note;

  const NoteDetailPage({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              note['title'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            if (note['isTask'])
              ...note['content'].map<Widget>((task) {
                bool isCompleted = note['completedTasks'].contains(task);
                return Row(
                  children: [
                    Checkbox(value: isCompleted, onChanged: (val) {}),
                    Text(task),
                  ],
                );
              }).toList()
            else
              Text(note['content']),
          ],
        ),
      ),
    );
  }
}
