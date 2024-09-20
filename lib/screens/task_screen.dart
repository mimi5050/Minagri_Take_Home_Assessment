import 'package:flutter/material.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  // Task data structure
  final List<Task> tasks = [
    Task(title: 'Submit project report', isCompleted: false, dueDate: 'Due: Today', assignedTo: 'Miriam Uwingabiye', profileImage: 'assets/images/person1.png'),
    Task(title: 'Team meeting', isCompleted: true, dueDate: 'Due: Tomorrow', assignedTo: 'Alice Kabera', profileImage: 'assets/images/person2.png'),
    Task(title: 'Review codebase', isCompleted: false, dueDate: 'Due: 2 days ago', assignedTo: 'Michael Mugisha', profileImage: 'assets/images/person3.png'),
    Task(title: 'Client follow-up', isCompleted: false, dueDate: 'Due: Next Week', assignedTo: 'Tuyizere', profileImage: 'assets/images/person4.png'),
    Task(title: 'Prepare presentation slides', isCompleted: true, dueDate: 'Due: In 3 days', assignedTo: 'Aimee Ishimwe', profileImage: 'assets/images/person1.png'),
  ];

  // Toggle task completion
  void _toggleTaskCompletion(int index) {
    setState(() {
      tasks[index].isCompleted = !tasks[index].isCompleted;
    });
  }

  // Add a new task (stub function)
  void _addTask() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        backgroundColor: const Color(0xFF7980FF),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addTask,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskItem(
              task: tasks[index],
              onTaskToggle: () => _toggleTaskCompletion(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTask,
        child: const Icon(Icons.add),
        backgroundColor: const Color(0xFF7980FF),
      ),
    );
  }
}

class TaskItem extends StatelessWidget {
  final Task task;
  final VoidCallback onTaskToggle;

  const TaskItem({
    required this.task,
    required this.onTaskToggle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            onTaskToggle();
          },
          activeColor: const Color(0xFF7980FF),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.dueDate,
              style: TextStyle(
                color: task.isCompleted ? Colors.green : Colors.red,
              ),
            ),
            SizedBox(height: 4.0),
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(task.profileImage),
                  radius: 16,
                ),
                const SizedBox(width: 8.0),
                Text(
                  task.assignedTo,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Task {
  final String title;
  bool isCompleted;
  final String dueDate;
  final String assignedTo;
  final String profileImage;

  Task({
    required this.title,
    this.isCompleted = false,
    required this.dueDate,
    required this.assignedTo,
    required this.profileImage,
  });
}
