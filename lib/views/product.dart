import 'dart:convert';

import 'package:automa/models/product.dart';
import 'package:automa/services/remote_service.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  // List<Product>? products;
  DataTableSource _data = DataTable(products: [], recordsTotal: 0);
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    Map<String, dynamic>? data = await RemoteService().getProduct();
    int recordsTotal = data!['data']['productPaginationResponse']['totalPages'];
    var content =
        jsonEncode(data!['data']['productPaginationResponse']['content']);
    var products = productFromJson(content);
    if (products != null) {
      setState(() {
        isLoaded = true;
      });

      _data = DataTable(products: products, recordsTotal: recordsTotal);

      print(_data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prodotti'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(35, 35, 35, 1),
      ),
      body: Visibility(
        visible: isLoaded,
        child: Column(children: [
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('ID')),
              DataColumn(label: Text('Serial Number'))
            ],
            source: _data,
            header: Center(child: Text('Lista Prodotti')),
            columnSpacing: 150,
            horizontalMargin: 100,
            rowsPerPage: 10,
          )
        ]),
        replacement: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class DataTable extends DataTableSource {
  DataTable({required this.products, required this.recordsTotal});

  List<Product>? products;
  int recordsTotal;

  @override
  DataRow? getRow(int index) {
    return DataRow(cells: [
      DataCell(Text(products![index].id.toString())),
      DataCell(Text(products![index].serialNumber)),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => recordsTotal;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
