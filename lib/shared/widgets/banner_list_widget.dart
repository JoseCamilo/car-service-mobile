import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:flutter/material.dart';

class ItemBannerListWidget extends StatelessWidget {
  final CompanyModel company;

  ItemBannerListWidget({@required this.company});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () => _showCompany(
            context: context,
            company: this.company,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.33,
                    width: MediaQuery.of(context).size.width * 0.80,
                    child: Stack(
                      children: [
                        Visibility(
                          visible: this.company.assetImage[0].isNotEmpty &&
                              this.company.assetImage[0].contains('http'),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.33,
                            width: MediaQuery.of(context).size.width * 0.80,
                            child: ClipRRect(
                              child: FadeInImage.assetNetwork(
                                placeholder: 'assets/images/loading1.gif',
                                image: this.company.assetImage[0],
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: this.company.sale.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.0)),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        this.company.sale,
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
                            ),
                            Visibility(
                              visible: this.company.stars != null,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.20,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black54,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(6.0)),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(right: 3),
                                          child: Icon(
                                            Icons.star,
                                            color: Colors.white,
                                            size: 16,
                                          ),
                                        ),
                                        Text(
                                          this
                                              .company
                                              .stars
                                              .toString()
                                              .replaceAll('.', ','),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Text(
                                          '/5',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.79,
                      child: Text(
                        this.company.title,
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
                visible: this.company.subtitle.isNotEmpty,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.79,
                        child: Text(
                          this.company.subtitle,
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
    CompanyModel company,
  }) {
    Navigator.of(context).pushNamed(
      'company',
      arguments: company,
    );
  }
}
