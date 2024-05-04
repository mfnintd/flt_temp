import 'dart:convert';

import 'package:example_code/model.dart';
import 'package:http/http.dart' as http;

class PersonServices {
  static Future<List<Person>> getData() async {
    late List<Person> tmp;
    //var res = http.post(Uri.parse('ajsdklasjdlkasdj'), body: 'asjhdashdkjasdk');
    var response = await http.get(Uri.parse('https://6633ca12f7d50bbd9b4aaaaa.mockapi.io/flutterHIT/Person'),);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body) as List<dynamic>;
      tmp = List.generate(body.length, (index) => Person.fromJson(body[index]));
    } else {
      //làm gì đó?
    }
    return tmp;
  }
}
