import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/productmodel.dart';

class Productcrud extends StatelessWidget {
  final Data product;
  const Productcrud({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        color: Colors.grey[200],
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: SizedBox(
                height: 150,
                child: Image.network(
                  (product.img != null &&
                      product.img.toString().startsWith('http'))
                      ? product.img.toString()
                      : 'https://www.freeiconspng.com/thumbs/no-image-icon/no-image-icon-6.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              product.productName.toString(),
              style: const TextStyle(
                fontSize: 19,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Price: \$${product.unitPrice} | QTY: ${product.qty}',
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.edit, color: Colors.orange),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
