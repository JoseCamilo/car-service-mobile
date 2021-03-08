import 'package:car_service_mobile/models/screen_arguments.dart';
import 'package:flutter/material.dart';

class ItemBannerList extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final String description;
  final String sale;

  ItemBannerList({
    @required this.title,
    this.subtitle = '',
    this.assetImage = '',
    this.description = '',
    this.sale = '',
  }) : assert(title != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () => _showCompany(
            context: context,
            name: this.title,
            image: this.assetImage,
            description: this.description,
            address: this.subtitle,
            sale: this.sale,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: this.assetImage.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.33,
                      width: MediaQuery.of(context).size.width * 0.80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        image: DecorationImage(
                          image: AssetImage(this.assetImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Visibility(
                        visible: this.sale.isNotEmpty,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black54,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6.0)),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      this.sale,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.79,
                      child: Text(
                        this.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Visibility(
                visible: subtitle.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.79,
                        child: Text(
                          this.subtitle,
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
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Divider(
                  color: Colors.black12,
                  height: 0,
                  thickness: 1,
                  indent: 100,
                  endIndent: 100,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _showCompany({
    BuildContext context,
    String name,
    String image,
    String description,
    String address,
    String sale,
  }) {
    Navigator.of(context).pushNamed(
      'company',
      arguments: ScreenArguments(
        title: name,
        image: image,
        description: description,
        address: address,
        sale: sale,
      ),
    );
  }
}
