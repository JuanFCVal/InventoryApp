import 'package:flutter/material.dart';

import '../../../UI/colors.dart';
import '../../../UI/textStyles.dart';
import '../../../models/shipments.dart';

class ShipmentCard extends StatelessWidget {
  const ShipmentCard({
    super.key,
    required this.shipment,
  });

  final Shipment shipment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: ColorMap.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${"Cargamento #${shipment.id}"} - ${shipment.name}",
            style: TextStyles.h5Style(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Icon(
                Icons.lock_clock,
                color: Colors.white,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                "${shipment.hour} ${shipment.date}",
                style: TextStyles.p(color: Colors.white),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              CircleAvatar(
                  maxRadius: 30,
                  backgroundImage: NetworkImage(shipment.profilePicture)),
              const SizedBox(
                width: 10,
              ),
              Text(
                shipment.driver,
                style: TextStyles.p(color: Colors.white),
              )
            ],
          )
        ],
      ),
    );
  }
}
