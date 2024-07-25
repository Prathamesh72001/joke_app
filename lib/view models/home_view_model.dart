import 'package:flutter/material.dart';
import 'package:joke_app/service/api_service.dart';
import 'package:joke_app/service/hive.dart';

class HomeViewModel extends ChangeNotifier {
  String joke = "";

  String get response {
    return joke;
  }

  Future<void> getJoke(BuildContext context) async {
    var data = await ApiService.getJoke(context);
    AppHive.save_joke("Setup : ${data!.setup}\nPunchlne : ${data.punchline}");
    joke = "Setup : ${data.setup}\nPunchlne : ${data.punchline}";
    notifyListeners();
  }
}
