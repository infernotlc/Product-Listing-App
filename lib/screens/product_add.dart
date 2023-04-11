import 'package:flutter/material.dart';
import 'package:sqflite_demo/data/dbHelper.dart';
import '../models/product.dart';

class ProductAdd extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProductAddState();
  }
}

class ProductAddState extends State {
  var dbHelper = DbHelper();
  var txtName = TextEditingController();
  var txtDescription = TextEditingController();
  var txtUnitPrice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Product"),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            buildNameField(),
            buildDescriptionField(),
            buildUnitPriceField(),
            buildSaveButton(),
          ],
        ),
      ),
    );
  }

  buildNameField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Name"),
      controller: txtName,
    );
  }

  buildDescriptionField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Desription"),
      controller: txtDescription,
    );
  }

  buildUnitPriceField() {
    return TextField(
      decoration: InputDecoration(labelText: "Product Unit Price"),
      controller: txtUnitPrice,
    );
  }

  buildSaveButton() {
    return TextButton(
      child: Text("Add"),
      onPressed: () {
        addProduct();
      },
    );
  }

  void addProduct() async {
    var unitPrice = double.tryParse(txtUnitPrice.text) ?? 0.0;
    var product = Product(
        name: txtName.text,
        description: txtDescription.text,
        unitPrice: double.parse(txtUnitPrice.text));
    var result = await dbHelper.insert(product);
    Navigator.pop(context, true);
  }
}
