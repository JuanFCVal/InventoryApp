import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:inventory_app/UI/colors.dart';

class EstimationPage extends StatelessWidget {
  EstimationPage({super.key});
  dynamic menuOptions = {
    "options": [
      {
        "route": "Estimación de medicamentos",
        "image": "https://cdn-icons-png.flaticon.com/512/7656/7656399.png",
        "children": [
          {
            "icon": const Icon(Icons.macro_off),
            "title": "Revisar Control Stock",
            "route": "stock"
          },
          {
            "icon": const Icon(Icons.macro_off),
            "title": "Revisar Históricos",
            "route": "stock"
          },
          {
            "icon": const Icon(Icons.macro_off),
            "title": "Proyección anual",
            "route": "stock"
          }
        ]
      },
      {
        "route": "Estimación de insumos",
        "image":
            "https://img.freepik.com/vector-premium/doctor-medicina-inyecciones-medicamentos-personaje-dibujos-animados_193274-104.jpg",
        "children": [
          {
            "icon": const Icon(Icons.macro_off),
            "title": "Estimaciones",
            "route": "stock"
          }
        ]
      },
      {
        "route": "Estimación de dispositivos",
        "image":
            "https://www.shutterstock.com/shutterstock/videos/1073817029/thumb/3.jpg?ip=x480",
        "children": [
          {
            "icon": const Icon(Icons.macro_off),
            "title": "Dispositivos",
            "route": "stock"
          }
        ]
      },
    ]
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(color: ColorMap.primary),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: menuOptions['options'].length,
              itemBuilder: (BuildContext context, int index) {
                final option = menuOptions['options'][index];
                return Accordion(
                    maxOpenSections: 1,
                    scaleWhenAnimating: true,
                    openAndCloseAnimation: true,
                    headerPadding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    children: [
                      AccordionSection(
                        isOpen: false,
                        headerBackgroundColor: Colors.grey[200],
                        headerBackgroundColorOpened: Colors.grey[200],
                        contentBackgroundColor: Colors.yellow[200],
                        header: Text(
                          option['route'],
                          style: TextStyle(
                              color: ColorMap.primary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        content: Column(
                          children: [
                            ...option['children'].map((child) {
                              return ListTile(
                                leading: child['icon'],
                                title: Text(child['title']),
                                onTap: () {
                                  Navigator.pushNamed(context, child['route']);
                                },
                              );
                            })
                          ],
                        ),
                        contentHorizontalPadding: 10,
                        contentBorderWidth: 1,
                      ),
                    ]);
              },
            ))
          ],
        ),
      ),
    ));
  }
}
