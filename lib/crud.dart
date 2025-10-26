
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

  Future fatchdata() async {
    await productcontroler.fetchproduct();
    setState(() {

    });
  }
  productdailog(
      {String ? id,String ? name,String ? img,int ? qty,int ? uniprice,int ? totalprice, required bool isupdate}){
    TextEditingController Productnamecontroler= TextEditingController();
    TextEditingController ProductIMGcontroler= TextEditingController();
    TextEditingController ProductQTYcontroler= TextEditingController();
    TextEditingController ProductUNITPEICEcontroler= TextEditingController();
    TextEditingController ProductTOTALpricecontroler= TextEditingController();
    showDialog(context: context, builder: (context)=>AlertDialog(
      title: Text(isupdate? 'Update product' : 'Add product'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: Productnamecontroler,
            decoration: InputDecoration(
              labelText: 'Product Name',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: ProductIMGcontroler,
            decoration: InputDecoration(
              labelText: 'Product Img',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: ProductQTYcontroler,
            decoration: InputDecoration(
              labelText: 'Product Qty',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: ProductUNITPEICEcontroler,
            decoration: InputDecoration(
              labelText: 'Product Unitpeice',
            ),
          ),
          SizedBox(height: 10,),
          TextField(
            controller: ProductTOTALpricecontroler,
            decoration: InputDecoration(
              labelText: 'Product TotalPrice',
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancle')),
              ElevatedButton(onPressed: () async {
                await productcontroler.creatproduct(Productnamecontroler.text ,ProductIMGcontroler.text,int.parse(ProductQTYcontroler.text), int.parse(ProductUNITPEICEcontroler.text), int.parse(ProductTOTALpricecontroler.text));
                setState(() {

                });

                Navigator.pop(context);
              }, child: Text('Save'))
            ],
          )
        ],
      ),
    ));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fatchdata();
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
            return Productcrud(product: PRODUCT, onDelete: () {
              productcontroler.Deletproduct(PRODUCT.sId.toString()).then((value) async {
                if(value){
                  await productcontroler.fetchproduct();
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Product Deleted'),
                        )
                    );
                  });
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Something Wrong...'),
                      )
                  );
                }

                });
            },);
          }
      ),
      floatingActionButton: FloatingActionButton(onPressed:() {
        productdailog(isupdate: false);
        },
        child: Icon(Icons.add),),

    );
  }
}


