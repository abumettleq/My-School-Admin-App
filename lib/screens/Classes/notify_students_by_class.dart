import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Provider/classes_provider.dart';
import 'package:my_school_admin_app/Provider/people_provider.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NotifyStudentsByClass extends StatefulWidget {
  final String classId;

  const NotifyStudentsByClass({Key? key, required this.classId}) : super(key: key);

  @override
  _NotifyStudentsByClassState createState() => _NotifyStudentsByClassState();
}

class _NotifyStudentsByClassState extends State<NotifyStudentsByClass> {
  late TextEditingController _notifController;
  late RoundedLoadingButtonController _btnController;

  @override
  void initState() {
    super.initState();
    _notifController = TextEditingController(text: '');
    _btnController = RoundedLoadingButtonController();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ClassesProvider>(
      builder: (context, classesProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Notify All Students in Class ${widget.classId}'),
            backgroundColor: Colors.indigo,
            elevation: 0,
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade700, Colors.indigo.shade200],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send a Notification to class ${widget.classId}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _notifController,
                  decoration: const InputDecoration(
                    labelText: "Notification's text",
                    labelStyle: TextStyle(color: Colors.white),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  style: const TextStyle(color: Colors.white),
                  maxLines: 3,
                ),
                const SizedBox(height: 20),
                Center(
                  child: RoundedLoadingButton(
                    onPressed: () async {
                      await classesProvider.notifyStudentsByClass(widget.classId, _notifController.text);
                      _btnController.reset();
                    },
                    controller: _btnController,
                    color: Colors.deepOrange,
                    child: const Text(
                      'Notify',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
