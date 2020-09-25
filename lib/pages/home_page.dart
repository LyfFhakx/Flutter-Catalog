import 'package:flutter/material.dart';
import 'package:flutter_app/models/Product.dart';
import 'package:flutter_app/widget/item_cart.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                child: ListTile(
                  title: Text(
                    'Заголовок',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Подзаголовок',
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productData.items.length,
                    itemBuilder: (context, int index) =>
                        ChangeNotifierProvider.value(
                          value: productData.items[index],
                          child: ItemCart(),
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('Каталог'),
              ),
              ...productData.items.map((value) {
                return CatalogListTile(value.imgUrl);
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
