import 'package:car_service_mobile/screens/filter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;
    List<_ItemDashboard> dashboardGridHome = [
      _ItemDashboard(
        title: 'Lavagem',
        icon: Icons.auto_awesome,
        onClick: () => {_showFilter(context)},
      ),
      _ItemDashboard(
        title: 'Pneu',
        icon: Icons.album_outlined,
        onClick: () => {},
      ),
      _ItemDashboard(
        title: 'Óleo',
        icon: Icons.invert_colors_on_outlined,
        onClick: () => {},
      ),
      _ItemDashboard(
        title: 'Elétrica',
        icon: Icons.flash_on_outlined,
        onClick: () => {},
      ),
      _ItemDashboard(
        title: 'Mecanica',
        icon: Icons.build_outlined,
        onClick: () => {},
      ),
      _ItemDashboard(
        title: 'Funilaria',
        icon: Icons.auto_fix_high,
        onClick: () => {},
      ),
    ];
    List carouselList = [
      _ItemCarousel(
        title: 'Lavagem',
        subtitle: 'em casa',
        assetImage: 'assets/flutter_dev.png',
        onClick: () => {},
        colors: [
          Color(0xffff4000),
          Color(0xffffcc66),
        ],
      ),
      _ItemCarousel(
        title: 'Troca Grátis',
        subtitle: 'de óleo',
        assetImage: 'assets/flutter_dev.png',
        onClick: () => {},
        colors: [
          Color(0xFF008AC6),
          Color(0xFF00BFFF),
        ],
      ),
      _ItemCarousel(
        title: 'Leva e Trás',
        assetImage: 'assets/flutter_dev.png',
        onClick: () => {},
        colors: [
          Color(0xFFDD1800),
          Color(0xFFFF5F37),
        ],
      ),
      _ItemCarousel(
        title: 'Ajustes',
        subtitle: 'grátis',
        assetImage: 'assets/flutter_dev.png',
        onClick: () => {},
        colors: [
          Color(0xff5f2c82),
          Color(0xff49a09d),
        ],
      ),
    ];

    List recomendedList = [
      _ItemBanner(
        title: 'Eco Clean',
        subtitle: '3.5 km Rua Euclides, 265, 09111-110, Santo André',
        assetImage: 'assets/home.jpg',
        onClick: () => {},
      ),
      _ItemBanner(
        title: 'Lumar Elétrica',
        subtitle: '5.5 km Rua Euclides, 265, 09111-110, Santo André',
        assetImage: 'assets/flutter_dev.png',
        onClick: () => {},
      ),
      _ItemBanner(
        title: 'Floresta Funilaria e Pintura',
        subtitle: '1.5 km Av Queiróz Filho, 265, 09111-110, Santo André',
        assetImage: 'assets/home.jpg',
        onClick: () => {},
      ),
      _ItemBanner(
        title: 'Bosh',
        subtitle: '3.9 km Rua Euclides, 265, 09111-110, Santo André',
        assetImage: 'assets/home.jpg',
        onClick: () => {},
      ),
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetImage('assets/car_service_logo.jpg'),
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 3),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x70000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 0,
              crossAxisSpacing: 0,
              childAspectRatio: 2.0,
              crossAxisCount: 2,
            ),
            delegate: SliverChildListDelegate(
              dashboardGridHome,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 6),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      aspectRatio: 2.0,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    items: carouselList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            child: card,
                          ),
                        );
                      });
                    }).toList(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(carouselList, (index, url) {
                      return Container(
                        width: 10.0,
                        height: 10.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _currentIndex == index
                              ? Theme.of(context).accentColor
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 8.0),
              child: Text(
                'Ofertas especiais',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 310.0,
                      enableInfiniteScroll: false,
                    ),
                    items: recomendedList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: card,
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 8.0),
              child: Text(
                'Recomendado para você',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 310.0,
                      enableInfiniteScroll: false,
                    ),
                    items: recomendedList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: card,
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 8.0),
              child: Text(
                'Aberto agora',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
              child: Column(
                children: <Widget>[
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 310.0,
                      enableInfiniteScroll: false,
                    ),
                    items: recomendedList.map((card) {
                      return Builder(builder: (BuildContext context) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          child: card,
                        );
                      });
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }
}

class _ItemDashboard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;

  _ItemDashboard({
    @required this.title,
    @required this.icon,
    @required this.onClick,
  })  : assert(title != null),
        assert(icon != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: Theme.of(context).primaryColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: this.onClick,
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  this.icon,
                  color: Colors.white,
                  size: 40,
                ),
                Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ItemCarousel extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final Function onClick;
  final List<Color> colors;

  _ItemCarousel({
    @required this.title,
    this.subtitle = '',
    this.assetImage = '',
    @required this.colors,
    @required this.onClick,
  })  : assert(title != null),
        assert(colors != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: this.colors,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 90,
                child: Text(this.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold)),
              ),
              Visibility(
                visible: subtitle.isNotEmpty,
                child: Container(
                  width: 90,
                  child: Text(this.subtitle,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                visible: this.assetImage.isNotEmpty,
                child: Image.asset(
                  this.assetImage,
                  height: 180.0,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _ItemBanner extends StatelessWidget {
  final String title;
  final String subtitle;
  final String assetImage;
  final Function onClick;

  _ItemBanner({
    @required this.title,
    this.subtitle = '',
    this.assetImage = '',
    @required this.onClick,
  })  : assert(title != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Visibility(
            visible: this.assetImage.isNotEmpty,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220.0,
                  width: 310.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6.0)),
                    image: DecorationImage(
                      image: AssetImage(this.assetImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 8.0),
                child: Text(
                  this.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: subtitle.isNotEmpty,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                  child: SizedBox(
                    width: 300.0,
                    child: Text(
                      this.subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void _showFilter(BuildContext context) {
  Navigator.of(context).push(
    (MaterialPageRoute(
      builder: (context) => Filter(),
    )),
  );
}
