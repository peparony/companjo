import 'package:hive/hive.dart';
import '../models/task.dart';

class StorageService {
  static late Box<Task> _taskBox;

  static Future<void> init() async {
    _taskBox = await Hive.openBox<Task>('tasks');
  }

  static List<Task> getAllTasks() {
    return _taskBox.values.toList();
  }

  static Future<void> addTask(Task task) async {
    await _taskBox.add(task);
  }

  static Future<void> deleteTask(int index) async {
    await _taskBox.deleteAt(index);
  }

  static Future<void> toggleTaskDone(int index) async {
    final task = _taskBox.getAt(index);
    if (task != null) {
      task.isDone = !task.isDone;
      await task.save();
    }
  }
}
