import 'package:flutter/material.dart';
import 'package:my_school_admin_app/Provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class NotifySpecificUser extends StatefulWidget {
  final String userId;

  const NotifySpecificUser({Key? key, required this.userId})
      : super(key: key);

  @override
  _NotifySpecificUserState createState() => _NotifySpecificUserState();
}

class _NotifySpecificUserState extends State<NotifySpecificUser> {
  late TextEditingController _notifController;
  late RoundedLoadingButtonController _btnController;

  @override
  void initState() {
    super.initState();
    _notifController =
        TextEditingController(text: '');
    _btnController = RoundedLoadingButtonController();
  }
  
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Notify User ${widget.userId}'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: 
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: _notifController,
                  decoration: const InputDecoration(labelText: "Notifiaction's text"),
                ),
                const SizedBox(height: 16),
            RoundedLoadingButton(
              onPressed: () async {
                await userProvider.notifyUser(widget.userId, _notifController.text);
                _btnController.reset();
              },
              controller: _btnController,
              child: const Text('Notify'),
            ),
              ],
            )
          )
        );
      }
    );
  }
  
}