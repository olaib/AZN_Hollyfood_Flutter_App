import 'package:azn_hollyfood_flutter_app/models/product.dart';
import 'package:azn_hollyfood_flutter_app/services/database_services.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
// qr code scanner
import 'package:qr_code_scanner/qr_code_scanner.dart';

class PurchasesScreen extends StatefulWidget {
  const PurchasesScreen(
      {super.key, required this.title, required this.onSelect});
  final String title;
  final void Function(dynamic) onSelect;

  @override
  State<PurchasesScreen> createState() => _PurchasesScreenState();
}

class _PurchasesScreenState extends State<PurchasesScreen> {
  late final DataBaseService _db;
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();
  List<Product?> _products = [];
  List<Product?> _filteredProducts = [];

  late final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;
  bool loading = false;

  Future<void> _getProducts() async {
    loading = true;
    await _db.getProducts().then((List<Product?> dbProducts) {
      setState(() {
        _products = _filteredProducts = dbProducts;
      });
    });
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    _getProducts()
        .onError((error, stackTrace) => throw Exception('Error getting users'));
    _db = GetIt.I<DataBaseService>();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      if (_products.isEmpty) {
        return;
      }
      final product =
          _products.firstWhere((product) => product!.barcode == scanData.code);
      _filteredProducts = [product];
    });
  }

  void _filterProducts() {
    final searchText = _searchController.text;
    if (searchText.isEmpty || _products.isEmpty) {
      return;
    }
    setState(() {
      _filteredProducts = _products
          .where((product) => product!.name.contains(searchText))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('רכש'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _searchBar(),
            const SizedBox(height: 10),
            Expanded(
              child: Stack(
                children: <Widget>[
                  QRView(
                    key: _qrKey,
                    onQRViewCreated: onQRViewCreated,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      child: FloatingActionButton(
                        onPressed: () async {
                          await _controller.toggleFlash();
                        },
                        child: const Icon(Icons.flash_on),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            (loading)
                ? const Center(child: CircularProgressIndicator())
                : _productsList(),
          ],
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: TextFormField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchText = value;
              _filterProducts();
            });
          },
          decoration: InputDecoration(
            labelText: 'חיפוש',
            hintText: 'חיפוש',
            prefixIcon: IconButton(
              onPressed: _filterProducts,
              icon: const Icon(Icons.search),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            // on submit
            suffixIcon: IconButton(
              onPressed: () {
                _searchController.clear();
                setState(() {
                  _searchText = '';
                  _filterProducts();
                });
              },
              icon: const Icon(Icons.clear),
            ),
          ),
        ),
      ),
    );
  }

  Widget _productsList() {
    return Expanded(
      child: ListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        Product product = _products[index]!;
        return Card(
          child: ListTile(
            leading: Image.network(
                'https://img.freepik.com/premium-photo/delicious-espresso-coffee-white-cup-croissant-white-background_829625-57.jpg?w=740'),
            title: Text(product.name),
            subtitle: Text(
                'Barcode: ${product.barcode}\nQuantity: ${product.quantity}\nPrice: ${product.price}'),
          ),
        );
      },
    ),
    );
  }
}
