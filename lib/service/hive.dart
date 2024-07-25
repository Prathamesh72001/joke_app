import 'package:hive/hive.dart';

class AppHive {
  static Box<dynamic>? box;
  static List<String> jokes = [];
  static init() async {
    box = await Hive.openBox('myBox');
  }

  static save_joke(String joke) {
    jokes.add(joke);
    box?.put('jokes', jokes);
  }

  static String get_joke() {
    List<String> jokes = box?.get('jokes');
    if(jokes.isNotEmpty){
          return "";
    }else{
      jokes.shuffle();
      return jokes.first;
    }
  }
}
