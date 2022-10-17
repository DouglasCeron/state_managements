import 'dart:async';

class ProductsBloc {
  List productList = ['MicroFone', 'Caixa-som', 'Teclado', 'Camera'];

  Stream<List<String>> get fetchProducts async* {
    List<String> productList = [];
    for (var value in productList) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      productList.add(value);
      yield productList;
    }
  }

  final StreamController<int> _productsCounter = StreamController<int>();

  Stream<int> get productsCounter => _productsCounter.stream;

  ProductsBloc() {
    fetchProducts.listen(
      (event) => _productsCounter.add(
        event.length,
      ),
    );
  }

  void dispose() {
    _productsCounter.close();
  }
}
