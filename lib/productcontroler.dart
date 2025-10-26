import 'dart:convert';

import 'Utils/urls.dart';
import 'model/productmodel.dart';
import 'package:http/http.dart' as http;
class Productcontroler{
  List<Data> Products=[];

  Future fetchproduct() async{
    final response = await http.get(Uri.parse(Urls.Readproduct));

    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      Productmodel model = Productmodel.fromJson(data);
      Products =model.data ?? [];
    }
  }
}