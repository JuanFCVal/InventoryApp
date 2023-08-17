import 'package:flutter/material.dart';
import 'package:inventory_app/UI/colors.dart';
import 'package:inventory_app/pages/home/widgets/modal_item.dart';
import 'package:inventory_app/pages/home/widgets/service_item.dart';
import 'package:inventory_app/pages/home/widgets/shipment_card.dart';
import 'package:inventory_app/providers/shipmentProvider.dart';
import 'package:provider/provider.dart';

import '../../UI/textStyles.dart';
import '../../providers/sessionProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  openModalPlaneation(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              decoration: BoxDecoration(color: Colors.yellow[100]),
              child: ListView(
                children: [
                  ModalOptionItem(
                    text: "Estimación de suministros",
                    icon: Icons.home,
                    onClick: () {
                      Navigator.pushNamed(context, 'estimation');
                    },
                  ),
                  ModalOptionItem(
                    text: "Estimación de costos",
                    icon: Icons.car_crash,
                  ),
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    final sessionProvider = Provider.of<SessionProvider>(context);
    final shipmentProvider = Provider.of<ShipmentProvider>(context);
    (shipmentProvider.getShipment());
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorMap.primary,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                            maxRadius: 60,
                            backgroundImage: NetworkImage(
                                sessionProvider.currentUser.profilePicture)),
                        const SizedBox(
                          height: 0,
                        ),
                        Text(
                          "Bienvenido",
                          style: TextStyles.h1Style(color: Colors.white),
                        ),
                        Text(
                          '${sessionProvider.currentUser.name} ${sessionProvider.currentUser.lastName}',
                          style: TextStyles.h1Style(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Servicios",
                          textAlign: TextAlign.start,
                          style: TextStyles.h3Style(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 100,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              ServiceItem(
                                  title: "Planeación",
                                  image:
                                      "https://cdn-icons-png.flaticon.com/512/4838/4838786.png",
                                  onClick: () => openModalPlaneation(context)),
                              ServiceItem(
                                title: "Abastecimiento",
                                image:
                                    "https://cdn-icons-png.flaticon.com/512/7541/7541900.png",
                              ),
                              ServiceItem(
                                title: "Stock",
                                image:
                                    "https://cdn-icons-png.flaticon.com/512/5164/5164023.png",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Últimas entradas",
                          textAlign: TextAlign.start,
                          style: TextStyles.h3Style(color: Colors.black),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: shipmentProvider.shipments.length,
                            itemBuilder: (BuildContext context, int index) {
                              final shipment =
                                  shipmentProvider.shipments[index];
                              return ShipmentCard(shipment: shipment);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
