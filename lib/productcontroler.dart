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

  Future<bool> creatproduct(String name,String img,int qty,int unitprice,int totalprice)async{
    final response=await http.post(Uri.parse(Urls.creatproduct),
        headers: {'Content-Type': 'application/json'},
      body: jsonEncode(
          {
            "ProductName": name,
            "ProductCode": DateTime.now().microsecondsSinceEpoch,
            "Img": img,
            "Qty": qty,
            "UnitPrice": unitprice,
            "TotalPrice": totalprice

          }
      )
    );

    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      await fetchproduct();
      return true;
    }
    else{
      return false;
    }

  }

  Future<bool> Deletproduct(String productid) async {
    final response = await http.get(Uri.parse(Urls.deletproduct(productid)));

    if(response.statusCode == 200){
      return true;
    }
    else{
      return false;
    }
  }
}