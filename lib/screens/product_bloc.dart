import 'dart:async';

class ProductsBloc {
  List productList = ['MicroFone', 'Caixa-som', 'Teclado', 'Camera'];

  Stream<List<String>> get fetchProducts async* {
    List<String> auxList = [];
    for (var value in productList) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      auxList.add(value);
      yield auxList;
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
