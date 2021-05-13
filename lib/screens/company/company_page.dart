import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:car_service_mobile/shared/widgets/services_company_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:transparent_image/transparent_image.dart';

class CompanyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CompanyModel _args = ModalRoute.of(context).settings.arguments;
    Widget _ratingWidgetColumn = Column();
    List<Widget> _tags = [];
    Widget _titleRecommendedSliver = SliverToBoxAdapter();
    Widget _itemsRecommendedSliver = SliverToBoxAdapter();
    Widget _titleServiceSliver = SliverToBoxAdapter();
    Widget _itemsServiceSliver = SliverToBoxAdapter();

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

    if (_args.stars != null) {
      _ratingWidgetColumn = Column(
        children: [
          Text(
            '${_args.stars.toString().replaceAll('.', ',')}',
            style: TextStyle(
              color: Colors.amber[700],
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SmoothStarRating(
            rating: _args.stars,
            isReadOnly: false,
            size: 14,
            filledIconData: Icons.star,
            halfFilledIconData: Icons.star_half,
            defaultIconData: Icons.star_border,
            starCount: 5,
            allowHalfRating: true,
            color: Colors.amber[700],
            borderColor: Colors.amber[700],
          ),
          Text(
            '${_args.ratings}',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      );
    }

    if (_args.servicesRecommended.length > 0) {
      _titleRecommendedSliver = SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Destaques',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      );

      _itemsRecommendedSliver = SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ItemServicesCompanyWidget(
              title: _args.servicesRecommended[index].title,
              description: _args.servicesRecommended[index].description,
              time: _args.servicesRecommended[index].time,
              price: _args.servicesRecommended[index].price,
              offer: _args.servicesRecommended[index].offer,
            );
          },
          childCount: _args.servicesRecommended.length,
        ),
      );
    }

    if (_args.services.length > 0) {
      _titleServiceSliver = SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 24.0, left: 16.0, bottom: 8.0),
              child: Text(
                'Serviços',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ],
        ),
      );

      _itemsServiceSliver = SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return ItemServicesCompanyWidget(
              title: _args.services[index].title,
              description: _args.services[index].description,
              time: _args.services[index].time,
              price: _args.services[index].price,
              offer: _args.services[index].offer,
            );
          },
          childCount: _args.services.length,
        ),
      );
    }

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
                _args.title,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  shadows: _shadowsTitleAppBar,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1,
                      enableInfiniteScroll: false,
                    ),
                    items: _args.assetImage
                        .map((image) => ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6)),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: image,
                                fit: BoxFit.fill,
                              ),
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _args.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      _ratingWidgetColumn
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.67,
                      child: Text(
                        _args.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
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
                        _args.subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
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
          _titleRecommendedSliver,
          _itemsRecommendedSliver,
          _titleServiceSliver,
          _itemsServiceSliver,
        ],
      ),
    );
  }
}

final List<Shadow> _shadowsTitleAppBar = [
  Shadow(
    color: Colors.white,
    blurRadius: 3,
    offset: Offset(-1, 1.5),
  ),
  Shadow(
    color: Colors.white,
    blurRadius: 5,
    offset: Offset(-1, 2),
  ),
  Shadow(
    color: Colors.white,
    blurRadius: 20,
    offset: Offset(-1, 2),
  ),
  Shadow(
    color: Colors.white,
    blurRadius: 3,
    offset: Offset(1, -1.5),
  ),
  Shadow(
    color: Colors.white,
    blurRadius: 5,
    offset: Offset(1, -2),
  ),
  Shadow(
    color: Colors.white,
    blurRadius: 20,
    offset: Offset(1, -2),
  )
];
