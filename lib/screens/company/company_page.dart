import 'package:car_service_mobile/screens/company/widgets/rating/rating_resume_widget.dart';
import 'package:car_service_mobile/screens/company/widgets/tabs/tabs_widget.dart';
import 'package:car_service_mobile/screens/company/widgets/tags/tags_widget.dart';
import 'package:car_service_mobile/shared/models/company_model.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

enum CompanyState { success, loading, error, empty }

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    final CompanyModel _args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                          RatingResumeWidget(
                            rating: _args.rating,
                          )
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
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.80,
                          child: Text(
                            _args.address,
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
                      TagsWidget(sale: _args.sale, tags: _args.tags)
                    ],
                  ),
                ),
              ),
              TabsBarWidget(),
            ];
          },
          body: TabsViewWidget(company: _args),
        ),
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
