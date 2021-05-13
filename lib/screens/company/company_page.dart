import 'package:car_service_mobile/shared/widgets/services_company_widget.dart';
import 'package:car_service_mobile/shared/models/screen_arguments.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments _args = ModalRoute.of(context).settings.arguments;
    List<Widget> _tags = [];

    List<ItemServicesCompanyWidget> listServices = [
      ItemServicesCompanyWidget(
        title: 'Serviço Rápido',
        description: 'Um serviço simples e feito em poucos minutos',
        time: '10-20 min',
        price: '50',
      ),
      ItemServicesCompanyWidget(
        title: 'Serviço Intermediário',
        description: 'Um serviço comum e feito em poucas horas',
        time: '1-4 hs',
        price: '150',
      ),
      ItemServicesCompanyWidget(
        title: 'Serviço Complexo',
        description: 'Um serviço comcomplexidade alto com prazo maior',
        time: '5-25 hs',
        price: '850',
      ),
      ItemServicesCompanyWidget(
        title: 'Serviço Rápido',
        description: 'Um serviço simples e feito em poucos minutos',
        time: '10-20 min',
        price: '30',
      ),
      ItemServicesCompanyWidget(
        title: 'Serviço Intermediário',
        description: 'Um serviço comum e feito em poucas horas',
        time: '1-4 hs',
        price: '150',
      ),
      ItemServicesCompanyWidget(
        title: 'Serviço Complexo',
        description: 'Um serviço comcomplexidade alto com prazo maior',
        time: '5-25 hs',
        price: '850',
      ),
    ];

    if (_args.tags != null) {
      for (var i = 0; i < _args.tags.length; i++) {
        _tags.add(
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.check_rounded,
                            size: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: _args.tags[i],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.black12,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            pinned: true,
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                _args.title,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage.memoryNetwork(
                    placeholder: kTransparentImage,
                    image: _args.image,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.transparent,
                          Colors.white
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.5, 1],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _args.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber[700],
                                  ),
                                ),
                                TextSpan(
                                  text: '${_args.stars} (${_args.ratings})',
                                  style: TextStyle(
                                    color: Colors.amber[700],
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.67,
                        child: Text(
                          _args.description,
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
                      padding: const EdgeInsets.only(top: 0.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.80,
                        child: Text(
                          _args.address,
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
                    Wrap(
                      children: [
                        Visibility(
                          visible: _args.sale.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8, right: 8),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black54,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(6.0)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      WidgetSpan(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8),
                                          child: Icon(
                                            Icons.local_offer_rounded,
                                            size: 15,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      TextSpan(
                                        text: _args.sale,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ..._tags,
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 16.0, bottom: 8.0),
                    child: Text(
                      'Destaques',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: listServices[index],
                );
              },
              childCount: listServices.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 16.0, bottom: 8.0),
                    child: Text(
                      'Serviços',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: listServices[index],
                );
              },
              childCount: listServices.length,
            ),
          ),
        ],
      ),
    );
  }
}
