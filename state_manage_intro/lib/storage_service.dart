class StorageService {
  String? name;

  void updateName(String value) {
    name = value;
  }

  Future<String> fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    name = "Emmanuel Future....";
    return name!;
  }
}

// class StorageService {
//   StorageService._();

//   static StorageService? _instance;

//   static StorageService get instance {
//     if (_instance == null) {
//       _instance = StorageService._();
//     }

//     return _instance!;
//   }

//   String? name;

//   void updateName(String value) {
//     name = value;
//   }

//   Future<String> fetchData() async {
//     await Future.delayed(const Duration(seconds: 2));

//     name = "Emmanuel Future....";
//     return name!;
//   }
// }

