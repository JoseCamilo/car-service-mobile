import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<_ItemDashboard> dashboardGridHome = [
    _ItemDashboard(
      title: 'Lavagem',
      icon: Icons.auto_awesome,
      onClick: () => {},
      color: Colors.green,
    ),
    _ItemDashboard(
      title: 'Pneu',
      icon: Icons.album_outlined,
      onClick: () => {},
      color: Colors.amber,
    ),
    _ItemDashboard(
      title: 'Óleo',
      icon: Icons.invert_colors_on_outlined,
      onClick: () => {},
      color: Colors.blue,
    ),
    _ItemDashboard(
      title: 'Elétrica',
      icon: Icons.flash_on_outlined,
      onClick: () => {},
      color: Colors.purple,
    ),
    _ItemDashboard(
      title: 'Mecanica',
      icon: Icons.build_outlined,
      onClick: () => {},
      color: Colors.orange,
    ),
    _ItemDashboard(
      title: 'Funilaria',
      icon: Icons.auto_fix_high,
      onClick: () => {},
      color: Colors.red,
    ),
  ];

  int _currentIndex = 0;

  List carouselList = [
    _ItemCarousel(
      title: 'Lavagem',
      subtitle: 'em casa',
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
      onClick: () => {},
      colors: [
        Color(0xFFDD1800),
        Color(0xFFFF5F37),
      ],
    ),
    _ItemCarousel(
      title: 'Ajustes',
      subtitle: 'grátis',
      onClick: () => {},
      colors: [
        Color(0xff5f2c82),
        Color(0xff49a09d),
      ],
    ),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Car Service'),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image(
                    image: AssetImage('assets/home.jpg'),
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
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
                              ? Colors.blueAccent
                              : Colors.grey,
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text('List Item $index'),
                );
              },
              childCount: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemDashboard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onClick;
  final Color color;

  _ItemDashboard({
    @required this.title,
    @required this.icon,
    @required this.color,
    @required this.onClick,
  })  : assert(title != null),
        assert(icon != null),
        assert(color != null),
        assert(onClick != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        color: this.color,
        child: InkWell(
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
