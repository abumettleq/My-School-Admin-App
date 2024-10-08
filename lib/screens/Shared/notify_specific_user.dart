import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Provider/people_provider.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NotifySpecificUser extends StatefulWidget {
  final String userId;

  const NotifySpecificUser({Key? key, required this.userId}) : super(key: key);

  @override
  _NotifySpecificUserState createState() => _NotifySpecificUserState();
}

class _NotifySpecificUserState extends State<NotifySpecificUser> {
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
    return Consumer<PeopleProvider>(
      builder: (context, peopleProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Notify User ${widget.userId}'),
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
                  'Send a Notification to User ${widget.userId}',
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
                      await peopleProvider.notifyUser(widget.userId, _notifController.text);
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
