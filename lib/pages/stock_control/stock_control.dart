import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/UI/buttonStyle.dart';
import 'package:provider/provider.dart';

import '../../providers/shipmentProvider.dart';
import '../../shared/header.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
    (shipmentProvider.getStockItems());
    return SafeArea(
        child: Scaffold(
      appBar: Header(
        height: MediaQuery.of(context).size.height * 0.15,
        title: "STOCK",
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 10, right: 30),
                child: TextField(
                  controller: _controller,
                  onChanged: (value) => {},
                  decoration: const InputDecoration(
                    hintText: 'Ingrese el nombre del producto',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                  ),
                )),
            Expanded(
              child: DataTable2(
                  columnSpacing: 0,
                  horizontalMargin: 12,
                  minWidth: 500,
                  columns: const [
                    DataColumn2(
                      label: Text('Nombre'),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Text('Categoría'),
                    ),
                    DataColumn(
                      label: Text('Caducidad'),
                    ),
                    DataColumn(
                      label: Text('Cantidad'),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                      shipmentProvider.stockItems.length,
                      (index) => DataRow(cells: [
                            DataCell(
                                Text(shipmentProvider.stockItems[index].name)),
                            DataCell(Text(
                                shipmentProvider.stockItems[index].category)),
                            DataCell(Text(shipmentProvider
                                .stockItems[index].expirationDate)),
                            DataCell(Text(shipmentProvider
                                .stockItems[index].quantity
                                .toString())),
                          ]))),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.grey[200],
              child: Center(
                  child: ElevatedButton(
                onPressed: () {},
                style: BttStyles.succes(),
                child: const Text("Descargar"),
              )),
            )
          ],
        ),
      ),
    ));
  }
}
