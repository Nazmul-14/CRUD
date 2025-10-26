
import 'package:crud/productcontroler.dart';
import 'package:crud/widget/productcurd.dart';
import 'package:flutter/material.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  Productcontroler productcontroler = Productcontroler();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productcontroler.fetchproduct();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Crud'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.8
          ),
          itemCount: productcontroler.Products.length,
          itemBuilder: (context,index){
            var PRODUCT = productcontroler.Products[index];
            return Productcrud(product: PRODUCT);
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}, child: Icon(Icons.add),),

    );
  }
}


