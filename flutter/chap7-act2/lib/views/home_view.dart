import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/task_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestionnaire de Tâches'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const AddTaskField(),
          const Expanded(
            child: Row(
              children: [
                Expanded(child: TodoList()),
                Expanded(child: DoneList()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AddTaskField extends StatefulWidget {
  const AddTaskField({super.key});

  @override
  State<AddTaskField> createState() => _AddTaskFieldState();
}

class _AddTaskFieldState extends State<AddTaskField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final controller = Provider.of<TaskController>(context, listen: false);
    controller.addTask(_controller.text);
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onSubmitted: (_) => _submit(),
              decoration: const InputDecoration(
                hintText: 'Nouvelle tâche...',
                border: OutlineInputBorder(),
                isDense: true,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(onPressed: _submit, child: const Text('Ajouter')),
        ],
      ),
    );
  }
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context);

    return Container(
      color: Colors.orange.shade100,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'À faire (${controller.todoCount})',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                onPressed: controller.clearTodo,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.todoTasks.length,
              itemBuilder: (context, index) {
                final task = controller.todoTasks[index];
                return Card(
                  child: ListTile(
                    dense: true,
                    title: Text(task.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () => controller.completeTask(task),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class DoneList extends StatelessWidget {
  const DoneList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<TaskController>(context);

    return Container(
      color: Colors.green.shade100,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Terminées (${controller.doneCount})',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red, size: 20),
                onPressed: controller.clearDone,
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.doneTasks.length,
              itemBuilder: (context, index) {
                final task = controller.doneTasks[index];
                return Card(
                  child: ListTile(
                    dense: true,
                    title: Text(task.title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.red),
                      onPressed: () => controller.deleteDoneTask(task),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}