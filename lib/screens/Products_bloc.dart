import 'dart:async';

class ProductsBloc {
  List PRODUCTS = ['MicroFone', 'Caixa-som', 'Teclado', 'Camera'];

  Stream<List<String>> get fetchProducts async* {
    List<String> productList = [];
    for (var value in PRODUCTS) {
      await Future.delayed(
        const Duration(seconds: 2),
      );
      productList.add(value);
      yield productList;
    }
  }

  StreamController<int> _productsCounter = StreamController<int>();

  Stream<int> get productsCounter => _productsCounter.stream;

  ProductsBloc() {
    this.fetchProducts.listen(
          (event) => this._productsCounter.add(
                event.length,
              ),
        );
  }

  void dispose() {
    _productsCounter.close();
  }
}
