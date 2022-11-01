import 'package:flutter/material.dart';
import 'package:state_manage_intro/next_screen.dart';
import 'package:state_manage_intro/storage_service.dart';

import 'get_it.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final storageService = GetItService.getIt.get<StorageService>();

  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    setState(() {
      isLoading = true;
    });
    await storageService.fetchData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              // StorageService.instance.updateName("Emmanuel");
              Navigator.push(context, MaterialPageRoute(builder: (_) => const NextScreen()));
            },
            child: Text("Update Name + ${storageService.name}"),
          ),
        ],
      ),
    );
  }
}
