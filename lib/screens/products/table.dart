import 'package:azn_hollyfood_flutter_app/models/product.dart';
import 'package:azn_hollyfood_flutter_app/services/database_services.dart';
import 'package:azn_hollyfood_flutter_app/services/methods.dart';
import 'package:azn_hollyfood_flutter_app/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
// qr code scanner
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ProductsTable extends StatefulWidget {
  const ProductsTable({super.key, required this.title});
  final String title;

  @override
  State<ProductsTable> createState() => _ProductsTableState();
}

class _ProductsTableState extends State<ProductsTable> {
  late DataBaseService _db;
  String _searchText = '';
  final TextEditingController _searchController = TextEditingController();
  List<Product?> _products = [];
  List<Product?> _filteredProducts = [];
  final NavigationService _nav = GetIt.I<NavigationService>();

  late final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');
  late QRViewController _controller;
  bool loading = false;

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  bool isBarCodeSearchText = false;
  String msg = '';

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
    _db = GetIt.I<DataBaseService>();
    _getProducts()
        .onError((error, stackTrace) => throw Exception('Error getting users'));
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
          .where((product) => (isBarCodeSearchText
              ? product!.barcode == searchText
              : product!.name.contains(searchText)))
          .toList();
    });
  }

  Future<String?> scanBarcode() async {
    try {
      final barcode = await _controller.scannedDataStream.first;
      return barcode.code;
    } catch (e) {
      AppMethods.showErrorOrWarningDialog(
          context: context,
          func: () {},
          isError: true,
          subtitle: 'הסר קוד הברקוד נכשל');
    }
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
            IconButton(
              onPressed: _showAddNewProductDialog,
              icon: const FaIcon(FontAwesomeIcons.plus),
            ),
            isBarCodeSearchText
                ? const Text('חיפוש לפי ברקוד')
                : const Text('חיפוש לפי שם'),
            if (isBarCodeSearchText)
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
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
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
                  onPressed: () async {
                    setState(() {
                      isBarCodeSearchText = !isBarCodeSearchText;
                    });
                  },
                  icon: isBarCodeSearchText
                      ? const FaIcon(FontAwesomeIcons.barcode)
                      : const Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchText = '';
                      _filteredProducts = _products;
                    });
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _productsList() {
    return Expanded(
      child: ListView.builder(
        itemCount: _filteredProducts.length,
        itemBuilder: (context, index) {
          Product product = _filteredProducts[index]!;
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

  void _showAddNewProductDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('הוספת מוצר חדש'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'שם המוצר',
                          hintText: 'שם המוצר',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'שדה חובה';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _quantityController,
                        decoration: const InputDecoration(
                          labelText: 'כמות',
                          hintText: 'כמות',
                        ),
                        validator: isValidQuantity,
                      ),
                      TextFormField(
                        controller: _priceController,
                        decoration: const InputDecoration(
                          labelText: 'מחיר',
                          hintText: 'מחיר',
                        ),
                        validator: isValidPrice,
                      ),
                      TextFormField(
                        controller: _barcodeController,
                        decoration: const InputDecoration(
                          labelText: 'ברקוד',
                          hintText: 'ברקוד',
                        ),
                        validator: isValidBarCode,
                      ),
                      IconButton(
                        onPressed: () async {
                          String? barcode = await scanBarcode();
                          if (barcode != null) {
                            _barcodeController.text = barcode;
                          }
                        },
                        icon: const FaIcon(FontAwesomeIcons.barcode),
                      ),
                    ],
                  ),
                ),
                if (msg.isNotEmpty)
                  Text(
                    msg,
                    style: const TextStyle(color: Colors.red),
                  ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('ביטול'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('הוספה'),
              onPressed: () async {
                try {
                  setState(() {
                    msg = '';
                    loading = true;
                  });
                  if (_formKey.currentState!.validate()) {
                    await _db
                        .getProductByBarCode(_barcodeController.text)
                        .then((product) {
                      if (product != null) {
                        throw Exception('מוצר עם ברקוד זה כבר קיים');
                      }
                    });
                    final product = Product(
                      name: _nameController.text,
                      quantity: int.parse(_quantityController.text),
                      price: double.parse(_priceController.text),
                      barcode: _barcodeController.text,
                      imageUrl:
                          'https://img.freepik.com/premium-photo/delicious-espresso-coffee-white-cup-croissant-white-background_829625-57.jpg?w=740',
                    );
                    await _db.createOrFoundProduct(product).onError(
                        (error, stackTrace) =>
                            throw Exception('הוספת מוצר נכשלה'));
                    setState(() {
                      msg = 'מוצר נוסף בהצלחה';
                      _nav.goBack();
                      _nav.navigateToRoute(Routes.productsTable);
                    });
                  }
                } catch (e) {
                  msg = e.toString();
                } finally {
                  setState(() {
                    loading = false;
                  });
                }
              },
            ),
          ],
        );
      },
    );
  }

  String? isValidPrice(String? value) {
    if (value!.isEmpty || value.isEmpty) {
      return 'שדה חובה';
    }
    if (double.tryParse(value) == null) {
      return 'מחיר לא תקין';
    }
    return null;
  }

  String? isValidBarCode(String? value) {
    if (value!.isEmpty || value.isEmpty) {
      return 'שדה חובה';
    }
    if (value.length != 13) {
      return 'ברקוד לא תקין';
    }
    return null;
  }

  String? isValidQuantity(String? value) {
    if (value!.isEmpty || value.isEmpty) {
      return 'שדה חובה';
    }
    if (int.tryParse(value) == null) {
      return 'כמות לא תקינה';
    }
    return null;
  }
}
