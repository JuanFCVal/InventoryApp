import 'package:flutter/material.dart';
import 'package:inventory_app/providers/shipmentProvider.dart';
import 'package:provider/provider.dart';

import '../../UI/textStyles.dart';
import '../../providers/sessionProvider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                height: MediaQuery.of(context).size.height * 0.4,
                child: Stack(
                  children: [
                    Container(
                      color: Colors.blue,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CircleAvatar(
                                maxRadius: 60,
                                backgroundImage: NetworkImage(sessionProvider
                                    .currentUser.profilePicture)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Bienvenido",
                              style: TextStyles.h1Style(color: Colors.white),
                            ),
                            Text(
                              '${sessionProvider.currentUser.name} ${sessionProvider.currentUser.lastName}',
                              style: TextStyles.h1Style(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
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
                        Text(
                          "Servicios",
                          textAlign: TextAlign.start,
                          style: TextStyles.h3Style(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  maxRadius: 35,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                    "https://cdn-icons-png.flaticon.com/512/4838/4838786.png",
                                  ),
                                ),
                                Text("Planeación")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  maxRadius: 35,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/512/7541/7541900.png"),
                                ),
                                Text("Abastecimiento")
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  maxRadius: 35,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      "https://cdn-icons-png.flaticon.com/512/5164/5164023.png"),
                                ),
                                Text("Stock")
                              ],
                            )
                          ],
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
                              return Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${"Cargamento #${shipment.id}"} - ${shipment.name}"),
                                    Row(
                                      children: [
                                        const Icon(Icons.lock_clock),
                                        Text(
                                            "${shipment.hour} ${shipment.date}")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CircleAvatar(
                                            maxRadius: 30,
                                            backgroundImage: NetworkImage(
                                                shipment.profilePicture)),
                                        Text(shipment.driver)
                                      ],
                                    )
                                  ],
                                ),
                              );
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
