import 'package:car_service_mobile/components/banner_carousel.dart';
import 'package:car_service_mobile/components/banner_list.dart';

class DataBase {
  List<ItemBannerList> listBanner = [
    ItemBannerList(
      title: 'Eco Clean',
      subtitle: '3.5 km Rua Euclides, 265, 09111-110, Santo André',
      assetImage: 'assets/home.jpg',
      description: 'Lavagem ecologica',
      sale: 'Em domicílio',
    ),
    ItemBannerList(
      title: 'Lumar Elétrica',
      subtitle: '5.5 km Rua Euclides, 265, 09111-110, Santo André',
      assetImage: 'assets/flutter_dev.png',
      description: 'Auto Elétrica',
      sale: '30% OFF',
    ),
    ItemBannerList(
      title: 'Floresta Funilaria e Pintura',
      subtitle: '1.5 km Av Queiróz Filho, 265, 09111-110, Santo André',
      assetImage: 'assets/home.jpg',
      description: 'Funilaria e Pintura',
      sale: '15% OFF',
    ),
    ItemBannerList(
      title: 'Bosh',
      subtitle: '3.9 km Rua Euclides, 265, 09111-110, Santo André',
      assetImage: 'assets/home.jpg',
      description: 'Car Certer Services',
    ),
  ];
  List<ItemBannerCarousel> recomendedList = [
    ItemBannerCarousel(
      title: 'Eco Clean',
      subtitle: '3.5 km Rua Euclides, 265, 09111-110, Santo André',
      assetImage: 'assets/home.jpg',
      description: 'Lavagem ecologica',
      sale: 'Em domicílio',
    ),
    ItemBannerCarousel(
      title: 'Lumar Elétrica',
      subtitle: '5.5 km Rua Euclides, 265, 09111-110, Santo André',
      assetImage: 'assets/flutter_dev.png',
      description: 'Auto Elétrica',
      sale: '30% OFF',
    ),
    ItemBannerCarousel(
      title: 'Floresta Funilaria e Pintura',
      subtitle: '1.5 km Av Queiróz Filho, 265, 09111-110, Santo André',
      assetImage: 'assets/home.jpg',
      description: 'Funilaria e Pintura',
      sale: '15% OFF',
    ),
    ItemBannerCarousel(
      title: 'Bosh',
      subtitle: '3.9 km Rua Euclides, 265, 09111-110, Santo André',
      assetImage: 'assets/home.jpg',
      description: 'Car Certer Services',
    ),
  ];
}
