import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_provider/user.dart';
import 'package:rest_api_with_provider/user_provider.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<UserProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('RESTAPI with provider'),
      ),
      body: ListView.builder(
        itemCount: state.users.length,
        itemBuilder: (context, index) {
          final User user = state.users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}
