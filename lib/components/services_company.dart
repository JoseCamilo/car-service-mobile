import 'package:flutter/material.dart';

class ItemServicesCompany extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String time;

  ItemServicesCompany({this.title, this.description, this.price, this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.67,
                        child: Text(
                          this.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.67,
                        child: Text(
                          this.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.67,
                        child: Text(
                          'R\$ $price',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.23,
                      child: Text(
                        time,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            child: Divider(
              color: Colors.black12,
              height: 0,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
          ),
        ],
      ),
    );
  }
}
