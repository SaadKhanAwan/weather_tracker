import 'dart:convert';
import 'package:http/http.dart' as http;

class Networkhelper {
  String url;
  Networkhelper({required this.url});

  Future getwatherdata() async {
    // here will be link of api where it use
    // here await is use because we want ot wait until api is get
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = response.body;
      // here i am returning jsondecode for api use in future
      return jsonDecode(data);
    }
  }
}
