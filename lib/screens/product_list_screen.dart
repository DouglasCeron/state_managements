import 'package:flutter/material.dart';
import 'package:state_managements/screens/Products_bloc.dart';

class ProductListScreen extends StatelessWidget {
  ProductListScreen({Key? key}) : super(key: key);

  final ProductsBloc productsBloc = ProductsBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: StreamBuilder(
            stream: productsBloc.productsCounter,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              return Text('n° ${snapshot.data ?? 0}');
            },
          ),
        ),
        body: StreamBuilder(
          stream: productsBloc.fetchProducts,
          builder: (_, AsyncSnapshot<List<String>> snapshot) {
            print(snapshot.data);
            final products = snapshot.data ?? [];
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(products[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
