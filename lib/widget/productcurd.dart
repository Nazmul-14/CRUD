import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/productmodel.dart';

class Productcrud extends StatelessWidget {
  final Data product;
  final VoidCallback onDelete;
  const Productcrud({
    super.key,
    required this.product,
    required this.onDelete,
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
                      product.img.toString().isNotEmpty &&
                      product.img.toString().startsWith('http'))
                      ? product.img.toString()
                      : 'https://media.istockphoto.com/id/1956667539/vector/stop-sign-symbol-icon.jpg?s=612x612&w=0&k=20&c=enyDi5bXWraO1ShOD-ZssxhJmmpxaM5VM6xvKtFVGkg=',
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
                  onPressed: onDelete,
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
