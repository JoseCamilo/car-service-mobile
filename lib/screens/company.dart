import 'package:car_service_mobile/components/services_company.dart';
import 'package:car_service_mobile/models/screen_arguments.dart';
import 'package:flutter/material.dart';

class Company extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    List<ItemServicesCompany> listServices = [
      ItemServicesCompany(
        title: 'Serviço Rápido',
        description: 'Um serviço simples e feito em poucos minutos',
        time: '10-20 min',
        price: '50',
      ),
      ItemServicesCompany(
        title: 'Serviço Intermediário',
        description: 'Um serviço comum e feito em poucas horas',
        time: '1-4 hs',
        price: '150',
      ),
      ItemServicesCompany(
        title: 'Serviço Complexo',
        description: 'Um serviço comcomplexidade alto com prazo maior',
        time: '5-25 hs',
        price: '850',
      ),
      ItemServicesCompany(
        title: 'Serviço Rápido',
        description: 'Um serviço simples e feito em poucos minutos',
        time: '10-20 min',
        price: '30',
      ),
      ItemServicesCompany(
        title: 'Serviço Intermediário',
        description: 'Um serviço comum e feito em poucas horas',
        time: '1-4 hs',
        price: '150',
      ),
      ItemServicesCompany(
        title: 'Serviço Complexo',
        description: 'Um serviço comcomplexidade alto com prazo maior',
        time: '5-25 hs',
        price: '850',
      ),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            pinned: true,
            expandedHeight: 200.0,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                args.title,
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetImage(args.image),
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.6),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x90FFFFFF),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.67,
                      child: Text(
                        args.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.67,
                      child: Text(
                        args.description,
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
                        args.address,
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
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.25,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            args.sale,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
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
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Destaques',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: listServices[index],
                );
              },
              childCount: listServices.length,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Serviços',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
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
