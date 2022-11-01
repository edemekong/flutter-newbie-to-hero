import 'package:flutter/material.dart';
import 'package:state_manage_intro/storage_service.dart';

import 'get_it.dart';

class NextScreen extends StatelessWidget {
  const NextScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final storageService = GetItService.getIt.get<StorageService>();

    final name = storageService.name;
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ""),
      ),
    );
  }
}
