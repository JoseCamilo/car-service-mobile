import 'dart:async';

import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DetailsWidget extends StatelessWidget {
  final CompanyModel company;

  const DetailsWidget({Key key, @required this.company}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _contactBuild;
    List<Widget> _contactBuildItems = [];

    if (company.geolocation != null) {
      _contactBuildItems.add(
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16),
          child: SizedBox(
            child: Text(
              'Como chegar',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      );

      Completer<GoogleMapController> _controller = Completer();

      final LatLng _position = LatLng(
        company.geolocation.latitude,
        company.geolocation.longitude,
      );

      Set<Marker> _markers = new Set<Marker>();
      final Marker _marker = Marker(
        markerId: MarkerId(company.address),
        position: _position,
        infoWindow: InfoWindow(
          title: company.title,
          snippet: company.address,
        ),
      );
      _markers.add(_marker);

      _contactBuildItems.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Container(
            height: 200,
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _position,
                zoom: 17,
              ),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              markers: _markers,
              gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                Factory<OneSequenceGestureRecognizer>(
                  () => EagerGestureRecognizer(),
                ),
              },
            ),
          ),
        ),
      );

      _contactBuildItems.add(SizedBox(
        height: 24,
      ));
    }

    if (company.phones.length > 0) {
      _contactBuildItems.add(
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Text(
              'Contatos',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(color: Colors.black, fontSize: 20),
            ),
          ),
        ),
      );
      for (var i = 0; i < company.phones.length; i++) {
        _contactBuildItems.add(PhoneContactWidget(
          type: company.phones[i].type,
          number: company.phones[i].number,
        ));
      }
    }

    if (company.descriptionContact.isNotEmpty) {
      _contactBuildItems.add(
        Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            child: Text(
              company.descriptionContact.replaceAll('<enter>', '\n'),
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14.0,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    _contactBuild = ListView(
      physics: NeverScrollableScrollPhysics(),
      children: _contactBuildItems,
    );

    return _contactBuild;
  }
}

class PhoneContactWidget extends StatelessWidget {
  final String type;
  final String number;

  PhoneContactWidget({
    Key key,
    @required this.type,
    @required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FaIcon icon = FaIcon(
      FontAwesomeIcons.phoneAlt,
      color: Theme.of(context).primaryColor,
      size: 21,
    );

    if (type == '2') {
      icon = FaIcon(
        FontAwesomeIcons.whatsapp,
        color: Colors.greenAccent[700],
        size: 24,
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 4),
      child: Row(
        children: [
          icon,
          SizedBox(
            width: 12,
          ),
          Text(
            number,
            style: TextStyle(color: Colors.black, fontSize: 14),
          )
        ],
      ),
    );
  }
}
